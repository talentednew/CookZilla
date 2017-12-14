<%@ page language="java" import="java.util.*,service.GroupService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

	//get the data from client
	String title = request.getParameter("title").toString();
	String description = request.getParameter("description").toString();
	
	User user = (User)session.getAttribute("user");
    if(user==null){//user didn't login
        out.print("-1");
        return;
    }

	GroupService groupService = new GroupService();
	Groups group = new Groups();
	group.setId(UUID.randomUUID().toString());
	group.setOwnerId(user.getId());
	group.setTitle(title);
	group.setDescription(description);
	groupService.saveGroup(group);
	out.print("1");
	
%>