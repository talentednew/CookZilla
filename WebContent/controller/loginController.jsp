<%@ page language="java" import="java.util.*,service.LoginService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

	//get the data from clinet
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	//if the username and password are not empty
	if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
		out.print("-1");//error code -1 :  username and password can not be empty！
	}else{
		//LoginService
		LoginService loginService = new LoginService();
		//check whether the username exists
		User user = loginService.getUser(username);
		if(user == null){
			out.print("-2");//error code-2 :   username does not exist！
		}else
			//if exist check whether it is correct
			if(!username.equals(user.getUsername()) || !password.equals(user.getPassword())){
				out.print("-3");//error code -3 :  username or password not correct！
			}else{
				//if can reach this level, then the username and password are correct, store these in a session
				out.print("1");
				session.setAttribute("user", user);
				session.setAttribute("username", user.getUsername());
				session.setAttribute("username1", user.getUsername1());
				session.setAttribute("headerPic", user.getHeaderPic());
			}
	}
	
%>