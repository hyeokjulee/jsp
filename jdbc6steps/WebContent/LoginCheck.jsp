<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginCheck.jsp</title>
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
	
	String hakbun = request.getParameter("hakbun");
	
	String sql = "SELECT * FROM univ.student WHERE hakbun = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, hakbun);
	
	ResultSet rset = pstmt.executeQuery();
	
	if(!rset.isBeforeFirst()){
		out.print("<script>alert('해당 학번은 존재하지 않습니다.');"
				+ "history.back();"
				+ "</script>");
		rset.close();
		pstmt.close();
		conn.close();
		return;
	}
	
	rset.next();
	String dbhakbun = rset.getString("hakbun");
	String dbname = rset.getString("name");
	
	// dbhakbun hakbun 값이 같으면 세션을 생성하세요
	// "hakbun" dbhakbun "name" dbname
	if(dbhakbun.equals(hakbun)){
		session.setAttribute("hakbun", dbhakbun);
		session.setAttribute("name", dbname);
		
		out.print(session.getAttribute("hakbun") + "(" 
				+ session.getAttribute("name") + ")님 방문을 환영합니다.<br>");
	}
	
	rset.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>