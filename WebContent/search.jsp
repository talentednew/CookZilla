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
<title>SEARCH</title>

</head>
<body>
	<!-- head area -->
	<%@include file="common/header.jsp" %>
	
	<div class = 'open'>
		<div class='search'>
			<input type='text' id="search" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Find a recipe"/>
		</div>
		<input type="button" class="button" value="search"/>
	</div>
	
	<script language="javascript">
	
	$('.open').eq(0).on('click','.button',function(){
		
		var search = "%" + $('#search').val() + "%";
	    $.post("${basePath}/controller/SearchController.jsp",{search : search},function(data){
	    	data = data.trim();
	        if(data == -1){
	            alert('It can not be empty!');
	        }
	        else if(data == -2){
	            alert('Sorry！No any result.');
	        }
	        else{
	            alert('Yes！We found something for you!');
	            window.location.href = "${basePath}/searchPage.jsp";
	        }
	    });
	});
	
	</script>

</body>
</html>