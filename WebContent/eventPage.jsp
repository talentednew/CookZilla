<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.EventService"%>
<% EventService eventService = new EventService(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EVENT</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/eventPage.css"/>
</head>
<body>
<!-- head area -->
<%@include file="common/header.jsp" %>

<!-- content Area -->
<div style='border:1px solid #ccc'>
<br/>
<a href="createEvent.jsp"><input class="post" type="button" value= "NEW EVENT"></input></a>
<br/>
	
	<%
		//Find all the group
		List<Map<String,Object>> events2 = eventService.getEvents();
		pageContext.setAttribute("events2", events2);
	%>
	
	<div class='eventTag'>
		<div class='title'>EVENTS</div>
		<ul class='events'>
			<c:forEach items="${events2}" var="item">
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
	//click and move to event
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