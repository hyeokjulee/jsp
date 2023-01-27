<%@page import="java.net.URLEncoder" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
//	int result = boardDAO.insert(subject, content);
	
	int result = 1; //디비에 잘 저장이 되었다고 가정....
	result = 2;
	
	//msg, rphone 두 개의 변수값이 /smsAdv/smsCheck.jsp 로 전달
	String rphone = "010-4741-3159"; //고객 디비에서 글쓴이의 폰 번호를 조회해온 것으로 가정
	
	if (result == 1) {
		//문자 메세지 전송한 후 모달로 출력하고 메인으로 리다이렉트
		response.sendRedirect("smsCheck.jsp?msg=" + URLEncoder.encode(subject) + "&rphone=" + rphone);

		request.setAttribute("title", "글 등록 성공");
		request.setAttribute("msg", subject);

//		response.sendRedirect("main.jsp");
	} else {
		//"글 등록에 실패하였습니다. 다시 작성하세요." 모달로 출력하고 작성 페이지로 리다이렉트
		request.setAttribute("title", "글 등록 실패");
		request.setAttribute("msg", subject);

//		response.sendRedirect("board.jsp");
	}
	
	//아이디 이름 비번 전화번호
	//회원 가입 폼을 만들어 가입 성공 후 (성공을 가정하고..) 가입 축하 메세지를 폰으로 발송하세요
	//홍길동(본인이름) 회원님 홈페이지 가입을 환영합니다.
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	if (result == 2) {
		//문자 메세지 전송한 후 모달로 출력하고 메인으로 리다이렉트
		response.sendRedirect("smsCheck.jsp?msg=" + URLEncoder.encode(name + " 회원님 홈페이지 가입을 환영합니다.") + "&rphone=" + phone);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
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
	        <button type="button" class="btn btn-warning" onclick="location.href='smsForm.jsp'">back</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">close</button>
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