<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/post1.css"/>
<title>POST PAGE</title>
</head>

<body>
	<!-- head area -->
	<%@include file="common/header.jsp" %>
		
	<!-- post -->
	<center>
	<div class='content'>
		<div class='logo'>NEW RECIPE</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="header" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Titile of Recipe">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="name" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Short Description">
		</div>

		<div id="ingredient">  
 			<div><input class='ingredient' type="text" id="ingredient1" name="text1"/></div>  
		</div>  
  
		<input type="button" class='ingredient_more' id="addTextImput" value="More ingredients"/>

		<div class='contentBox'>
			<textarea class="content_input" id="content" placeholder="Please type the detail for this recipe(600)..." maxlength="600"></textarea>
		</div>

		<div class="category">
			<select id="category_id">
				<option value=null>TAG</option>
            	<option value="0">AMERICAN</option>
                <option value="1">ITALIAN</option>
                <option value="2">CHINESE</option>
                <option value="3">MEXICAN</option>
                <option value="4">INDIAN</option>
                <option value="5">GERMAN</option>
                <option value="6">TURKISH</option>
                <option value="7">OTHER</option>
        	</select>
		</div>
		<form action="PostController.jsp" onsubmit="return submit()" method="post" enctype="multipart/form-data"> 
			<div class="upload">Select a photo
			<br>
			<input type="file" value="upload" id="pic"/>
			</div>
		</form>
		
		<div class='mt50 ml32'>
			<button class="submit_btn" onclick="submit()">Submit</button>
		</div>
	</div>
	</center>
<script type = "text/javascript">
	var i = 0; 
 	$(function(){  
		  
		 $('#addTextImput').click(function(){  
			 if(i < 5) {  
				 $('#ingredient').append('<div><input class=\'data\' type="text" name="text" + i + ""/></div>');  
				 i++;  
		  	} else {  
		   			alert("At most 6 ingredients");  
		  	}  
		    
		});  
	});
		
		
	function submit(){
		var ingredient2 = "";
		for (var j = 0; j < i; j++) {
			var val = $('.data').eq(j).val(); 
			ingredient2+=val + "<br>" + "·";
		}
		var header = $('#header').val();
		var name = $('#name').val();
		var ingredient1 = $('#ingredient1').val();
		var content = $('#content').val();
		var category_id = $('#category_id').val();
 		var pic=$('#pic').val();
		$.ajax({
			type:"post",//request method
			url:"${basePath}/controller/PostController.jsp",//request address
			data:{"header":header,"name":name,"content":content,"ingredient1":ingredient1,"ingredient2":ingredient2,"category_id":category_id, "pic":pic},//send json data to controller
			error:function(){//if error, then rebind the event
				alert("Post error！");
			},
			success:function(data){ //return success for the callback function
				if(data == -1){
					alert('Please login first!');
				}else if(data == 1){
					alert('Congratulations! Submit succeed!');
					//back to home page after login
					window.location.href = "${basePath}"; 
				}
			}
		});
	}
		
	</script>

</body>
</html>