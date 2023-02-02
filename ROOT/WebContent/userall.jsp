<%@page import="java.util.*, jdbc.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@ include file="/header.jsp"%>
<%
	if (sid == null) {
%>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">
	        회원 전용 메뉴 
	        </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        로그인을 한 회원만 사용 가능한 메뉴입니다.<br>로그인 화면으로 이동합니다.
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onclick="location.href='login.jsp';">로그인 이동</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$(function() {
			$("#exampleModal").modal("show");
		});
	</script>
<%		
	}
%>
	<br><br><br><br><br>
	<div class="container">
		<table class="table table-hover">
		  <thead>
		  	<tr>
		  		<th colspan="3">
		  			<b>회원 리스트</b>
		  		</th>
		  	</tr>
		    <tr>
		      <th scope="col" class="col-4">아이디</th>
		      <th scope="col" class="col-4">이름</th>
		      <th scope="col" class="col-4">가입일</th>
		    </tr>
		  </thead>
		  <tbody>
<%
	List<UserDTO> users = UserDAO.list();
	for(UserDTO user : users) {
%>
			<tr>
			  <td><%=user.getId() %></td>
			  <td><%=user.getName() %></td>
			  <td><%=user.getTs() %></td>
			</tr>
<% 	
	}
%>
		  </tbody>
		</table>
	</div>
<%@ include file="/footer.jsp"%>
</body>
</html>