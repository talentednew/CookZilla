<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.SearchService"%>
<%@ page language="java" import="util.StringUtils,bean.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SEARCH RESULTS</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/searchPage.css"/>
	
</head>
<body>

<!-- head area -->
<%@include file="common/header.jsp" %>


<!-- Content Area -->
<div style='border:1px solid #ccc'>
	<%
		//
		List<Map<String,Object>>  recipes10 = (List)session.getAttribute("recipes");
		pageContext.setAttribute("recipes10", recipes10);
	%>
		<div class='recipeTag'>
		<div class='title'>RECIPES</div>
		<ul class='recipes'>
			<c:forEach items="${recipes10}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width="100%" height="150px"></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find all the group
		List<Map<String,Object>>  groups10 = (List)session.getAttribute("groups");
		pageContext.setAttribute("groups10", groups10);
	%>
	
	<div class='groupTag'>
		<div class='title'>GROUPS</div>
		<ul class='groups'>
			<c:forEach items="${groups10}" var="item">
				<li class='group' onclick="group('${item.id}');">
					<div class='group-banner'>
						<div class='group-title' title = "${item.title}">${item.title}</div>
					</div>
					<div class='group-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find all the group
		List<Map<String,Object>>  events10 = (List)session.getAttribute("events");
		pageContext.setAttribute("events10", events10);
	%>
	
	<div class='eventTag'>
		<div class='title'>EVENTS</div>
		<ul class='events'>
			<c:forEach items="${events10}" var="item">
				<li class='event' onclick="eventDetail('${item.id}');">
					<div class='event-banner'>
						<div class='event-header'>${item.eventTime} ${item.section}</div>
						<div class='event-title' title = "${item.title}">${item.title}</div>
					</div>
					<div class='event-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
</div>

<!-- Bottom Page -->
<%@include file="common/footer.jsp" %>

<script>
	//click and move to recipe
	function recipe(id){
	    var a = document.createElement("a");
	    a.href = "recipe.jsp?id=" + id; 
	    console.log(a);
	    a.target = '_new'; //open in new window
	    a.click();//trigger click
	}
	
	function group(id){
	    var a = document.createElement("a");
	    a.href = "group.jsp?id=" + id; 
	    console.log(a);
	    a.target = '_new'; //open in new window
	    a.click();//trigger click
	}
	
	function eventDetail(id){
	    var a = document.createElement("a");
	    a.href = "event.jsp?id=" + id; 
	    console.log(a);
	    a.target = '_new'; //open in new window
	    a.click();//trigger click
	}
</script>
</body>
</html>