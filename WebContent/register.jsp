<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/register.css"/>
<title>REGISTER PAGE</title>

</head>
<body>
	<!-- head area -->
	<%@include file="common/header.jsp" %>
	

	<!-- show -->
	<div class='show'>
		<img src = "static/img/msg.jpg" ></img>
	</div>
		
	<!-- register -->
	<div class='content'>
		<div class='logo'>SIGN UP</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username" autofocus="autofocus" autocomplete="off" maxlength="10" placeholder="Login name(Maximum 10 words)">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username1" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="User name">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="password" id="password" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Password">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="shortProfile" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Brief Introduction">
		</div>

		<div class="gender">
			<select id="sex">
				<option value=null>Gender</option>
            	<option value="0">Male</option>
                <option value="1">Female</option>
                <option value="2">Other</option>
        	</select>
		</div>
		<form action="registerController.jsp" onsubmit="return register()" method="post" enctype="multipart/form-data"> 
			<div class="upload">Portrait<input type="file" value="upload" id="headerPic"/></div>
		</form> 
		
		<div class='mt50 ml32'>
			<button class="register_btn" onclick="register()">REGISTER</button>
		</div>
	</div>
	
	<script language="javascript">
		
     	function getPath() {
     		var obj = document.getElementById("headerPic"); 
     		obj.select(); 
     		window.parent.document.body.focus(); 
     		var path = document.selection.createRange().text;
    	} 
		
		function register(){
			var username = $('#username').val();
			var username1 = $('#username1').val();
			var password = $('#password').val();
			var shortProfile = $('#shortProfile').val();
			var sex = $('#sex').val();
 			var headerPic=$('#headerPic').val();
			$.ajax({
				type:"post",//request method
				url:"${basePath}/controller/RegisterController.jsp",//request address
				data:{"username":username,"username1":username1,"password":password,"shortProfile":shortProfile, "sex":sex, "headerPic":headerPic},//send json data to controller
				error:function(){//if error, then rebind the event
					alert("Register error！");
				},
				success:function(data){ //return success for the callback function
					if(data == -1){
						alert('Please fill out login name and password！');
					}else if(data == 1){
						alert('Congratulations! Register succeed!');
						//back to home page after login
						window.location.href = "${basePath}"; 
					}
				}
			});
			
			
		}
		
	</script>

</body>
</html>