package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import bean.EventMember;
import util.DataBaseUtils;

public class EventMemberService {
	public void saveMember(EventMember eventMember){
	    String sql = "insert into EventMember(id,memberId,eventId,rsvpTime) values(?,?,?,?)";
	    DataBaseUtils.update(sql,eventMember.getId(),eventMember.getMemberId(),
	    		eventMember.getEventId(),new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
	}
	
	public List<Map<String,Object>> getEventsByUserId(String id){
	    String sql = "select b.id, b.title "
	    		+ "from EventMember a inner join Events b where a.eventId = b.id and a.memberId = ?";		
	    return DataBaseUtils.queryForList(sql, id);
	}
	
//	public static void main(String[] args) {
//	
//		EventMemberService eventMemberService = new EventMemberService();
//		EventMember eventMember = new EventMember();
//		eventMember.setId(UUID.randomUUID().toString());
//		eventMember.setMemberId("eb04ef6c-a60f-4766-9de7-faafbca0dee9");
//		eventMember.setEventId("2");
//		eventMemberService.saveMember(eventMember);
//	}
}
