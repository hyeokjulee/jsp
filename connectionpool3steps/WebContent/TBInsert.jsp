<%@page import="jdbc.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ page import="java.sql.*" %> --%>

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
/* 	try {
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException err){
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	Connection conn = null;

	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/univ", "root", "0000");
	}catch(SQLException err){
		out.print("Connection Object error<br>" + err.getMessage());
	} */
	
 	String hakbun = request.getParameter("hakbun");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String addr = request.getParameter("addr");
	
/*  String sql = "INSERT univ.student VALUES(?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql); */
	
/* 	pstmt.setString(1, hakbun);
	pstmt.setString(2, name);
	pstmt.setString(3, dept);
	pstmt.setString(4, addr); */
	
/* 	pstmt.executeUpdate();

	pstmt.close();
	conn.close(); */
	
	int result = StudentDAO.insert(hakbun, name, dept, addr);
	
	if(result == 1){
		out.print("등록 성공");
	}else{
		out.print("등록 실패");
	}
%>
</body>
</html>