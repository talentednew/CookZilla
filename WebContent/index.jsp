<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.RecipeService"%>
<%@ page language="java" import="service.GroupService"%>
<%@ page language="java" import="service.EventService"%>
<% RecipeService recipeService = new RecipeService(); %>
<% GroupService groupService = new GroupService(); %>
<% EventService eventService = new EventService(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>COOKZILLA</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/index.css"/>

</head>
<body>

<!-- head area -->
<%@include file="common/header.jsp" %>

<!-- banner area -->
<div class="banner">
	<div class='content'>
		<!-- banner -->
		<ul>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/pic5.jpg "/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/pic6.jpg "/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/pic2.jpg "/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/pic3.jpg "/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/pic4.jpg "/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/pic5.jpg "/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/pic6.jpg "/>
				</a>
			</li>
		</ul>
		<!-- Button Area -->
		<span class='banner_left'><i class='btn_left'></i></span>
		<span class='banner_right'><i class='btn_right'></i></span>
</div>

</div>

<!-- Content Area -->
<div style='border:1px solid #ccc'>
	<br/><br/>
	
	<%
		//recent RECIPES
		List<Map<String,Object>>  recipes2 = recipeService.getRecipes(0, 4);
		pageContext.setAttribute("recipes2", recipes2);
	%>
	<div class='recipeTag'>
		<div class='title'>RECIPES</div>
		<ul class='recipes'>
			<c:forEach items="${recipes2}" var="item">
				<li class='recipe' onclick="recipe('${item.id}');">
					<div class='recipe-banner'>
						<div class='recipe-pic'><img src= "${basePath}/static/img/${item.pic}" class='pic' width="100%" height="150px"></img></div>
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
		//GROUPS
		List<Map<String,Object>>  groups3 = groupService.getGroups(0, 4);
		pageContext.setAttribute("groups3", groups3);
	%>
	<div class='groupTag'>
		<div class='title'>GROUPS</div>
		<ul class='groups'>
			<c:forEach items="${groups3}" var="item">
				<li class='group' onclick="group('${item.id}');">
					<div class='group-banner'>
						<div class='group-title' title = "${item.title}">${item.title}</div>
					</div>
					<div class='group-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<%
		//EVENTS
		List<Map<String,Object>>  events4 = eventService.getEvents(0, 4);
		pageContext.setAttribute("events4", events4);
	%>
	<div class='eventTag'>
		<div class='title'>EVENTS</div>
		<ul class='events'>
			<c:forEach items="${events4}" var="item">
				<li class='event' onclick="eventDetail('${item.id}');">
					<div class='event-banner'>
						<div class='event-header'>${item.eventTime} ${item.section}</div>
						<div class='event-title' title = "${item.title}">${item.title}</div>
					</div>
					<div class='event-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
</div>

<!-- Bottom Page -->
<%@include file="common/footer.jsp" %>

<script>
	var leftBtn = $('.btn_left').eq(0); //left button
	var rightBtn = $('.btn_right').eq(0);//right button
	
	var ul = $('.banner .content ul').eq(0); 
	
	var index = 0;
	var timer = null; 
	
	var imgwidth = $('.banner .content ul li').width(); //get the width of image
	var len =  $('.banner .content ul li').length - 2//get the sum of all images
	
	//Next picture
	rightBtn.on('click',function(){
		clearTimeout(timer); //clear the timer
		timer = setTimeout(function(){
			index ++;
			movePicture();
		},500);
		
	});
	
	//Last Picture
	leftBtn.on('click',function(){
		clearTimeout(timer); //clear the timer
		timer = setTimeout(function(){
			index --;
			movePicture();
		},500);
	});
			
	//move picture
	function movePicture(){
		$('.banner .content ul').animate({'margin-left':-imgwidth * (index+1)},1000,function(){
			if(index == len){
				$(this).css('margin-left',-imgwidth);
				index = 0;
			}
			if(index == -1){
				$(this).css('margin-left',-imgwidth * len);
				index = len - 1;
			}
		});
	}
	
	//click and move to recipe
	function recipe(id){
	    var a = document.createElement("a");
	    a.href = "recipe.jsp?id=" + id; 
	    console.log(a);
	    a.target = '_new'; //open in new window
	    a.click();//trigger clike
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