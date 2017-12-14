<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.RecipeService"%>
<% RecipeService recipeService = new RecipeService(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RECIPE</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/recipePage2.css"/>
</head>
<body>
<!-- head area -->
<%@include file="common/header.jsp" %>

<!-- content Area -->
<div style='border:1px solid #ccc'>
<br/>
<a href="post.jsp"><input class="post" type="button" value= "NEW RECIPE"></input></a>
<br/>
	
	<%
		//Find the American related recipe
		List<Map<String,Object>>  recipes2 = recipeService.getRecipesByCategoryId(0, 0, 6);
		pageContext.setAttribute("recipes2", recipes2);
	%>
		<div class='recipeTag'>
		<div class='title'>AMERICAN</div>
		<ul class='recipes'>
			<c:forEach items="${recipes2}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='150px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find the ITALIAN related recipe
		List<Map<String,Object>>  recipes3 = recipeService.getRecipesByCategoryId(1, 0, 6);
		pageContext.setAttribute("recipes3", recipes3);
	%>
		<div class='recipeTag'>
		<div class='title'>ITALIAN</div>
		<ul class='recipes'>
			<c:forEach items="${recipes3}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='150px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find the Chinese related recipe
		List<Map<String,Object>>  recipes4 = recipeService.getRecipesByCategoryId(2, 0, 6);
		pageContext.setAttribute("recipes4", recipes4);
	%>
		<div class='recipeTag'>
		<div class='title'>CHINESE</div>
		<ul type = "disc" class='recipes'>
			<c:forEach items="${recipes4}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='150px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>

	<%
		//Find the Mexican related recipe
		List<Map<String,Object>>  recipes5 = recipeService.getRecipesByCategoryId(3, 0, 6);
		pageContext.setAttribute("recipes5", recipes5);
	%>
		<div class='recipeTag'>
		<div class='title'>MEXICAN</div>
		<ul class='recipes'>
			<c:forEach items="${recipes5}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='150px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find the Indian related recipe
		List<Map<String,Object>>  recipes6 = recipeService.getRecipesByCategoryId(4, 0, 6);
		pageContext.setAttribute("recipes6", recipes6);
	%>
	<div class='recipeTag'>
		<div class='title'>INDIAN</div>
		<ul class='recipes'>
			<c:forEach items="${recipes6}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='150px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find the German related recipe
		List<Map<String,Object>>  recipes7 = recipeService.getRecipesByCategoryId(5, 0, 6);
		pageContext.setAttribute("recipes7", recipes7);
	%>
	<div class='recipeTag'>
		<div class='title'>GERMAN</div>
		<ul class='recipes'>
			<c:forEach items="${recipes7}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='150px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find the Turkish related recipe
		List<Map<String,Object>>  recipes8 = recipeService.getRecipesByCategoryId(6, 0, 6);
		pageContext.setAttribute("recipes8", recipes8);
	%>
	<div class='recipeTag'>
		<div class='title'>TURKISH</div>
		<ul class='recipes'>
			<c:forEach items="${recipes8}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='150px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//Find the Other recipe
		List<Map<String,Object>>  recipes9 = recipeService.getRecipesByCategoryId(7, 0, 6);
		pageContext.setAttribute("recipes9", recipes9);
	%>
	<div class='recipeTag'>
		<div class='title'>OTHER</div>
		<ul class='recipes'>
			<c:forEach items="${recipes9}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width='100%' height='160px'></img></div>
					</div>
					<div class='recipe-info'>
						<br><div class='recipe-title'>${item.header}</div>
						<br>By @${item.author}
						<br><div class='recipe-description'>${item.name}</div>
					</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
</div>

<!-- Bottom Page -->
<%@include file="common/footer.jsp" %>

<script>
	//click and move to recipe
	function recipe(id){
	    var a = document.createElement("a");
	    a.href = "recipe.jsp?id=" + id; 
	    console.log(a);
	    a.target = '_new'; //open in new window
	    a.click();//trigger click
	}
</script>
</body>
</html>