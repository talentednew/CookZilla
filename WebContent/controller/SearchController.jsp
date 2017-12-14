<%@ page language="java" import="java.util.*,service.SearchService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

	//get the data from client
	String search = request.getParameter("search").toString();
	Integer count = 0;

	if(StringUtils.isEmpty(search)){
		out.print("-1");//error code-1 : it is empty！
	}else{
		SearchService searchService = new SearchService();

		List recipes = searchService.getRecipesBySearchText(search,search,search,search);
		if(recipes.isEmpty()){
			count++;
			//out.print("-2");//error code -2 :   No any result！
		}else{
			out.print("1");
			session.setAttribute("recipes", recipes);
			}
		
		List groups = searchService.getGroupsBySearchText(search,search);
		if(groups.isEmpty()){
			count++;
			//out.print("-2");//error code -2 :   No any result！
		}else{
			out.print("1");
			session.setAttribute("groups", groups);
			}
		
		List events = searchService.getEventsBySearchText(search,search);
		if(groups.isEmpty()){
			count++;
			//out.print("-2");//error code -2 :   No any result！
		}else{
			out.print("1");
			session.setAttribute("events", events);
			}
		
		if(count == 3){
			out.print("-2");
		}
	}
	
%>