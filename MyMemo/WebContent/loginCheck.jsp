<%@page import="jdbc.UserDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	int result = UserDAO.login(id, password);
	
	if (result == 1) {
//		out.print("아이디가 존재하지 않습니다.");
		request.setAttribute("title", "아이디가 존재하지 않습니다.");
		request.setAttribute("msg", "아이디를 확인해주세요.");
	} else if (result == 2) {
//		out.print("암호가 일치하지 않습니다.");
		request.setAttribute("title", "암호가 일치하지 않습니다.");
		request.setAttribute("msg", "암호를 확인해주세요.");
	} else if (result == 0) {
//		out.print("로그인 성공");
		request.setAttribute("title", "로그인 성공");
		request.setAttribute("msg", "환영합니다.");
		
		session.setAttribute("sid", id);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">
	        <%=request.getAttribute("title") %>
	        </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <%=request.getAttribute("msg") %>
	      </div>
	      <div class="modal-footer">
	      <% if (result == 0) { %>
	        <button type="button" class="btn btn-primary" onclick="location.href='main.jsp';">메인 이동</button>
	      <% } else if (result == 1) { %>
	        <button type="button" class="btn btn-primary" onclick="location.href='signup.jsp';">회원가입 이동</button>
	      <% } else if (result == 2) { %>
	        <button type="button" class="btn btn-primary" onclick="location.href='login.jsp';">로그인 이동</button>
	      <% } %>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$(function() {
			$("#exampleModal").modal("show");
		});
	</script>
</body>
</html>
