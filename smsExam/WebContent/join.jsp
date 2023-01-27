<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>sms join</title>
</head>
<body>
<%@include file="/header.jsp"%>

<div class="alert alert-primary" role="alert">
	<div class="container">
		<h1 class="display-3">회원가입</h1>
	</div>
</div>

<div class="container">
	<form action="board/boardCheck.jsp">
		<div class="mb-3">
		  <label class="form-label">아이디<input type="text" name="id" class="form-control"></label>
		</div>
		<div class="mb-3">
		  <label class="form-label">이름<input type="text" name="name" class="form-control"></label>
		</div>
		<div class="mb-3">
		  <label class="form-label">비번<input type="text" name="password" class="form-control"></label>
		</div>
		<div class="mb-3">
		  <label class="form-label">전화번호<input type="text" name="phone" class="form-control"></label>
		</div>
		<button class="btn btn-primary">등록</button>
		<button type="reset" class="btn btn-warning">취소</button>
	</form>
</div>

<%@include file="/footer.jsp"%>
</body>
</html>