<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 import SQL Packages -->
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step6.jsp</title>
</head>
<body>
<%
// Step 2 load JDBC Driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException err){
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

// step 3 create Connection Object
	Connection conn = null;

	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlhjwwe", "dlhjwwe", "비번");
	}catch(SQLException err){
		out.print("Connection Object error<br>" + err.getMessage());
	}
	
// step 4 create Statement Object
		String sql = "CREATE TABLE dlhjwwe.student("
			+ "hakbun	varchar(10),"
			+ "name		varchar(10),"
			+ "dept		varchar(10),"
			+ "addr		varchar(30),"
			+ "primary key(hakbun))";


	PreparedStatement pstmt = conn.prepareStatement(sql);

// step 5 execute SQL Query
	pstmt.executeUpdate();

// step 6 close Connection
	pstmt.close();
	conn.close();

%>
</body>
</html>