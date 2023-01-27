<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>signupForm.jsp</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<style>
			@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
			
			* {
			  box-sizing: border-box;
			}
			
			body {
			  background: #f6f5f7;
			  display: flex;
			  justify-content: center;
			  align-items: center;
			  flex-direction: column;
			  font-family: 'Montserrat', sans-serif;
			  height: 100vh;
			  margin: -20px 0 50px;
			}
			
			h1 {
			  font-weight: bold;
			  margin: 0;
			}
			
			h2 {
			  text-align: center;
			}
			
			p {
			  font-size: 14px;
			  font-weight: 100;
			  line-height: 20px;
			  letter-spacing: 0.5px;
			  margin: 20px 0 30px;
			}
			
			span {
			  font-size: 12px;
			}
			
			a {
			  color: #333;
			  font-size: 14px;
			  text-decoration: none;
			  margin: 15px 0;
			}
			
			button {
			  border-radius: 20px;
			  border: 1px solid #FF4B2B;
			  background-color: #FF4B2B;
			  color: #FFFFFF;
			  font-size: 12px;
			  font-weight: bold;
			  padding: 12px 45px;
			  letter-spacing: 1px;
			  text-transform: uppercase;
			  transition: transform 80ms ease-in;
			}
			
			button:active {
			  transform: scale(0.95);
			}
			
			button:focus {
			  outline: none;
			}
			
			button.ghost {
			  background-color: transparent;
			  border-color: #FFFFFF;
			}
			
			form {
			  background-color: #FFFFFF;
			  display: flex;
			  align-items: center;
			  justify-content: center;
			  flex-direction: column;
			  padding: 0 50px;
			  height: 100%;
			  text-align: center;
			}
			
			input {
			  background-color: #eee;
			  border: none;
			  padding: 12px 15px;
			  margin: 8px 0;
			  width: 100%;
			}
			
			.container {
			  background-color: #fff;
			  border-radius: 10px;
			    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			      0 10px 10px rgba(0,0,0,0.22);
			  position: relative;
			  overflow: hidden;
			  width: 768px;
			  max-width: 100%;
			  min-height: 480px;
			}
			
			.form-container {
			  position: absolute;
			  top: 0;
			  height: 100%;
			  transition: all 0.6s ease-in-out;
			}
			
			.sign-in-container {
			  left: 0;
			  width: 50%;
			  z-index: 2;
			}
			
			.container.right-panel-active .sign-in-container {
			  transform: translateX(100%);
			}
			
			.sign-up-container {
			  left: 0;
			  width: 50%;
			  opacity: 0;
			  z-index: 1;
			}
			
			.container.right-panel-active .sign-up-container {
			  transform: translateX(100%);
			  opacity: 1;
			  z-index: 5;
			  animation: show 0.6s;
			}
			
			@keyframes show {
			  0%, 49.99% {
			    opacity: 0;
			    z-index: 1;
			  }
			  
			  50%, 100% {
			    opacity: 1;
			    z-index: 5;
			  }
			}
			
			.overlay-container {
			  position: absolute;
			  top: 0;
			  left: 50%;
			  width: 50%;
			  height: 100%;
			  overflow: hidden;
			  transition: transform 0.6s ease-in-out;
			  z-index: 100;
			}
			
			.container.right-panel-active .overlay-container{
			  transform: translateX(-100%);
			}
			
			.overlay {
			  background: #FF416C;
			  background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
			  background: linear-gradient(to right, #FF4B2B, #FF416C);
			  background-repeat: no-repeat;
			  background-size: cover;
			  background-position: 0 0;
			  color: #FFFFFF;
			  position: relative;
			  left: -100%;
			  height: 100%;
			  width: 200%;
			    transform: translateX(0);
			  transition: transform 0.6s ease-in-out;
			}
			
			.container.right-panel-active .overlay {
			    transform: translateX(50%);
			}
			
			.overlay-panel {
			  position: absolute;
			  display: flex;
			  align-items: center;
			  justify-content: center;
			  flex-direction: column;
			  padding: 0 40px;
			  text-align: center;
			  top: 0;
			  height: 100%;
			  width: 50%;
			  transform: translateX(0);
			  transition: transform 0.6s ease-in-out;
			}
			
			.overlay-left {
			  transform: translateX(-20%);
			}
			
			.container.right-panel-active .overlay-left {
			  transform: translateX(0);
			}
			
			.overlay-right {
			  right: 0;
			  transform: translateX(0);
			}
			
			.container.right-panel-active .overlay-right {
			  transform: translateX(20%);
			}
			
			.social-container {
			  margin: 20px 0;
			}
			
			.social-container a {
			  border: 1px solid #DDDDDD;
			  border-radius: 50%;
			  display: inline-flex;
			  justify-content: center;
			  align-items: center;
			  margin: 0 5px;
			  height: 40px;
			  width: 40px;
			}
			
			footer {
			    background-color: #222;
			    color: #fff;
			    font-size: 14px;
			    bottom: 0;
			    position: fixed;
			    left: 0;
			    right: 0;
			    text-align: center;
			    z-index: 999;
			}
			
			footer p {
			    margin: 10px 0;
			}
			
			footer i {
			    color: red;
			}
			
			footer a {
			    color: #3c97bf;
			    text-decoration: none;
			}
		</style>
	</head>
	<body>
	
		<%
			String mname = request.getParameter("mname");
			String memail = request.getParameter("memail");
			String mgender = request.getParameter("mgender");
		%>
	
		<div class="container" id="container">
		  <div class="form-container sign-up-container">
		    <form action="signupCheck.jsp">
		      <h3>Create Account</h3>
		      <input type="text" name="mid" placeholder="ID" value="<%=mname%>" readonly>
		      <input type="password" name="mpass" placeholder="Password">
		      <input type="password" name="mpass0" placeholder="Password Check">
		      <input type="text" name="mname" placeholder="Name">
		      <input type="email" name="memail" placeholder="Email" value="<%=memail%>" readonly>
			  	<select class="form-select p-2 m-1" aria-label="Default select example" name="mgender">
				  <%
				  	if(mgender.equals("male")){
				  %>
				  	<option value="male">Male</option>
				  <%	
				  	}else if(mgender.equals("female")){
				  %>
					<option value="female">Female</option>
				  <%		
				  	}else{
				  %>
				  	<option selected>Gender</option>
					<option value="male">Male</option>
				    <option value="female">Female</option>
				  <%
				  	}
				  %>
				</select>
		      <button class="m-2">Sign Up</button>
		    </form>
		  </div>
		  <div class="form-container sign-in-container">
		    <form action="loginCheck.jsp">
		      <h1>Sign in</h1>
		      <input type="text" placeholder="ID" name="mid">
		      <input type="password" placeholder="Password" name="mpass">
		      <a href="#">Forgot your password?</a>
		      <button>Sign In</button>
		      	<a class="m-4" id="custom-login-btn" href="javascript:kakaoLogin()">
					<img src="kakao1.png">
				</a>
		    </form>
		  </div>
		  <div class="overlay-container">
		    <div class="overlay">
		      <div class="overlay-panel overlay-left">
		        <h1>Welcome Back!</h1>
		        <p>To keep connected with us please login with your personal info</p>
		        <button class="ghost" id="signIn">Sign In</button>
		      </div>
		      <div class="overlay-panel overlay-right">
		        <h1>Hello, Friend!</h1>
		        <p>Enter your personal details and start journey with us</p>
		        <button class="ghost" id="signUp">Sign Up</button>
		      </div>
		    </div>
		  </div>
		</div>
		
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
								location.href = 'loginCheckKakao.jsp?mname=' + KakaoAccount.profile.nickname
										+ '&memail=' + KakaoAccount.email
										+ '&mgender=' + KakaoAccount.gender;
							}
						});
					}
				});	
			}
			
			const signUpButton = document.getElementById('signUp');
			const signInButton = document.getElementById('signIn');
			const container = document.getElementById('container');
	
			signUpButton.addEventListener('click', () => {
			  container.classList.add("right-panel-active");
			});
	
			signInButton.addEventListener('click', () => {
			  container.classList.remove("right-panel-active");
			});
			
			signUpButton.click();
		</script>
	</body>
</html>