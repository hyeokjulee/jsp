<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TBCreate.jsp</title>
</head>
<body>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException err){
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	Connection conn = null;

	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/univ", "root", "0000");
	}catch(SQLException err){
		out.print("Connection Object error<br>" + err.getMessage());
	}
	
	String sql = "CREATE TABLE univ.student("
			+ "hakbun	varchar(10),"
			+ "name		varchar(10),"
			+ "dept		varchar(10),"
			+ "addr		varchar(30),"
			+ "primary key(hakbun))";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.executeUpdate();

	pstmt.close();
	conn.close();
%>
</body>
</html>