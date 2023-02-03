<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String sid = (String) session.getAttribute("sid");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	int result = UserDAO.login(id, password);
	
	if (id.equals(sid) && result == 0) {
		if(UserDAO.delete(id) == 1){
//			out.print("회원 탈퇴 성공");
			request.setAttribute("title", "회원 탈퇴 성공");
			request.setAttribute("msg", "회원 탈퇴가 완료되었습니다.");
			
			session.invalidate();
		} else {
//			out.print("회원 탈퇴 실패");
			request.setAttribute("title", "회원 가입 실패");
			request.setAttribute("msg", "회원 탈퇴에 실패하였습니다.");
		}
	} else {
//		out.print("아이디 또는 비번이 일치하지 않습니다.");
		request.setAttribute("title", "아이디 또는 비번이 일치하지 않습니다.");
		request.setAttribute("msg", "아이디와 비번을 확인해주세요.");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	      <% if (id.equals(sid) && result == 0) { %>
	        <button type="button" class="btn btn-primary" onclick="location.href='main.jsp';">메인 이동</button>
	      <% } else { %>
	        <button type="button" class="btn btn-secondary" onclick="history.back();">뒤로 가기</button>
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
