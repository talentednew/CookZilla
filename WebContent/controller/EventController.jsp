<%@ page language="java" import="java.util.*, util.DataBaseUtils, service.EventService,service.GroupMemberService,service.GroupService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

	//get the data from client
	String title = request.getParameter("title").toString();
	String description = request.getParameter("description").toString();
	String eventTime = request.getParameter("eventTime").toString();
	String section = request.getParameter("section").toString();
	String str = request.getParameter("groupId").toString();
	String strs[] = str.split(",");
	String groupId = strs[0];
	String groupTitle = strs[1];
	
	User user = (User)session.getAttribute("user");
    if(user==null){//user didn't login
        out.print("-1");
        return;
    }
    
    //check whether the user has joined this group
    Map map = DataBaseUtils.queryForMap("select * from GroupMember where groupId = ? and memberId = ?",groupId,user.getId());
    if(map==null){
    	out.print("-2");
    	return;
    }
   	
	EventService eventService = new EventService();
	Events event = new Events();
	event.setId(UUID.randomUUID().toString());
	event.setGroupId(groupId);
	event.setGroupTitle(groupTitle);
	event.setTitle(title);
	event.setDescription(description);
	event.setEventTime(eventTime);
	event.setSection(section);
	eventService.saveEvent(event);
	out.print("1");
	
%>