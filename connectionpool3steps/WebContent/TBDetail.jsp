<%@page import="jdbc.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보</title>
</head>
<body>
	<%
		StudentDTO student = StudentDAO.getDetail(request.getParameter("hakbun"));
	%>
	<%=student.getHakbun() %><br>
	<%=student.getName() %><br>
	<%=student.getDept() %><br>
	<%=student.getAddr() %><br>
</body>
</html>