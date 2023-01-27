<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String mname = request.getParameter("mname");
			String memail = request.getParameter("memail");
			String mgender = request.getParameter("mgender");
			
			session.setAttribute("sid", memail);
			
			String sid = (String)session.getAttribute("sid");
			
			response.sendRedirect("memberonly.jsp");
		%>
		
		[ <%=sid %> ] 님 로그인 성공하였습니다.
	</body>
</html>