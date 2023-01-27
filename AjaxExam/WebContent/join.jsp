<%@page import="user.User, java.util.ArrayList, user.UserDAO" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
		<title>JSP AJAX</title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</head>
	<body>
		<script type="text/javascript">
			var searchRequest = new XMLHttpRequest();
		
			function searchFunction() {
				searchRequest.open("POST", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById('userName').value), true);
				searchRequest.onreadystatechange = searchProcess;
				searchRequest.send(null);
			}
			
			function searchProcess() {
				var table = document.getElementById('ajaxTable');
				table.innerHTML = "";
				if (searchRequest.readyState == 4 && searchRequest.status == 200) {
					var object = eval('(' + searchRequest.responseText + ' )');
					var result = object.result;
					for (var i = 0; i < result.length; i++) { // 유저 데이터 한명 한명의 자료
						var row = table.insertRow(0);
						for (var j = 0; j < result[i].length; j++) { // 유저 한명의 5개 필드를 하나하나 추출
							var cell = row.insertCell(j);
							cell.innerHTML = result[i][j].value;
						}
					}
				}
			}
			
			var registerRequest = new XMLHttpRequest();
			
			function registerFunction() {
				if(document.getElementById('authNo').value == authNo){
					registerRequest.open("POST", "./UserRegisterServlet?userName=" + encodeURIComponent(document.getElementById('registerName').value)
							+ "&userAge=" + encodeURIComponent(document.getElementById('registerAge').value)
							+ "&userGender=" + encodeURIComponent($('input[name=registerGender]:checked').val())
							+ "&userEmail=" + encodeURIComponent(document.getElementById('registerEmail').value)
							+ "&userPhone=" + encodeURIComponent(document.getElementById('registerPhone').value)
							, true);
					registerRequest.onreadystatechange = registerProcess;
					registerRequest.send(null);
				}else{
					alert('인증 번호가 일치하지 않습니다.')
				}
			}
			
			function registerProcess() {
				if(registerRequest.readyState == 4 && registerRequest.status == 200) {
					var result = registerRequest.responseText;
					if(result != "1") {
						alert('등록에 실패했습니다.');
					} else {
						smsFunction();
						var userName = document.getElementById('userName');
						var registerName = document.getElementById('registerName');
						var registerAge = document.getElementById('registerAge');
						var registerEmail = document.getElementById('registerEmail');
						var registerPhone = document.getElementById('registerPhone');
						var authNo = document.getElementById('authNo');
						userName.value = "";
						registerName.value = "";
						registerAge.value = "";
						registerEmail.value = "";
						registerPhone.value = "";
						authNo.value = "";
						searchFunction();
					}
				}
			}
			
			var authRequest = new XMLHttpRequest();
			function authFunction() {
				authRequest.open("POST", "./UserAuthServlet?userName=" + encodeURIComponent(document.getElementById('registerName').value)
						+ "&userEmail=" + encodeURIComponent(document.getElementById('registerEmail').value)
						, true);
				authRequest.onreadystatechange = authProcess;
				authRequest.send(null);
				
				alert('인증 메일이 발송되었습니다.');
			}
			var authNo;
			function authProcess() {
				if (searchRequest.readyState == 4 && searchRequest.status == 200) {
					var result = authRequest.responseText;
					authNo = result;
				}
			}
			
			function auth() {
				if(document.getElementById('authNo').value == authNo){
					alert('인증 번호가 일치합니다.')
				}else{
					alert('인증 번호가 일치하지 않습니다.')
				}
			}
			
			var smsRequest = new XMLHttpRequest();
			function smsFunction() {
				smsRequest.open("POST", "./UserSMSServlet?userName=" + encodeURIComponent(document.getElementById('registerName').value)
						+ "&rphone=" + encodeURIComponent(document.getElementById('registerPhone').value)
						, true);
				smsRequest.onreadystatechange = smsProcess;
				smsRequest.send(null);
			}
			function smsProcess() {
				if(smsRequest.readyState == 4 && registerRequest.status == 200) {
					var result = smsRequest.responseText;
					if(result == "success") {
						alert('가입 축하 메세지 발송');
					} else {
						alert('메세지 발송 실패');
					}
				}
			}
			
			window.onload = function() {
				searchFunction();
			}
		</script>
	
		<header class="p-3 text-bg-dark">
		  <div class="container">
		    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		      <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
		        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
		      </a>
		
		      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
		      </ul>
		
		      <div class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
		        <input id="userName" onkeyup="searchFunction()" type="search" class="form-control form-control-dark text-bg-dark" aria-label="Search">
		      </div>
		
		      <div class="text-end">
		        <button onclick="searchFunction();" type="button" class="btn btn-outline-light me-2">검색</button>
		        <button type="button" class="btn btn-warning" onclick="location.href='/AjaxExam/join.jsp'">회원가입</button>
		      </div>
		    </div>
		  </div>
		</header>
		
		<div class="container">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">이름</th>
			      <th scope="col">나이</th>
			      <th scope="col">성별</th>
			      <th scope="col">이메일</th>
			      <th scope="col">전화번호</th>
			    </tr>
			  </thead>
			  <tbody id="ajaxTable"></tbody>
			</table>
		</div>
		
		<div class="container">
			<form>
				<div class="mb-3">
				  <label class="form-label">이름<input type="text" name="userName" id="registerName" class="form-control"></label>
				</div>
				<div class="mb-3">
				  <label class="form-label">나이<input type="text" name="userAge" id="registerAge" class="form-control"></label>
				</div>
				<div class="mb-3">
				  <label class="form-label">성별</label>
				</div>
				<div class="mb-3">
				  	<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="registerGender" id="inlineRadio1" value="남">
					  <label class="form-check-label" for="inlineRadio1">남</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="registerGender" id="inlineRadio2" value="여">
					  <label class="form-check-label" for="inlineRadio2">여</label>
					</div>
				</div>
				<div class="mb-3">
				  <label class="form-label">이메일 [네이버, 구글만 가능]<input type="text" name="userEmail" id="registerEmail" class="form-control"></label>
				  <button type="button" onclick="authFunction();" class="btn btn-warning">인증 메일 발송</button>
				</div>
				<div class="mb-3">
				  <label class="form-label">인증번호<input type="text" name="authNo" id="authNo" class="form-control"></label>
				  <button type="button" onclick="auth();" class="btn btn-warning">인증 번호 확인</button>
				</div>
				<div class="mb-3">
				  <label class="form-label">전화번호 [예) 011-0011-1111 , '-' 포함해서 입력.]<input type="text" name="userPhone" id="registerPhone" class="form-control"></label>
				</div>
				<button type="button" onclick="registerFunction();" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-warning">취소</button>
			</form>
		</div>
	</body>
</html>