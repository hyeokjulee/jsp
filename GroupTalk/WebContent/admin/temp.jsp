<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.UserDAO"%>
<%@ page errorPage="page_error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>가입 신청자 목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="/css/gt.css" rel="stylesheet">
</head>
<body>

<%@ include file="/header.jsp"%>

	<div class="container bg-light shadow mx-auto p-5 w-75">
	
		<div style="height: 100px;"></div>

		<h2>가입 신청자 목록</h2>
		<div>
<%
	if(sid != null) {
%>
			<div style="height: 100px;"></div>
<%
	}
%>
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" class="col-5">ID</th>
			      <th scope="col" class="col-5">NAME</th>
			      <th scope="col" class="col-1"></th>
			      <th scope="col" class="col-1"></th>
			    </tr>
			  </thead>
			  <tbody id="ajaxTable">
			  </tbody>
			</table>

		</div>
	</div>
	
<%@ include file="/footer.jsp"%>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	</script>
	
	<script>
		function addItem(id, password, name) {
			$.ajax({
				type : "post",
				url : "userAdd.jsp",
				data : {id : id,
						password : password,
						name : name},
				dataType : "text",
				success : function(data) {
					var user = JSON.parse(data.trim());
					delItem(user.id);
				}
			});
		}
		
		function delItem(id) {
			$.ajax({
				type : "post",
				url : "tempDel.jsp",
				data : {id : id},
				dataType : "text",
				success : function(data) {
					searchFunction();
				}
			});
		}
		
		function searchFunction() {
			$.ajax({
				type : 'post',
				url : 'tempAll.jsp',
				success : function (data) {
					var users = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < users.length; i++){
						str += "<tr><td>" + users[i].id + "</td>";
						str += "<td>" + users[i].name + "</td>";
						str += "<td><div onclick='addItem(\"" + users[i].id + "\", \"" + users[i].password + "\", \"" + users[i].name + "\")'><span class='btn btn-primary'>Accept</span></div></td>";
						str += "<td><div onclick='delItem(\"" + users[i].id + "\")'><span class='btn btn-danger'>Reject</span></div></td></tr>";
					}
					$("#ajaxTable").html(str);
					$('img').width('100%').height('100%');
				}
			});
		}
		
		window.onload = function() {
			searchFunction();
		}
	</script>
</body>
</html>
