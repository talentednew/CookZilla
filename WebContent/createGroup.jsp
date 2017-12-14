<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/createGroup.css"/>
<title>REGISTER PAGE</title>

</head>
<body>
	<!-- head area -->
	<%@include file="common/header.jsp" %>
		
	<!-- register -->
	<div class='content'>
		<div class='logo'>CREATE NEW GROUP</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="title" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Group title">
		</div>
		<br>
		<textarea class = 'des_input' id="description" autofocus="autofocus" autocomplete="off" maxlength="600" placeholder="Description(Maximum 600 words)"></textarea>
		
		
		<div class='mt50 ml32'>
			<button class="create_btn" onclick="create()">SUBMIT</button>
		</div>
	</div>
	
	<script language="javascript">
		
		
		function create(){
			var title = $('#title').val();
			var description = $('#description').val();
			$.ajax({
				type:"post",
				url:"${basePath}/controller/GroupController.jsp",
				data:{"title":title,"description":description},//json data send to controller
				error:function(){
					alert("Create error！");
				},
				success:function(data){
					if(data == -1){
						alert('Please sign in first！');
						window.location.href = "${basePath}/login.jsp";
					}else if(data == 1){
						alert('Congratulations! Your group has been created!');
						//Back to home page after group created.
						window.location.href = "${basePath}/groupPage.jsp"; 
					}
				}
			});	
		}
		
		
	</script>

</body>
</html>