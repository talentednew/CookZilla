<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.EventService"%>
<% EventService eventService = new EventService(); %>
<%
    String id = request.getParameter("id");
    Map<String,Object> event = eventService.getContentByEventId(id);
    Map<String,Object> group = eventService.getGroupByEventId(id);
    pageContext.setAttribute("event", event);
    pageContext.setAttribute("group", group);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EVENT</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/event1.css"/>

	
</head>
<body>

<!-- head area -->
<%@include file="common/header.jsp" %>

<div class='wrap'>
	<div class='left'>
		<!-- content area -->
		<div class='recipe'>
			<div class='title'>${event.title}</div>
			<div class='category'><span class='light-font'>Group：</span><span class='info'>${group.title}</span></div>
			<div class='publicDate'><span class='light-font'>Create Time：</span><span class='info'>${event.createTime}</span></div>
			<div class='publicDate'><span class='light-font'>Event Time：</span><span class='info'>${event.eventTime} ${event.section}</span></div>
			<hr/>
			<div class='content'>
				<div class="demo_line">———————————<span>DESCRPTION</span>————————————</div>
				<br>${event.description}		
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<div class='joinButton'>
			<input type="button" value="RSVP" class="button">
		</div>
		<div class='clearfix'></div>		
	</div>
	<div class='right'>
		<div class='word'>THE GROUP THAT SPONSORED THIS EVENT:
			<input class='groupButton' type="button" value= "${event.groupTitle}" onclick="group('${event.groupId}')">
		</div>
	</div>	
</div>


<div class='clearfix'></div>

<!-- bottom area -->
<%@include file="common/footer.jsp" %>

<script>
$(".button").eq(0).on('click',function(){
    $.post("${basePath}/controller/EventMemberController.jsp",{eventId : "${event.id}"},function(data){
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