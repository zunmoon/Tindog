<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6a722e5c529b436bef9092490566635"></script>
</head>
<body class="wrapper">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div id="map" style="width:500px;height:400px;"></div>	
	<script>
	//지도 설정
	var mapContainer = document.getElementById('map'),
		mapOption = { 
		    center: new kakao.maps.LatLng(36.5,127.5),	// 지도의 중심 좌표(임의 설정)
		    level: 13									// 지도의 확대 레벨(임의 설정)
		};
	    
	//설정한 지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//마커 초기화(초기화 시 지도에 미리 지정 가능 : 카카오맵 API 문서 참조)
	var marker = new kakao.maps.Marker();

	//카카오맵 클릭 이벤트 추가
	kakao.maps.event.addListener(map, 'click', (mouseEvent) => {
		//클릭한 위도, 경도 정보 불러오기
		var latlng = mouseEvent.latLng;
		//마커 위치를 클릭한 위치로 이동
		marker.setPosition(latlng);
		marker.setMap(map);
		
		var lat=latlng.getLat();
		var lng=latlng.getLng();
		alert('위도 : '+lat+' 경도 : '+lng);
	});
	</script>	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
</body>
</html>