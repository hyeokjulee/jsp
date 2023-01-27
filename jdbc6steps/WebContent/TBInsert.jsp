<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<% // 전송 받는 데이터 한글 처리 
	request.setCharacterEncoding("UTF-8");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TBInsert.jsp</title>
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
	
/* 	String hakbun = "1111";
	String name = "홍길동";
	String dept = "컴공";
	String addr = "서울"; */
	
	String sql = "INSERT univ.student VALUES(?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("hakbun"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("dept"));
	pstmt.setString(4, request.getParameter("addr"));
	
	pstmt.executeUpdate();

	pstmt.close();
	conn.close();
%>
</body>
</html>