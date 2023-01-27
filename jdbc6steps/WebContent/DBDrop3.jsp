<%@page import="jdbc6steps.dbconnclose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 import SQL Packages -->
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBDrop3.jsp</title>
</head>
<body>
<%
	Connection conn = dbconnclose.getConnection();

	// step 4 create Statement Object
	PreparedStatement pstmt = conn.prepareStatement("DROP DATABASE test4");

	// step 5 execute SQL Query
	pstmt.executeUpdate();

	dbconnclose.closeConnection(pstmt, conn);
%>
</body>
</html>