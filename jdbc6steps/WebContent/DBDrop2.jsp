<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 import SQL Packages -->
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBDrop2.jsp</title>
</head>
<body>
<%@ include file="dbconnect.inc" %>
<%
// step 4 create Statement Object
	PreparedStatement pstmt = conn.prepareStatement("DROP DATABASE test3");

// step 5 execute SQL Query
	pstmt.executeUpdate();
%>
<%@ include file="dbclose.inc" %>
</body>
</html>