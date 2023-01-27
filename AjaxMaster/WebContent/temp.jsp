<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JSP AJAX</title>

</head>
<body>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<script type="text/javascript">
	var searchRequest = new XMLHttpRequest();
	var registerRequest = new XMLHttpRequest();
	function searchFunction() {
		searchRequest.open("Post", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById('userName').value), true);
		searchRequest.onreadystatechange = searchProcess;
		searchRequest.send(null);
	}
	function searchProcess() {
		var table = document.getElementById('ajaxTable');
		table.innerHTML = "";
		if(searchRequest.readyState == 4 && searchRequest.status == 200) {
			var object = eval('(' + searchRequest.responseText + ')');
			var result = object.result;
			for(var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
	function registerFunction() {
		registerRequest.open("Post", "./UserRegisterServlet?userName=" + encodeURIComponent(document.getElementById('registerName').value)
			+ "&userAge=" + encodeURIComponent(document.getElementById('registerAge').value)
			+ "&userGender=" + encodeURIComponent($('input[name=registerGender]:checked').val())
			+ "&userEmail=" + encodeURIComponent(document.getElementById('registerEmail').value)
			, true);
		registerRequest.onreadystatechange = registerProcess;
		registerRequest.send(null);
	}
	function registerProcess() {
		if(registerRequest.readyState == 4 && registerRequest.status == 200) {
			var result = registerRequest.responseText;
			if(result != 1) {
				alert('등록에 실패했습니다.');
			} else {
				var userName = document.getElementById('userName');
				var registerName = document.getElementById('registerName');
				var registerAge = document.getElementById('registerAge');
				var registerEmail = document.getElementById('registerEmail');
				userName.value = "";
				registerName.value = "";
				registerAge.value = "";
				registerEmail.value = "";
				searchFunction();
			}
		}
	}
	window.onload = function() {
		searchFunction();
	}
</script>


<br>
<nav class="navbar bg-dark" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand">Navbar</a>
    <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" id="userName" onkeyup="searchFunction()" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" onclick="searchFunction();" type="button">Search</button>

    </form>
</nav>


<br>


<div class="container-sm">

	<table class="table table-dark table-hover">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Age</th>
				<th scope="col">Gender</th>
				<th scope="col">Email</th>
			</tr>
		</thead>
		<tbody id="ajaxTable">
		</tbody>
	</table>
</div>
<br>
<br>
<!-- <div class="container">
	<table class="table table-dark">
		<thead>
			<tr>
				<th colspan="2" style="text-align: center;">Register</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align: center;">Name</td>
				<td><input class="form-control" type="text" id="registerName"></td>
			</tr>
			<tr>
				<td style="text-align: center;">Age</td>
				<td><input class="form-control" type="text" id="registerAge"></td>
			</tr>
			<tr>
				<td style="text-align: center;">Gender</td>
				<td>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-success">
								<input type="radio" name="registerGender" value="male">Male
							</label>
							<label class="btn btn-danger">
								<input type="radio" name="registerGender" value="female" checked>Female
							</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">Email</td>
				<td><input class="form-control" type="text" id="registerEmail" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><button class="btn btn-primary pull-right" onclick="registerFunction();" type="button">S e n d</button></td>
			</tr>
		</tbody>
	</table>
</div>
 -->

</body>
</html>