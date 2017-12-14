package service;

import java.text.SimpleDateFormat;
import java.util.Date;

import bean.User;
import util.DataBaseUtils;

public class RegisterService {
	public void saveUser(User user){
		String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	    String sql = "insert into User(id,username,username1,password,shortProfile,createTime,sex,headerPic) values(?,?,?,?,?,?,?,?)";
	    DataBaseUtils.update(sql, user.getId(), user.getUsername(), user.getUsername1(), user.getPassword(), user.getShortProfile(), createTime, user.getSex(), user.getHeaderPic());
	}
	
	/**
	 * test
	 * @param args
	 */
//	public static void main(String[] args) {
//		
//		RegisterService rs = new RegisterService();
//		
//		
//		User user = new User();
//		user.setId(UUID.randomUUID().toString());
//		user.setUsername("Jack");
//		user.setUsername1("Rose");
//		user.setPassword("123456");
//		user.setShortProfile("Lover");
//		user.setCreateTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
//		//user.setHeaderPic(headerPic);
//		user.setSex(0);
//		rs.saveUser(user);
//		System.out.println("saved！");
//		
//		
//
//	}
}
