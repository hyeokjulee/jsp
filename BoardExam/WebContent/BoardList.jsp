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
		      <th scope="col">작성일</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%
			ArrayList<BoardDTO> boards = BoardDAO.getList();
		
			for(BoardDTO board : boards) {
			%>
			<tr>
		      <th scope="row"><%=board.getBno() %></th>
		      <td><a href="TBDetail.jsp?bno=<%=board.getBtitle() %>"><%=board.getBtitle() %></a></td>
		      <td><%=board.getBwriter() %></td>
		      <td><%=board.getBcontent() %></td>
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