<%@ page language="java" import="java.util.*,service.EventMemberService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

	//get the data from client
	String eventId = request.getParameter("eventId").toString();
	
	User user = (User)session.getAttribute("user");
    if(user==null){//user didn't login
        out.print("-1");
        return;
    }

	EventMemberService eventMemberService = new EventMemberService();
	EventMember eventMember = new EventMember();
	eventMember.setId(UUID.randomUUID().toString());
	eventMember.setMemberId(user.getId());
	eventMember.setEventId(eventId);
	eventMemberService.saveMember(eventMember);
	out.print("1");
	
%>