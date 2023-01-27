package user;

import java.io.*;
import java.util.*;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import smtp.GoogleSMTP;
import smtp.NaverSMTP;

@WebServlet("/UserAuthServlet")
public class UserAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //한글 처리
		response.setContentType("text/html;charset=UTF-8");

		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		
		String authNo = Integer.toString((int)(Math.random()*1000));
		
		if (userEmail.contains("gmail")) { // 이메일이 구글일 경우
			Map<String, String> emailInfo = new HashMap<String, String>();
			
			emailInfo.put("userName", userName);
			emailInfo.put("userEmail", userEmail);
			emailInfo.put("subject", "[구글] 회원 가입 인증 번호입니다."); //메일 제목
			
			String htmlContent = ""; // 전체 내용을 html 형식으로 바꾸어 저장할 변수
			
			//html 메일 템플릿 파일 읽어오기
			String templatePath = "C:/develop/jsp/AjaxExam/WebContent/Auth.html";
			BufferedReader br = new BufferedReader(new FileReader(templatePath));
			
			String oneLine;
			while ((oneLine = br.readLine()) != null) {
				htmlContent += oneLine + "\n";
			}
			
			br.close();
			
			// 읽어온 템플릿의 자리표시자인 부분을 메일 내용으로 대체
			htmlContent = htmlContent.replace("__NAME__", userName);
			htmlContent = htmlContent.replace("__NUM__", authNo);
			
			// 변경 내용 저장
			emailInfo.put("content", htmlContent); // 메일 내용
			emailInfo.put("format", "text/html;charset=UTF-8"); // 메일 형식
			
			GoogleSMTP smtpServer = new GoogleSMTP(); //메일 전송 객체 생성
			try {
				smtpServer.emailSending(emailInfo);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		} else if (userEmail.contains("naver")) { // 이메일이 네이버일 경우
			Map<String, String> emailInfo = new HashMap<String, String>();
			
			emailInfo.put("userName", userName);
			emailInfo.put("userEmail", userEmail);
			emailInfo.put("subject", "[네이버] 회원 가입 인증 번호입니다."); //메일 제목
			
			String htmlContent = ""; // 전체 내용을 html 형식으로 바꾸어 저장할 변수
			
			//html 메일 템플릿 파일 읽어오기
			String templatePath = "C:/develop/jsp/AjaxExam/WebContent/Auth.html";
			BufferedReader br = new BufferedReader(new FileReader(templatePath));
			
			String oneLine;
			while ((oneLine = br.readLine()) != null) {
				htmlContent += oneLine + "\n";
			}
			
			br.close();
			
			// 읽어온 템플릿의 자리표시자인 부분을 메일 내용으로 대체
			htmlContent = htmlContent.replace("__NAME__", userName);
			htmlContent = htmlContent.replace("__NUM__", authNo);
			
			// 변경 내용 저장
			emailInfo.put("content", htmlContent); // 메일 내용
			emailInfo.put("format", "text/html;charset=UTF-8"); // 메일 형식
			
			NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 객체 생성
			try {
				smtpServer.emailSending(emailInfo);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		response.getWriter().write(authNo);
	}
}