<%@page import="smtp.SendMail"%>
<%@page import="jdbc.UserDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	
	int result = 0;
	
	boolean b = UserDAO.exist(id);
	boolean c = UserDAO.existTemp(id);
	
	// 이미 DB에 사용중인 아이디인지 먼저 확인
	if (b) {
		request.setAttribute("title", "이미 존재하는 아이디입니다.");
		request.setAttribute("msg", "다른 아이디를 사용하여 가입해주세요.");
	} else if (c) {
		request.setAttribute("title", "회원가입 신청이 되어있는 아이디입니다.");
		request.setAttribute("msg", "다른 아이디를 사용하여 가입해주세요.");
	} else {
		// 디비에 넣기
		result = UserDAO.insertTemp(id, password, name);
		if (result == 1) {
			request.setAttribute("title", "회원 가입 신청 완료");
			request.setAttribute("msg", "회원 가입 신청을 완료하였습니다. 관리자의 확인 후 24시간 이내에 승인/거부 처리됩니다.");

//			SendMail.sending(id, name); // 가입자에게 웰컴 메일 발송
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	      <% if (b || c) { %>
	      	<button type="button" class="btn btn-primary" onclick="history.back();">뒤로 가기</button>
	      <% } else { %>
	        <button type="button" class="btn btn-primary" onclick="location.href='login.jsp';">로그인 페이지로 이동</button>
	      <% } %>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<script>
		$(function() {
			$("#exampleModal").modal("show");
		});
	</script>
</body>
</html>
