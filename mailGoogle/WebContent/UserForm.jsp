<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">Navbar</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNavDropdown">
		      <ul class="navbar-nav">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Features</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Pricing</a>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            회원관리
		          </a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="#">로그인</a></li>
		            <li><a class="dropdown-item" href="#">로그아웃</a></li>
		            <li><a class="dropdown-item" href="UserForm.jsp">회원가입</a></li>
		            <li><a class="dropdown-item" href="#">회원탈퇴</a></li>
		          </ul>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	
		<div class="container">
			<form class="row g-3" action="UserCheck.jsp" method="post">
			  <div class="col-md-6">
			    <label for="inputEmail4" class="form-label">Email</label>
			    <input name="to" type="email" class="form-control" id="inputEmail4">
			  </div>
			  <div class="col-md-6">
			    <label for="inputPassword4" class="form-label">Password</label>
			    <input name="pass" type="password" class="form-control" id="inputPassword4">
			  </div>
			  <div class="col-12">
			    <label for="inputAddress" class="form-label">Name</label>
			    <input name="name" type="text" class="form-control" id="inputAddress">
			  </div>
			  <div class="col-12">
			    <label for="inputAddress2" class="form-label">Content</label>
			    <input name="content" type="text" class="form-control" id="inputAddress2">
			  </div>
			  <div class="col-12">
			    <button type="submit" class="btn btn-primary">회원 가입</button>
			  </div>
			</form>
		</div>
	</body>
</html>