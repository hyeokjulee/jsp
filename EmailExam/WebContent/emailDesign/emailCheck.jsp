<%@page import="java.io.*, smtp.NaverSMTP, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //한글 처리

	Map<String, String> emailInfo = new HashMap<String, String>();
	
	emailInfo.put("from", request.getParameter("from")); //보내는 사람, 변동 불가, 반드시 본인의 네이버 메일주소
	emailInfo.put("to", request.getParameter("to")); //받는 사람
	emailInfo.put("subject", request.getParameter("subject")); //메일 제목
	
//	emailInfo.put("content", request.getParameter("content")); //메일 내용
//	emailInfo.put("format", "text/plain;charset=UTF-8"); //메일의 형식을 설정 일단 text로 고정

	//HTML 또는 TEXT 로 메일 전송 방법 설정
	String format = request.getParameter("format");
	String content = request.getParameter("content");
	
	if (format.equals("text")) {
		emailInfo.put("content", request.getParameter("content")); //메일 내용
		emailInfo.put("format", "text/plain;charset=UTF-8"); //메일의 형식을 설정 일단 text로 고정
	} else if (format.equals("html")) {
		//html 형식으로 변환하여 저장
		content = content.replace("\r\n", "<br>"); //줄바꿈을  html 형식으로 변환
		
		String htmlContent = ""; // 전체 내용을 html 형식으로 바꾸어 저장할 변수
		
		//html 메일 템플릿 파일 읽어오기
		String templatePath = application.getRealPath("/emailDesign/emailDesign.html");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		String oneLine;
		while ((oneLine = br.readLine()) != null) {
			htmlContent += oneLine + "\n";
		}
		
		br.close();
		
		// 읽어온 템플릿의 자리표시자인 __CONTENT__ 부분을 메일 내용으로 대체
		htmlContent = htmlContent.replace("__CONTENT__", content);
		
		// 변경 내용 저장
		emailInfo.put("content", htmlContent); // 메일 내용
		emailInfo.put("format", "text/html;charset=UTF-8"); // 메일 형식
	}

	try {
		NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 객체 생성
		smtpServer.emailSending(emailInfo);
//		out.print("이메일 전송 성공");
		request.setAttribute("msg", "이메일 전송 성공");
	} catch (Exception e) {
//		out.print("이메일 전송 실패");
		request.setAttribute("msg", "이메일 전송 실패");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <%=request.getAttribute("msg") %>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$(function() {
			$("#exampleModal").modal("show");
		});
	</script>
</body>
</html>