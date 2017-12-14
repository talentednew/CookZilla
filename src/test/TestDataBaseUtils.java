package test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import bean.User;
import util.DataBaseUtils;

public class TestDataBaseUtils {

	public static void main(String[] args) {
		//Connection conn = DataBaseUtils.getConnection();
		//System.out.println(conn);

		//User user = DataBaseUtils.queryForBean("select * from User  limit 1", User.class);
		//System.out.println(user);
		
		DataBaseUtils.config("jdbc.properties");
		Map map;
		User user;
		try {
			map = DataBaseUtils.queryForMap("select * from GroupMember where groupId = ? and memberId = ?","6dbfe786-4abb-435a-a221-c2cb3ac87880","eaa26659-ac2f-47bf-b095-d370faf780a8");
			//user = DataBaseUtils.queryForBean("select * from User  limit 1", User.class);
			System.out.println(map);
			//System.out.println(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
