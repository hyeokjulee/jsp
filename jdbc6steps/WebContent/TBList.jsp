<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TBList.jsp</title>
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
	
	String sql = "SELECT * FROM univ.student";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rset = pstmt.executeQuery();
	
	while(rset.next()){
%>
	<%=rset.getString("hakbun")%><br>
	<%=rset.getString("name")%><br>
	<%=rset.getString("dept")%><br>
	<%=rset.getString("addr")%><br>
	<br>
<% 	
	}
	
	rset.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>