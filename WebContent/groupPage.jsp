<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.GroupService"%>
<% GroupService groupService = new GroupService(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RECIPE</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/groupPage.css"/>
</head>
<body>
<!-- head area -->
<%@include file="common/header.jsp" %>

<!-- Content Area -->
<div style='border:1px solid #ccc'>
<br/>
<a href="createGroup.jsp"><input class="post" type="button" value= "NEW GROUP"></input></a>
<br/>
	
	<%
		//Find all the group
		List<Map<String,Object>> groups2 = groupService.getGroups();
		pageContext.setAttribute("groups2", groups2);
	%>
	
	<div class='category'>
		<div class='title'>GROUPS</div>
		<ul class='items'>
			<c:forEach items="${groups2}" var="item">
				<li class='item' onclick="group('${item.id}');">
					<div class='item-banner'>
						<div class='item-header' title = "${item.title}">${item.title}</div>
					</div>
					<div class='item-description'>${item.description}</div>
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
	function group(id){
	    var a = document.createElement("a");
	    a.href = "group.jsp?id=" + id; 
	    console.log(a);
	    a.target = '_new'; //open in new window
	    a.click();//trigger click
	}
</script>
</body>
</html>