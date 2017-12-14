<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/login.css"/>
<title>LOGIN PAGE</title>

</head>
<body>
	<!-- head area -->
	<%@include file="common/header.jsp" %>
	

	<!-- show -->
	<div class='show'>
		<img src = "static/img/msg.jpg" ></img>
	</div>
	
	<!-- login area -->
	<div class='content'>
		<div class='logo'>SIGN IN</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Login name">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="password" id="password" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Password">
		</div>
		
		<div class='mt50 ml32'>
			<button class="login_btn" onclick="login()">LOG IN</button>
		</div>
	</div>
	
	<script>
		
		function login(){
			var username = $('#username').val();
			var password = $('#password').val();
			$.ajax({
				type:"post",//request method
				url:"${basePath}/controller/loginController.jsp",
				data:{"username":username,"password":password},
				error:function(){
					alert("Login error！");
				},
				success:function(data){
					if(data == -1){
						alert('Please fill out login name and password！');
					}else if(data == -2){
						alert('The login name you specified does not exists！');
					}else if(data == -3){
						alert('The login and/or password you specified are not correct！');
					}else{
						window.location.href = "${basePath}"; 
					}
				}
			});
			
			
		}
		
	</script>

</body>
</html>