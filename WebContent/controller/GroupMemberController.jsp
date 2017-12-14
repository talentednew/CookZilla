<%@ page language="java" import="java.util.*,service.GroupMemberService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

	//get the data from client
	String groupId = request.getParameter("groupId").toString();
	
	User user = (User)session.getAttribute("user");
    if(user==null){//user didn't login
        out.print("-1");
        return;
    }

	GroupMemberService groupMemberService = new GroupMemberService();
	GroupMember groupMember = new GroupMember();
	groupMember.setId(UUID.randomUUID().toString());
	groupMember.setMemberId(user.getId());
	groupMember.setGroupId(groupId);
	groupMemberService.saveMember(groupMember);
	out.print("1");
	
%>