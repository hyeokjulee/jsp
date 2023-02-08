<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>
</head>
<body>
	<form action="signoutCheck.jsp" method="post">
		<span style="text-align: right; width: 150px; display:inline-block;"> </span> 회원 탈퇴<br>
		<span style="text-align: right; width: 150px; display:inline-block;">아이디 : </span> <input type="text" name="id"><br>
		<span style="text-align: right; width: 150px; display:inline-block;">패스워드 : </span> <input type="password" name="password"><br>
		<span style="text-align: right; width: 150px; display:inline-block;"> </span> <button>회원 탈퇴</button>
	</form>
</body>
</html>