<%@page import="jdbc.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 정보</title>
</head>
<body>
	<%
	FboardDTO board = FboardDAO.getDetail(request.getParameter("bno"));
	
	String img1 = board.getBfile1();
	String img2 = board.getBfile2();
	String imgstr1 = "";
	String imgstr2 = "";
	if (img1 != null) {
		imgstr1 = "<img src='images/" + img1 + "' width=200";
	}
	if (img2 != null) {
		imgstr2 = "<img src='images/" + img2 + "' width=200";
	}
	%>
	<%=board.getBno() %><br>
	<%=board.getBtitle() %><br>
	<%=board.getBwriter() %><br>
	<%=board.getBcontent() %><br>
	<%=imgstr1 %><br>
	<%=imgstr2 %><br>
	<%=board.getBdate() %><br>
</body>
</html>