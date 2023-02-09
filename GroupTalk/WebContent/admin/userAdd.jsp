<%@page import="smtp.SendMail, jdbc.UserDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	
	String result = UserDAO.insertAdmin(id, password, name);
	
	out.print(result);
/*	
	if(result != null) {
		SendMail.sending(id, name); // 가입자에게 웰컴 메일 발송
	}
*/	
%>