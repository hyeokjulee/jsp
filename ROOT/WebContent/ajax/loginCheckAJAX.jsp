<%@page import="jdbc.UserDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	int result = UserDAO.login(id, password);
	
	session.setAttribute("sid", id);
	
	out.print(result);
%>
