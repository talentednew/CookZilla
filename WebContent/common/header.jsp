<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${basePath}/static/js/jQuery.js"></script>
<body>
<div class="header">
	<div class='logo'>Cookzilla™</div>
	<ul>
		<li class='first'><a href="index.jsp">HOME</a></li>
		<li class='item'><a href="recipePage.jsp">RECIPES</a></li>
		<li class='item'><a href="groupPage.jsp">GROUPS</a></li>
		<li class='item'><a href="eventPage.jsp">EVENTS</a></li>
	</ul>
	
	<div class='login'>
		<c:choose>
			<c:when  test="${empty sessionScope.username}">
				<span><a href="login.jsp">LOGIN</a></span>  
				<span>|</span>
				<span><a href="register.jsp">JOIN NOW!</a></span>
			</c:when>
			<c:otherwise>
				<span><a href="user.jsp">WELCOME, ${sessionScope.username1} <img src= "${basePath}/static/img/${sessionScope.headerPic}" class='pic_in_header' width='40' height='40'></img></a></span>  
				<span>&nbsp;|&nbsp;</span>
				<span><a href="${basePath}/controller/logoutController.jsp">LOGOUT</a></span>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class = 'search_in_head'>
		<div class='search'>
			<input type='text' id="search" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Find a recipe, group or event"/>
		</div>
		<input type="button" class="button_in_head" value="Search"/>
	</div>
</div>
</body>

<script language="javascript">
	
	$('.search_in_head').eq(0).on('click','.button_in_head',function(){
		
		var search = "%" + $('#search').val() + "%";
	    $.post("${basePath}/controller/SearchController.jsp",{search : search},function(data){
	    	data = data.trim();
	        if(data == -1){
	            alert('It can not be empty!');
	        }
	        else if(data == -2){
	            alert('Sorry！No any result.');
	        }
	        else{
	            alert('Yes！We found something for you!');
	            window.location.href = "${basePath}/searchPage.jsp";
	        }
	    });
	});
	
	</script>