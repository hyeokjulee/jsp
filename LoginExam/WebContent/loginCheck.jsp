<%@page import="jdbc.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); // 전송 받는 데이터 한글 처리 

	String mid = request.getParameter("mid");
	String mpass = request.getParameter("mpass");
	
	int result = memberDAO.login(mid, mpass);
	
	if(result == 0){ //로그인 성공 케이스 - 세션 생성 후 메인으로 이동
		session.setAttribute("mid", mid);
		response.sendRedirect("main.jsp");
	}else if(result == 1){ //디비에 정보가 없다 - 회원가입 페이지로 이동
		response.sendRedirect("signupForm.jsp");
	}else{ //비번이 틀림 - 다시 로그인 페이지로 이동
		response.sendRedirect("signinForm.jsp");
	}
%>