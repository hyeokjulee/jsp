<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주소로 장소 검색 / 로드뷰까지 표시</title>
	</head>
	<body>
	<%
	String addr = request.getParameter("addr");
	%>
		<div id="map" style="width:700px;height:500px;">
		</div>
		<div id="road" style="width:700px;height:500px;">
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9be778870feb90201270c5f6faab06c8&libraries=services">
		</script>
		
		<script>
			var container = document.getElementById('map');
			
			var options = {
					center : new kakao.maps.LatLng(0, 0),
					level : 3
			};
			
			var map = new kakao.maps.Map(container, options);
		
			var geocoder = new kakao.maps.services.Geocoder();
			
			geocoder.addressSearch('<%=addr%>', function(result, status) {
				if(status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});
					
					var infowindow = new kakao.maps.InfoWindow({
						content : '검색한 지점'
					});
					
					infowindow.open(map, marker);
					
					map.setCenter(coords);
					
					
					var roadviewContainer = document.getElementById('road');
					
					var roadview = new kakao.maps.Roadview(roadviewContainer);
					
					var roadviewClient = new kakao.maps.RoadviewClient();
					
					roadviewClient.getNearestPanoId(coords, 50, function(panoId) {
						roadview.setPanoId(panoId, coords);
					});
				}
			});
		</script>
	</body>
</html>