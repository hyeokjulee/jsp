<%@page import="jdbc.memberDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); // 전송 받는 데이터 한글 처리 

 	String mname = request.getParameter("mname");
	String mid = request.getParameter("mid");
	String mpass = request.getParameter("mpass");
	String mgender = request.getParameter("mgender");
	String memail = request.getParameter("memail");
	
	int result = memberDAO.insert(mname, mid, mpass, mgender, memail);
	
	if(result == 1){
		out.print("등록 성공");
	}else{
		out.print("등록 실패");
	}
%>