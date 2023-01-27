<%@page import="jdbc.*, java.util.ArrayList" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<body>
	<%
		ArrayList<StudentDTO> students = StudentDAO.getList();
	
		for(StudentDTO student : students) {
	%>
	<a href="TBDetail.jsp?hakbun=<%=student.getHakbun() %>"><%=student.getHakbun() %></a><br>
	<%=student.getName() %><br>
	<%=student.getDept() %><br>
	<%=student.getAddr() %><br>
	<br>
	<% 	
		}
	%>
</body>
</html>