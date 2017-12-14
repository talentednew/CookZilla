package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import bean.Recipe;
import util.DataBaseUtils;

public class PostService {
	public void saveRecipe(Recipe recipe){
		String createTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
	    String sql = "insert into Recipe(id,header,name,content,author,create_time,user_id,category_id,ingredient1,ingredient2,pic) values(?,?,?,?,?,?,?,?,?,?,?)";
	    DataBaseUtils.update(sql, recipe.getId(), recipe.getHeader(), recipe.getName(), recipe.getContent(), 
	    					recipe.getAuthor(), createTime, recipe.getUserId(), recipe.getCategoryId(), 
	    					recipe.getIngredient1(), recipe.getIngredient2(),recipe.getPic());
	}

	/**
	 * test
	 * @param args
	 */
}
