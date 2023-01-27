<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 import SQL Packages -->
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step2.jsp</title>
</head>
<body>
<%
// Step 2 load JDBC Driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.print("JDBC Driver loading success<br>");
	}catch(ClassNotFoundException err){
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}
	// com.mysql.jdbc.Driver	mySQL 용
	// org.maria.jdbc.Driver	maria 용

%>
</body>
</html>