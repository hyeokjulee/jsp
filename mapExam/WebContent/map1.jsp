<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>KakaoMap</title>
	</head>
	<body>
	<%
	String lat = request.getParameter("lat");
	String lng = request.getParameter("lng");
	%>
		<div id="map" style="width:700px;height:700px;">
		</div>
		
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9be778870feb90201270c5f6faab06c8">
		</script>
		
		<script>
			var inputPosition = new kakao.maps.LatLng(<%=lat%>, <%=lng%>);
			
			var container = document.getElementById('map');
			
			var options = {
					center : inputPosition,
					level : 3
			};
			
			var map = new kakao.maps.Map(container, options);
			
			var marker = new kakao.maps.Marker({
				map : map,
			  	position: inputPosition
			});
			
			var iwContent='<div style="padding:5px;">위도 : '+<%=lat%>+'<br>경도 : '+<%=lng%>+'</div>';
			
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent
			});
			
			infowindow.open(map, marker);
		</script>
	</body>
</html>