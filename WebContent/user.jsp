<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.RecipeService"%>
<%@ page language="java" import="service.ReviewService"%>
<%@ page language="java" import="service.GroupMemberService"%>
<%@ page language="java" import="service.EventMemberService"%>
<%@ page language="java" import="util.StringUtils,bean.*"%>
<% RecipeService recipeService = new RecipeService();%>
<% GroupMemberService groupMemberService = new GroupMemberService();%>
<% EventMemberService eventMemberService = new EventMemberService();%>

<%
	User user = (User)session.getAttribute("user");
	if(user==null){//user didn't login
    	out.print("-1");
    	return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recipe</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/user.css"/>
	
</head>
<body>

<!-- head area -->
<%@include file="common/header.jsp" %>

<div class='wrap'>
	<div class='left'>
		<!-- user info area -->
		
		<img src= "${basePath}/static/img/${user.headerPic}" class='headerPic' width='350' height='350'></img>
		<div class='username'>User Name: ${user.username1}</div>
		<div class='joinTime'>You joined our site on: ${user.createTime}</div>
		<div class='shortProfile'>Short Profile: 
		<br>
		${user.shortProfile}
		</div>
		
	</div>
	
	
	<div class='right mt32'>
		<%
		List<Map<String,Object>>  recipes11 = recipeService.getRecipesByUserId(user.getId());
		pageContext.setAttribute("recipes11", recipes11);
		%>
		<div class='recipeTag'>
			<div class='title'>MY RECIPES</div>
				<ul class='recipes'>
					<c:forEach items="${recipes11}" var="item">
						<br>
						<input type='button' value='${item.header}' class='recipe' onclick="recipe('${item.id}');">
					</c:forEach>
					<div style='clear:both'></div>
				</ul>
			</div>
		</div>
</div>

<div class='clearfix'></div>


<br>
<br>
<br>
<br>
<br>
<br>
<br>

<!-- foot area -->
<%@include file="common/footer.jsp" %>

<script>
function recipe(id){
    var a = document.createElement("a");
    a.href = "recipe.jsp?id=" + id; 
    console.log(a);
    a.target = '_new'; //open in new window
    a.click();//trigger click
}

function group(id){
    var a = document.createElement("a");
    a.href = "group.jsp?id=" + id; 
    console.log(a);
    a.target = '_new'; //open in new window
    a.click();//trigger click
}

function eventDetail(id){
    var a = document.createElement("a");
    a.href = "event.jsp?id=" + id; 
    console.log(a);
    a.target = '_new'; //open in new window
    a.click();//trigger click
}
</script>

</body>
</html>