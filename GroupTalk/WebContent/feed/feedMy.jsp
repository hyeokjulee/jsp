<%@page import="jdbc.FeedDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("sid");
	
	out.print(FeedDAO.getMyList(sid));
%>