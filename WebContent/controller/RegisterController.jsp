<%@ page language="java" import="java.util.*,service.RegisterService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

	
	String username = request.getParameter("username").toString();
	String username1 = request.getParameter("username1").toString();
	String password = request.getParameter("password").toString();
	String shortProfile = request.getParameter("shortProfile").toString();
	String getPath = request.getParameter("headerPic").toString();
	String headerPic = getPath.substring(12);
	int sex = Integer.parseInt(request.getParameter("sex"));
	
	
	if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
		out.print("-1");
	}

	RegisterService registerService = new RegisterService();
	User user = new User();
	user.setId(UUID.randomUUID().toString());
	user.setUsername(username);
	user.setUsername1(username1);
	user.setPassword(password);
	user.setShortProfile(shortProfile);
	user.setHeaderPic(headerPic);
	user.setSex(sex);
	registerService.saveUser(user);
	out.print("1");
	
%>