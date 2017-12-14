package test;

import java.util.List;
import java.util.UUID;

import org.junit.Test;

import bean.Recipe;
import util.DataBaseUtils;

public class TestInsertOperation {
	/**
	 *  test：insert 
	 */
	@Test
	public void insertRecipe(){
		String sql = "INSERT INTO Recipe(id,header,name,content,author,"
	            + "create_time,user_id,category_id) VALUES (?,?,?,?,?,?,?,?) ";
		String id = UUID.randomUUID().toString(); //primary key
		String header = "Doritos Taco Salad";
		String name  = "Taco";
		String content = "'Cook crumbled hamburger until no longer pink.";
		String author = "Harry Potter";
		String create_time = "2015-10-12 23:05:30";
		String userId = "319600c3-550a-4f9f-80cf-deebe2376528";
		int categoryId = 2;
		DataBaseUtils.update(sql, id,header,name,content,author,create_time,userId,categoryId);
		System.out.println("add succeed！");
	}
	
	/**
	 * get the recipe
	 */
	@Test
	public void getRecipe(){
	    String sql = "select * from Recipe where id = ?";
	    Recipe recipe = DataBaseUtils.queryForBean(sql, Recipe.class, "035fc2d5-0990-4a85-8fb3-6f0b662f4ca1");
	    System.out.println(recipe);
	}
	
	/**
	 * get the list
	 */
	@Test
	public void getCategoryList(){
	    String sql = "select * from Tag";
	    List list = DataBaseUtils.queryForList(sql);
	    System.out.println(list);
	}
}
