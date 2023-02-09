<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, jdbc.FeedDAO, jdbc.FeedDTO, java.util.List"%>
<%@ page errorPage="page_error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Group Talk</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <link href="/css/gt.css" rel="stylesheet">
</head>
<body>

<%@ include file="/header.jsp"%>

	<div class="container bg-light shadow mx-auto p-5 w-75">
	
<!-- 
	container 화면 전체를 차지하지 않는 고정 크기 컨테이너, 브라우저의 크기에 반응하여 자동으로 크기가 변동된다. 
	bg-warning bg 배경을 warning 노랑색으로 채운다.
	shadow 입체감있게 그림자 효과 추가
	mx-auto m 바깥여백 x 가로로 auto 화면 가운데 정렬
	p padding 안쪽 여백
	w 전체 너비
-->

		<div style="height: 100px;"></div>

		<h2>Group Talk</h2>
		<div>
<!-- 		
			<div class="input-group">
				<input id="id" type="hidden" value="asd">
				<input id="content" class="form-control" type="text" placeholder="내용을 입력하세요.">
				<button type="button" class="btn btn-primary" onclick="addItem()">추가</button>
			</div>
 -->			

<%
	if(sid != null) {
%>
 
			<div class="container">
				<input id="id" type="hidden" value="<%=sid%>">
				<textarea class="form-control" id="content" rows="3"></textarea>
				<button type="button" class="btn btn-warning col-12" onclick="addItem()">추가</button>
			</div>
			<div style="height: 100px;"></div>
			
<%
	}
%>

			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" class="col-2">작성자</th>
			      <th scope="col" class="col-7">내용</th>
			      <th scope="col" class="col-2">작성일</th>
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
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js">
	</script>
	
	<script>
		function addItem() {
			$.ajax({
				type : "post",
				url : "feed/feedAdd.jsp",
				data : {id : document.getElementById('id').value,
						content : document.getElementById('content').value
						},
				dataType : "text",
				success : function(data) {
					var content = document.getElementById('content');
					content.value = '';
					searchFunction();
				}
			});
		}
		
		function delItem(no) {
			$.ajax({
				type : "post",
				url : "feed/feedDel.jsp",
				data : {no : no},
				dataType : "text",
				success : function(data) {
					searchFunction();
				}
			});
		}
		
		function searchFunction() {
			$.ajax({
				type : 'post',
				url : 'feed/feedAll.jsp',
				success : function (data) {
					var feeds = JSON.parse(data.trim());
					
					var str = "";
					for(var i = 0; i < feeds.length; i++){
						str += "<tr><td>" + feeds[i].id + "</td>";
						str += "<td>" + feeds[i].content + "</td>";
						str += "<td>" + feeds[i].ts + "</td>";
						str += "<td>";
						
						if(feeds[i].id == "<%=sid%>"){
							str += "<div onclick='delItem(\"" + feeds[i].no + "\")'><span class='btn btn-danger'>Delete</span></div>";
						}
						
						str += "</td></tr>";
					}
					$("#ajaxTable").html(str);
					$('img').width('100%').height('100%');
				}
			});
		}
		
		window.onload = function() {
			searchFunction();
		}
		
		$('#content').summernote({
	        placeholder: '내용을 입력하세요.',
	        tabsize: 2,
	        height: 120,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ]
	      });
	</script>
</body>
</html>
