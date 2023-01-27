<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<header class="p-3 text-bg-dark">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
      </a>

      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li><a href="main.jsp" class="nav-link px-2 text-secondary">홈</a></li>
        <li><a href="#" class="nav-link px-2 text-white">제품목록</a></li>
        <li><a href="#" class="nav-link px-2 text-white">고객관리</a></li>
        <li><a href="/smsExam/board/board.jsp" class="nav-link px-2 text-white">게시판</a></li>
        <li><a href="#" class="nav-link px-2 text-white">소개</a></li>
      </ul>

      <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
        <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
      </form>

      <div class="text-end">
        <button type="button" class="btn btn-outline-light me-2">로그인</button>
        <button type="button" class="btn btn-warning" onclick="location.href='/smsExam/join.jsp'">회원가입</button>
      </div>
    </div>
  </div>
</header>