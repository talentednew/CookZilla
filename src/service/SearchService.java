package service;

import java.util.List;
import java.util.Map;

import util.DataBaseUtils;

public class SearchService {
	public List<Map<String,Object>> getRecipesBySearchText(String search1, String search2, String search3, String search4){
	    String sql = "select * "
	    		+ "from Recipe where header like ? or ingredient1 like ? or ingredient2 like ? or name like ?";	
	    return DataBaseUtils.queryForList(sql, search1, search2, search3, search4);
	}
	
	public List<Map<String,Object>> getGroupsBySearchText(String search1, String search2){
	    String sql = "select * "
	    		+ "from Groups where title like ? or description like ?";	
	    return DataBaseUtils.queryForList(sql, search1, search2);
	}
	
	public List<Map<String,Object>> getEventsBySearchText(String search1, String search2){
	    String sql = "select * "
	    		+ "from Events where title like ? or description like ?";	
	    return DataBaseUtils.queryForList(sql, search1, search2);
	}
	
	/**
	 * test
	 * @param args
	 */
//	public static void main(String[] args) {
//		
//		SearchService ss = new SearchService();
//		//System.out.println(cs.getReviewsByArticleId("fb6b70ea-4023-45a3-9106-561649803805"));
//		
//		List list = ss.getEventsBySearchText("%a%", "%a%");
//		System.out.println(list);
//
//	}
}
