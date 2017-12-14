package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import bean.Events;
import bean.Groups;
import util.DataBaseUtils;

public class EventService {
	public List<Map<String,Object>> getEvents(){
	    String sql = "select * "
	    		+ "from Events where 1 = 1 "
	    		+ "order by eventTime asc";
	    return DataBaseUtils.queryForList(sql);
	}
	
	public Map<String, Object> getContentByEventId(String id) {
		String sql = "select * from Events where id = ?";
	    return DataBaseUtils.queryForList(sql,id).get(0);
	}
	
	public Map<String, Object> getGroupByEventId(String id) {
		String sql = "select a.id, a.title from Groups a inner join Events b where b.id = ?";
	    return DataBaseUtils.queryForList(sql,id).get(0);
	}
	
	public List<Map<String,Object>> getEventsByGroupId(String id){
	    String sql = "select * "
	    		+ "from Events where groupId = ? ";
	    return DataBaseUtils.queryForList(sql, id);
	}
	
	public List<Map<String,Object>> getEvents(Integer start,Integer end){
		String sql = "select * from Events where 1 = 1 "
	    		+ "order by createTime desc limit ?,?";
		return DataBaseUtils.queryForList(sql, start, end);
	}
	
	public void saveEvent(Events event){
		String createTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
	    String sql = "insert into Events(id,groupId,groupTitle,title,description,createTime,eventTime,section) values(?,?,?,?,?,?,?,?)";
	    DataBaseUtils.update(sql, event.getId(), event.getGroupId(), event.getGroupTitle(), event.getTitle(), event.getDescription(), createTime, event.getEventTime(),event.getSection());
	}
	
//	public static void main(String[] args) {
//	EventService eventService = new EventService();
//	List list = eventService.getEventsByGroupId("1");
//	//List list = recipeService.getContentByRecipeId("035fc2d5-0990-4a85-8fb3-6f0b662f4ca1");
//	System.out.println(list);
//}
}
