<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<a id="custom-login-btn" href="javascript:kakaoLogin()">
			<img src="kakao.png">
		</a>
	
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		
		<script>
			//발급 받은 키
			Kakao.init("9be778870feb90201270c5f6faab06c8");
			
			function kakaoLogin() {
				window.Kakao.Auth.login({
					// 개발자 사이트에서 체크한 항목과 반드시 일치해야 한다.
					scope : 'profile_nickname, account_email, gender',
					success : function (authObj) {
						window.Kakao.API.request({
							url : '/v2/user/me',
							success : res => {
								const KakaoAccount = res.kakao_account;
								location.href = 'loginKakaoCheck.jsp?mname=' + KakaoAccount.profile.nickname
										+ '&memail=' + KakaoAccount.email
										+ '&mgender=' + KakaoAccount.gender;
							}
						});
					}
				});	
			}
		</script>
	</body>
</html>