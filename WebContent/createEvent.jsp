<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.EventService"%>
<%@ page language="java" import="service.GroupService"%>
<% EventService eventService = new EventService(); %>
<% GroupService groupService = new GroupService(); %>
<%
	List<Map<String,Object>> groups = groupService.getGroups();
	pageContext.setAttribute("groups", groups);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/createEvent.css"/>
<title>CREATE EVENT PAGE</title>

</head>
<body>
	<!-- head area -->
	<%@include file="common/header.jsp" %>
		
	<!-- register -->
	<div class='content'>
		<div class='logo'>CREATE NEW EVENT</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="title" autofocus="autofocus" autocomplete="off" maxlength="60" placeholder="Event title">
		</div>
		<div class = 'date'>Event Date
			<select id="month">
				<option value="null">Month</option>
            	<option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
        	</select>
        	<select id="day">
				<option value="null">Day</option>
            	<option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
        	</select>
			<select id="year">
				<option value="null">Year</option>
            	<option value="2016">2016</option>
                <option value="2017">2017</option>
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
                <option value="2026">2026</option>
                <option value="2027">2027</option>
        	</select>
        </div>
        <div class='time'>Event Time
        	<select id="hour">
				<option value="null">Hour</option>
            	<option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
        	</select>
        	<select id="minute">
				<option value="null">Minute</option>
				<option value="00">00</option>
            	<option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
                <option value="32">32</option>
                <option value="33">33</option>
                <option value="34">34</option>
                <option value="35">35</option>
                <option value="36">36</option>
                <option value="37">37</option>
                <option value="38">38</option>
                <option value="39">39</option>
                <option value="40">40</option>
                <option value="41">41</option>
                <option value="42">42</option>
                <option value="43">43</option>
                <option value="44">44</option>
                <option value="45">45</option>
                <option value="46">46</option>
                <option value="47">47</option>
                <option value="48">48</option>
                <option value="49">49</option>
                <option value="50">50</option>
                <option value="51">51</option>
                <option value="52">52</option>
                <option value="53">53</option>
                <option value="54">54</option>
                <option value="55">55</option>
                <option value="56">56</option>
                <option value="57">57</option>
                <option value="58">58</option>
                <option value="59">59</option>
        	</select>
        	<select id="section">
				<option value="AM">AM</option>
				<option value="PM">PM</option>
            </select>
        </div>
		<br>
		<textarea class = 'des_input' id="description" autofocus="autofocus" autocomplete="off" maxlength="600" placeholder="Description(Maximum 600 words)"></textarea>
		
		<div class='group'>
			<select id ="group" name="group">
				<option value="null">Select the group that you joined</option>
				<c:forEach items="${groups}" var="group" varStatus="index"><option id="${group.id}" value="${group.id},${group.title}">${group.title}</option></c:forEach>
			</select>
		</div>
		
		<div class='mt50 ml32'>
			<button class="create_btn" onclick="create()">SUBMIT</button>
		</div>
	</div>
	
	<script language="javascript">
		$(function(){
	    	$("#group").click(function(){
	    	//get the result from select
	    	var groupId = $("#group").val();
	   		//get the value with id
	    	name = $("#"+groupId).html();
	    	});
	 	});
		
		function create(){
			var section = $('#section').val()
			var eventTime = $('#year').val() + "-" + $('#month').val() + "-" + $('#day').val() + " " + $('#hour').val() + ":" + $('#minute').val();
			var title = $('#title').val();
			var description = $('#description').val();
			var groupId = $('#group').val();
			$.ajax({
				type:"post",//request method
				url:"${basePath}/controller/EventController.jsp",//request address
				data:{"title":title,"description":description,"eventTime":eventTime,"groupId":groupId,"section":section},//json data send to controller
				error:function(){//if error rebind it
					alert("Create error！");
				},
				success:function(data){
					if(data == -1){
						alert('Please sign in first！');
						window.location.href = "${basePath}/login.jsp";
					}else if(data == -2){
						alert('Please join the group you selected first!');
					}else if(data == 1){
						alert('Congratulations! Create succeed!');
						//Back to home page after group created.
						window.location.href = "${basePath}/groupPage.jsp"; 
					}
				}
			});	
		}
		
		
	</script>

</body>
</html>