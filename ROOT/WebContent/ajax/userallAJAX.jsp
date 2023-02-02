<%@page import="java.util.*, jdbc.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/header.jsp"%>

	<br><br><br><br><br>
	<div class="container">
		<table class="table table-hover">
		  <thead>
		  	<tr>
		  		<th colspan="3">
		  			<b>회원 리스트</b>
		  		</th>
		  	</tr>
		    <tr>
		      <th scope="col" class="col-4">아이디</th>
		      <th scope="col" class="col-4">이름</th>
		      <th scope="col" class="col-4">가입일</th>
		    </tr>
		  </thead>
		  <tbody id="ajaxTable">
		  </tbody>
		</table>
	</div>
	
	<script>
		function searchFunction() {
			$.ajax({
				type : 'post',
				url : 'userCheckAJAX.jsp',
				success : function (data) {
					var users = JSON.parse(data.trim());
					
					var str = '';
					for(var i = 0; i < users.length; i++){
						str += "<tr><td>" + users[i].id + "</td>";
						str += "<td>" + users[i].name + "</td>";
						str += "<td>" + users[i].ts + "</td></tr>";
					}
					$("#ajaxTable").html(str);
				}
			});
		}
	
		window.onload = function() {
			searchFunction();
		}
    </script>
<%@ include file="/footer.jsp"%>
</body>
</html>