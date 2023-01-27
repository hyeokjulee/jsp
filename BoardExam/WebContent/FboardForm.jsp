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
		<form action="FboardInsert.jsp" method="post" enctype="multipart/form-data">
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="text" class="form-control" id="exampleFormControlInput1" name="fbtitle">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="fbcontent"></textarea>
			</div>
			
			<div class="input-group">
			  <input type="file" name="fbfile1" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
			  <input type="file" name="fbfile2" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
			  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">Button</button>
			</div>
			
			<button class="btn btn-primary" type="submit">등록</button>
		</form>
	</div>
</body>
</html>