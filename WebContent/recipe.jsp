<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.RecipeService"%>
<%@ page language="java" import="service.ReviewService"%>
<%@ page language="java" import="util.StringUtils,bean.*"%>
<% RecipeService recipeService = new RecipeService(); %>
<%
    String id = request.getParameter("id");
    Map<String,Object> map = recipeService.getContentByRecipeId(id);
    Map<String,Object> user = recipeService.getUserByRecipeId(id);
    Map<String,Object> rating = recipeService.getRatingByRecipeId(id);
    pageContext.setAttribute("recipe", map);
    pageContext.setAttribute("user", user);
    pageContext.setAttribute("rating", rating);
%>

<%
    ReviewService commentService = new ReviewService();
    List<Map<String,Object>> list = commentService.getReviewsByRecipeId(id);
    pageContext.setAttribute("comments", list);
    System.out.println(list);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recipe</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/recipe4.css"/>
	
</head>
<body>

<!-- head area -->
<%@include file="common/header.jsp" %>


<div class='wrap'>
	<div class='left'>
		<!-- content area -->
		<div class='recipe'>
			<div class='title'>${recipe.header}</div>
			<br>
			<div class='rating'><span class='light-font'>AVERAGE RATING：</span><span class='info'>${rating.avg_rating}</span></div>
			<div class='publicDate'><span class='light-font'>RELEASE DATE：</span><span class='info'>${recipe.create_time}</span></div>
			<hr/>
			<div class="demo_line">———————————<span>DESCRPTION</span>————————————</div>
			<div class = 'content'>
				${recipe.content}
			</div>
			<div class="demo_line">———————————<span>INGREDIENTS</span>————————————</div>
			<div class='left_in_recipe'> 
				<br>·${recipe.ingredient1}
				<br>·${recipe.ingredient2}
			</div>
				
			<div class = 'right_in_recipe'>
					<br><img src= "${basePath}/static/img/${recipe.pic}" class='header_pic' width='350' height='350'></img>	
			</div>	
		</div>
		<div class='clearfix'></div>
		<div class="demo_line">———————————<span>REVIEWS</span>————————————</div>
		<!-- comment area -->
		<br>
		<div class='commentBox'>
			<textarea class="comment_input" id="commenttxt" placeholder="Please type your comments(600)..." maxlength="600"></textarea>
		          <input type="button" value="SAVE" class="button">
		</div>
		<div class="rating">Please give rating for this recipe :)
			<select id="rating">
				<option value="null"></option>
            	<option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
        	</select>
		</div>
		<div class='clearfix'></div>
		<br/><hr/>
		<div class='mb64' class="comment_list">
    		<c:forEach items="${comments}" var="comment">
        		<div class="comment_infor clearfix">
            		<div style='border-bottom:1px solid #ccc' class="comment_word">
                 		<p style='border-bottom:20px solid #fff'>${comment.username1} rated ${comment.rating} and said：</p>
                 		<p class='mb32'>${comment.content}</p>
             		</div>
        		</div>
     		</c:forEach>
		</div>
		
	</div>
	
	
	<div class='right mt32'>
		<div class='author'>
		<img src= "${basePath}/static/img/${user.headerPic}" class='header_pic' width='90' height='90'></img>
		User: ${user.username1}
		</div>
	</div>
	
	
</div>

<div class='clearfix'></div>

<!-- bottom area -->
<%@include file="common/footer.jsp" %>

<script>
$(".button").eq(0).on('click',function(){
    var txt = $('#commenttxt').val();
    var rating = $('#rating').val();
    $.post("${basePath}/controller/ReviewController.jsp",{txt : txt , rating : rating, recipeId : "${recipe.id}"},function(data){
        data = data.trim();
        if(data == '-1'){
            alert('PLEASE LOGIN！');
        }else if(data == '1'){
            alert('SAVED！');
            location.reload();
        }
    });
});
</script>

</body>
</html>