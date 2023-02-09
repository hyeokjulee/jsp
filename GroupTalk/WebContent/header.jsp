<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("sid");
%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top" aria-label="Tenth navbar example">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/main.jsp">My MEMO </a>
        </li>
<%
	if(sid != null){
%>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">피드메뉴</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/main.jsp">전체 피드보기</a></li>
            <li><a class="dropdown-item" href="/myFeed.jsp">내 피드보기</a></li>
          </ul>
        </li>
<%
	}
%>        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">회원메뉴</a>
          <ul class="dropdown-menu">
<%
	if(sid == null){
%>
            <li><a class="dropdown-item" href="/user/login.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="/user/signup.jsp">회원가입</a></li>
<%
	} else {
%>
            <li><a class="dropdown-item" href="/user/logout.jsp">로그아웃</a></li>
            <li><a class="dropdown-item" href="/user/signedit.jsp">정보변경</a></li>
            <li><a class="dropdown-item" href="/user/signout.jsp">회원탈퇴</a></li>
<%
	}
%>
          </ul>
        </li>
<%
	if(sid != null && sid.equals("admin")){
%>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">관리메뉴</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/admin/temp.jsp">신청목록</a></li>
          </ul>
        </li>
<%
	}
%>
      </ul>
    </div>
  </div>
</nav>