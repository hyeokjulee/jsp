<%@page import="jdbc.memberDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mname = request.getParameter("mname");
	String memail = request.getParameter("memail");
	String mgender = request.getParameter("mgender");
	
	// 우리 디비에 해당 회원이 존재하는지 여부 확인 exist 메서드로 확인 후
	// 디비에 존재하면 (1) 세션 처리 (로그인 상태)
	// 디비에 존재하지 않으면 회원 가입 페이지로 이동 - 가입 유도
	
	int result = memberDAO.exist(memail);
	
	if(result == 1){
		out.print("로그인 성공");
		session.setAttribute("sid", memail);
	} else {
		response.sendRedirect("signupForm2.jsp?mname=" + java.net.URLEncoder.encode(mname) + "&memail=" + memail + "&mgender=" + mgender);
	}
%>