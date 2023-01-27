<%@page import="smtp.NaverSMTP, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //한글 처리

	Map<String, String> emailInfo = new HashMap<String, String>();
	
	emailInfo.put("from", request.getParameter("from")); //보내는 사람, 변동 불가, 반드시 본인의 네이버 메일주소
	emailInfo.put("to", request.getParameter("to")); //받는 사람
	emailInfo.put("subject", request.getParameter("subject")); //메일 제목
	emailInfo.put("content", request.getParameter("content")); //메일 내용
	
	emailInfo.put("format", "text/plain;charset=UTF-8"); //메일의 형식을 설정 일단 text로 고정
	
	try {
		NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 객체 생성
		smtpServer.emailSending(emailInfo);
		out.print("이메일 전송 성공");
	} catch (Exception e) {
		out.print("이메일 전송 실패");
		e.printStackTrace();
	}
%>