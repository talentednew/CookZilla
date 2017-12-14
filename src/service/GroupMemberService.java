package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import bean.GroupMember;
import util.DataBaseUtils;

public class GroupMemberService {
	public void saveMember(GroupMember groupMember){
	    String sql = "insert into GroupMember(id,memberId,groupId,joinTime) values(?,?,?,?)";
	    DataBaseUtils.update(sql,groupMember.getId(),groupMember.getMemberId(),
	    		groupMember.getGroupId(),new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
	}
	
	public List<Map<String,Object>> getGroupsByUserId(String id){
	    String sql = "select b.id, b.title "
	    		+ "from GroupMember a inner join Groups b where a.groupId = b.id and a.memberId = ?";		
	    return DataBaseUtils.queryForList(sql, id);
	}
	
	public List<Map<String,Object>> getUsersByGroupId(String id){
	    String sql = "select memberId "
	    		+ "from GroupMember where groupId = ?";	
	    return DataBaseUtils.queryForList(sql, id);
	}
}
