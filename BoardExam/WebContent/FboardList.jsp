<%@page import="jdbc.*, java.util.ArrayList" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		
	<div class="container">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">내용</th>
		      <th scope="col">파일1</th>
		      <th scope="col">파일2</th>
		      <th scope="col">작성일</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%
			ArrayList<FboardDTO> boards = FboardDAO.getList();
		
			for(FboardDTO board : boards) {
				
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
			<tr>
		      <th scope="row"><%=board.getBno() %></th>
		      <td><a href="FboardDetail.jsp?bno=<%=board.getBno() %>"><%=board.getBtitle() %></a></td>
		      <td><%=board.getBwriter() %></td>
		      <td><%=board.getBcontent() %></td>
		      <td><%=imgstr1 %></td>
		      <td><%=imgstr2 %></td>
		      <td><%=board.getBdate() %></td>
		    </tr>
			<% 	
				}
			%>
		  </tbody>
		</table>
	</div>
</body>
</html>