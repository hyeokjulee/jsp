<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	    
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
    
    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">

<%@ include file="/header.jsp"%>

	<main class="form-signin w-100 m-auto">
	  <form action="signupCheck.jsp" method="post">
	    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">Please sign up</h1>
	
		<div class="form-floating">
	      <input type="text" name="name" class="form-control" id="floatingName" placeholder="이름을 입력하세요.">
	      <label for="floatingName">Name</label>
	    </div>
	
	    <div class="form-floating">
	      <input type="text" name="id" class="form-control" id="floatingId" placeholder="아이디를 입력하세요.">
	      <label for="floatingId">ID</label>
	    </div>
	    
	    <div class="form-floating">
	      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="암호를 입력하세요.">
	      <label for="floatingPassword">Password</label>
	    </div>
	    
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign up</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2023</p>
	  </form>
	</main>
	
<%@ include file="/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>