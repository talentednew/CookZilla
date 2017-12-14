package service;

import java.util.List;
import java.util.Map;

import util.DataBaseUtils;

public class RecipeService {
	/**
	 * get recipes by category id
	 * @param categoryId
	 * @param start 
	 * @param end  
	 */
	public List<Map<String,Object>> getRecipesByCategoryId(Integer categoryId,Integer start,Integer end){
	    String sql = "select * "
	    		+ "from Recipe where 1 = 1 "
	    		+ "and category_id = ? "
	    		+ "order by create_Time desc limit ?,?";
	    return DataBaseUtils.queryForList(sql, categoryId, start, end);
	}
	
	/**
	 * get content by recipeId
	 * @param id
	 * @return
	 */
	public Map<String,Object> getContentByRecipeId(String id){
	    String sql = "select * from Recipe a where a.id = ?";
	    return DataBaseUtils.queryForList(sql,id).get(0);
	}
	
	public List<Map<String,Object>> getRecipes(Integer start,Integer end){
		String sql = "select * from Recipe where 1 = 1 "
	    		+ "order by create_time desc limit ?,?";
		return DataBaseUtils.queryForList(sql, start, end);
	}
	
	public Map<String,Object> getUserByRecipeId(String id){
	    String sql = "select * from Recipe a inner join User b on a.user_id = b.id where a.id = ?";
	    return DataBaseUtils.queryForList(sql,id).get(0);
	}
	
	public List<Map<String,Object>> getRecipesByUserId(String id){
	    String sql = "select * from Recipe  where user_id = ?";
	    return DataBaseUtils.queryForList(sql,id);
	}
	
	public Map<String, Object> getRatingByRecipeId(String id){
		String sql = "select avg(rating) as avg_rating from Review where recipe_id = ?";
		return DataBaseUtils.queryForList(sql,id).get(0);
	}
	
	
	
	/**
	 * test
	 * @param args
	 */
//	public static void main(String[] args) {
//		RecipeService recipeService = new RecipeService();
//		List list = recipeService.getRecipesByUserId("1");
//		//Map<String, Object> list = recipeService.getContentByRecipeId("7de6cedc-ec19-4ed5-9223-4984f433179c");
//		System.out.println(list);
//	}
	

}
