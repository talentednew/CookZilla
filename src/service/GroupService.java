package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import bean.Groups;
import bean.Recipe;
import bean.User;
import util.DataBaseUtils;

public class GroupService {
	public List<Map<String,Object>> getGroups(){
	    String sql = "select * "
	    		+ "from Groups where 1 = 1 "
	    		+ "order by createTime desc";
	    return DataBaseUtils.queryForList(sql);
	}
	
	public Map<String, Object> getContentByGroupId(String id) {
		String sql = "select * from Groups where id = ?";
	    return DataBaseUtils.queryForList(sql,id).get(0);
	}
	
	public List<Map<String,Object>> getGroups(Integer start,Integer end){
		String sql = "select * from Groups where 1 = 1 "
	    		+ "order by createTime desc limit ?,?";
		return DataBaseUtils.queryForList(sql, start, end);
	}
	
	public Map<String, Object> getOwnerByGroupId(String id) {
		String sql = "select * from User a inner join Groups b where b.id = ?";
	    return DataBaseUtils.queryForList(sql,id).get(0);
	}
	
	public void saveGroup(Groups group){
		String createTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
	    String sql = "insert into Groups(id,ownerId,title,description,createTime) values(?,?,?,?,?)";
	    DataBaseUtils.update(sql, group.getId(), group.getOwnerId(), group.getTitle(), group.getDescription(), createTime);
	}
	
//	/**
//	 * test
//	 * @param args
//	 */
//	public static void main(String[] args) {
//		GroupService groupService = new GroupService();
//		List list = groupService.getGroups();
//		List list = recipeService.getContentByRecipeId("035fc2d5-0990-4a85-8fb3-6f0b662f4ca1");
//		System.out.println(list);
//	}
//	public static void main(String[] args) {
//		
//		GroupService groupService = new GroupService();	
//	
//		Groups group = new Groups();
//		group.setId(UUID.randomUUID().toString());
//		group.setOwnerId("8d4bc55b-2044-418c-a356-d3c183abf69a");
//		group.setTitle("Love It");
//		group.setDescription("Hahahahaha");
//		groupService.saveGroup(group);
//		System.out.println("succeed！");
//	
//	}

}
