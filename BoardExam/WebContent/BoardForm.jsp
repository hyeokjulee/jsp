<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
</head>
<body>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
	<div class="container">
		<form action="BoardInsert.jsp">
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="text" class="form-control" id="exampleFormControlInput1" name="btitle">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="bcontent"></textarea>
			</div>
			<button class="btn btn-primary" type="submit">등록</button>
		</form>
	</div>
</body>
</html>