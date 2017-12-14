<%@page import="bean.User"%>
<%@page import="bean.Review"%>
<%@page import="service.ReviewService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    if(user==null){
        out.print("-1");
        return;
    }
    
    String txt = request.getParameter("txt").toString();
    int rating = Integer.parseInt(request.getParameter("rating"));
    String recipeId = request.getParameter("recipeId").toString();
    

    ReviewService commentService = new ReviewService();
    Review comment = new Review();
    comment.setId(UUID.randomUUID().toString());
    comment.setUserId(user.getId());
    comment.setRecipeId(recipeId);
    comment.setContent(txt);
    comment.setRating(rating);
    commentService.saveComment(comment);
    out.print("1");
%>