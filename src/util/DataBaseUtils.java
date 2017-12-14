package util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import bean.User;

public class DataBaseUtils {
	
	private static String username; //username
	private static String password; //password
	private static String dataBaseName; //database 
	
	static {
		config("jdbc.properties");
	}

	

	/**
	 * basic information of database
	 * @return
	 */
	public static void config(String path){
		InputStream inputStream = DataBaseUtils.class.getClassLoader().getResourceAsStream(path);
		Properties p = new Properties();
		try {
			p.load(inputStream);
			username = p.getProperty("db.username");
			password = p.getProperty("db.password");
			dataBaseName = p.getProperty("db.dataBaseName");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * get the connection of database
	 * @return
	 */
	public static Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection  = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dataBaseName+"?useUnicode=true&characterEncoding=utf8",username,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	/**
	 * close the connection
	 * @param connection
	 * @param statement
	 * @param rs
	 */
	public static void closeConnection(Connection connection,PreparedStatement statement,ResultSet rs){
		try {
			if(rs!=null)rs.close();
			if(statement!=null)statement.close();
			if(connection!=null)connection.close();
		} catch (Exception e) {
			e.fillInStackTrace();
		}
	}
	
	
	/**
	 * get the data from database and return as a list
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException
	 */
	public static List<Map<String,Object>> queryForList(String sql,Object...objects){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				statement.setObject(i+1, objects[i]);
			}
			
			rs = statement.executeQuery();
			while(rs.next()){
				ResultSetMetaData resultSetMetaData = rs.getMetaData();
				int count = resultSetMetaData.getColumnCount(); //get the sum of the list
				Map<String,Object> map = new HashMap<String, Object>();
				for (int i = 0; i < count; i++) {
					map.put(resultSetMetaData.getColumnName(i+1), rs.getObject(resultSetMetaData.getColumnName(i+1)));
				}
				result.add(map);
			};
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConnection(connection, statement, rs);
		}
		
		return result;
	}
	
	/**
	 *  get the data from database and return as a map
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException
	 */
	public static Map<String,Object> queryForMap(String sql,Object...objects) throws SQLException{
		Map<String,Object> result = new HashMap<String,Object>();
		List<Map<String,Object>> list = queryForList(sql, objects);
		if(list.size() != 1){
			return null;
		}
		result = list.get(0);
		return result;
	}
	
	/**
	 *  get the data from database and return as a list，and return a JavaBean
	 * @param sql
	 * @param clazz
	 * @param objects
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 */
	public static <T>T queryForBean(String sql,Class clazz,Object...objects){
		T obj = null;
		Map<String,Object> map = null;
		Field field = null;
		try {
			obj = (T) clazz.newInstance();   //create a new java bean
			map = queryForMap(sql, objects); //put the result in a map
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(map == null){
			return null;
		}
		//traverse Map
		for (String columnName : map.keySet()) {
			Method method = null;
			String propertyName = StringUtils.columnToProperty(columnName); //property name
			
			try {
				field = clazz.getDeclaredField(propertyName);
			} catch (NoSuchFieldException e1) {
				e1.printStackTrace();
			} catch (SecurityException e1) {
				e1.printStackTrace();
			} 
			//get the field from JavaBean
			String fieldType = field.toString().split(" ")[1]; //get the type of this field
			//System.out.println(fieldType);
			Object value = map.get(columnName);
			if(value == null){
				continue;
			}
			/**get the title of set method* */
			String setMethodName = "set" + StringUtils.upperCaseFirstCharacter(propertyName);
			//System.out.println(setMethodName);
			try {
				/**get the type of value* */
				String valueType = value.getClass().getName();
				
				/**check whether the type is correct* */
				if(!fieldType.equalsIgnoreCase(valueType)){
					if(fieldType.equalsIgnoreCase("java.lang.Integer")){
						value = Integer.parseInt(String.valueOf(value));
					}else if(fieldType.equalsIgnoreCase("java.lang.String")){
						value = String.valueOf(value);
					}else if(fieldType.equalsIgnoreCase("java.util.Date")){
						valueType = "java.util.Date";
						//change the value to java.util.Date
						String dateStr = String.valueOf(value);
						Timestamp ts = Timestamp.valueOf(dateStr);
						Date date = new Date(ts.getTime());
						value = date;
					}
				}
				
				/**get set method* */
				method = clazz.getDeclaredMethod(setMethodName,Class.forName(fieldType));
				/**execute set method* */
				method.invoke(obj, value);
			}catch(Exception e){
				/**if return error, then the type is not correct* */
				e.printStackTrace();
			}
		}
		return obj;
	}
	
	
	/**
	 * DML 
	 * @param sql
	 * @param objects
	 */
	public static void update(String sql,Object...objects){
		Connection connection = getConnection();
	    PreparedStatement statement = null;
	    try {
	    	statement = (PreparedStatement) connection.prepareStatement(sql);
	    	for (int i = 0; i < objects.length; i++) {
				statement.setObject(i+1, objects[i]);
			}
	    	statement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally{
	    	closeConnection(connection, statement, null);
	    }
	}
	
	
	
//	public static void main(String[] args) throws SQLException, NoSuchFieldException, SecurityException {
//		User user = DataBaseUtils.queryForBean("select * from User  limit 1", User.class);
//		System.out.println(user);
//	}
}
