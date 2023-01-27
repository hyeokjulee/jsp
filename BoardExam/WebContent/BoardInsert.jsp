<%@page import="jdbc.BoardDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); // 전송 받는 데이터 한글 처리 

 	String btitle = request.getParameter("btitle");
	String bwriter = request.getParameter("bwriter");
	String bcontent = request.getParameter("bcontent");
	
	int result = BoardDAO.insert(btitle, bwriter, bcontent);
	
	if(result == 1){
		out.print("등록 성공");
	}else{
		out.print("등록 실패");
	}
%>