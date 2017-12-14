<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.GroupService"%>
<%@ page language="java" import="service.EventService"%>
<% GroupService groupService = new GroupService(); %>
<% EventService eventService = new EventService(); %>
<%
    String id = request.getParameter("id");
    Map<String,Object> group = groupService.getContentByGroupId(id);
    Map<String,Object> owner = groupService.getOwnerByGroupId(id);
    List<Map<String,Object>> events = eventService.getEventsByGroupId(id);
    pageContext.setAttribute("group", group);
    pageContext.setAttribute("owner", owner);
    pageContext.setAttribute("events", events);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recipe</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/group1.css"/>
	
</head>
<body>

<!-- head area -->
<%@include file="common/header.jsp" %>

<div class='wrap'>
	<div class='left'>
		<!-- content area -->
		<div class='recipe'>
			<div class='title'>${group.title}</div>
			<div class='category'><span class='light-font'>Owner：</span><span class='info'>${owner.username1}</span></div>
			<div class='publicDate'><span class='light-font'>Create Time：</span><span class='info'>${group.createTime}</span></div>
			<hr/>
			<div class='content'>
				
				<div class="demo_line">———————————<span>DESCRPTION</span>————————————</div>
				<br>${group.description}		
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<div class='joinButton'>
			<input type="button" value="JOIN THIS GROUP" class="button">
		</div>
		<div class='clearfix'></div>		
	</div>	
	<div class='right'>
	<center>
		<div class='word'>EVENTS OF THIS GROUP:
			<c:forEach items="${events}" var="event">
        		<input class='eventButton' type="button" value= "${event.title}" onclick="events('${event.id}')">
     		</c:forEach>
		</div>
	</center>
	</div>
	
</div>

<div class='clearfix'></div>

<!-- bottom area -->
<%@include file="common/footer.jsp" %>

<script>
$(".button").eq(0).on('click',function(){
    $.post("${basePath}/controller/GroupMemberController.jsp",{groupId : "${group.id}"},function(data){
        data = data.trim();
        if(data == '-1'){
            alert('PLEASE LOGIN FIRST！');
            window.location.href = "${basePath}/login.jsp";
        }else if(data == '1'){
            alert('SUCCEED！');
            location.reload();
        }
    });
});

function events(id){
    var a = document.createElement("a");
    a.href = "event.jsp?id=" + id; 
    console.log(a);
    a.target = '_new'; //open in new window
    a.click();//trigger click
}
</script>

</body>
</html>