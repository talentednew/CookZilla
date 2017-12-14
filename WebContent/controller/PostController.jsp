<%@page import="bean.User"%>
<%@page import="bean.Recipe"%>
<%@page import="service.PostService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    if(user==null){
        out.print("-1");
        return;
    }
    
    String header = request.getParameter("header").toString();
    String name = request.getParameter("name").toString();
    String content = request.getParameter("content").toString();
    int category_id = Integer.parseInt(request.getParameter("category_id"));
    String ingredient1 = request.getParameter("ingredient1").toString();
    String ingredient2 = request.getParameter("ingredient2").toString();
    String getPath = request.getParameter("pic").toString();
	String pic = getPath.substring(12);
    

    PostService postService = new PostService();
    Recipe recipe = new Recipe();
    recipe.setId(UUID.randomUUID().toString());
    recipe.setUserId(user.getId());
    recipe.setAuthor(user.getUsername1());
    recipe.setHeader(header);
    recipe.setName(name);
    recipe.setContent(content);
    recipe.setIngredient1(ingredient1);
    recipe.setIngredient2(ingredient2);
    recipe.setCategoryId(category_id);
    recipe.setPic(pic);
    postService.saveRecipe(recipe);
    out.print("1");
%>