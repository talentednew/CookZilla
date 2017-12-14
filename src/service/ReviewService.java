package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import bean.Review;
import util.DataBaseUtils;

public class ReviewService {
	public void saveComment(Review comment){
	    String sql = "insert into Review(id,user_id,content,recipe_id,create_time, rating) values(?,?,?,?,?,?)";
	    DataBaseUtils.update(sql,comment.getId(),comment.getUserId(),
	            comment.getContent(),comment.getRecipeId(),new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()), comment.getRating());
	}
	
	
	/**
	 * get reviews by recipe id
	 * @param id
	 * @return
	 */
	public List<Map<String,Object>> getReviewsByRecipeId(String id){
	    return DataBaseUtils.queryForList("select b.username1 ,a.content, a.rating from Review a left JOIN User b " +
	             "on a.user_id = b.id  where a.recipe_id = ?", id);
	}

}
