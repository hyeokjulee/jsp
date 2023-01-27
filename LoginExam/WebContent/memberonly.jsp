<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<!-- 
		로그인에 성공한 사용자는 "[ ]님 환영합니다." 라고 출력
		로그인을 하지 않은 사용자는 "로그인한 회원만 접근 가능한 페이지입니다." 라고 출력
	 -->
		<%
			if(session.getAttribute("sid").equals("") || session.getAttribute("sid") == null){
				out.print("로그인한 회원만 접근 가능한 페이지입니다.");
			}else{
				out.print("[ " + session.getAttribute("sid") + " ]님 환영합니다.");
			}
		%>
	</body>
</html>