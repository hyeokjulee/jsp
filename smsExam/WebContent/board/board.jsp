<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<%@include file="/header.jsp"%>

<div class="alert alert-primary" role="alert">
	<div class="container">
		<h1 class="display-3">게시판</h1>
	</div>
</div>

<div class="container">
	<form action="boardCheck.jsp">
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">글제목</label>
		  <input type="text" name="subject" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">글내용</label>
		  <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		
		<button class="btn btn-primary">등록</button>
		<button type="reset" class="btn btn-warning">취소</button>
	</form>
</div>

<%@include file="/footer.jsp"%>
</body>
</html>