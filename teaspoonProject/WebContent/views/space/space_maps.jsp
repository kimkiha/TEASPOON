<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/space/space_maps.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3d268fe7634edefdbb55d54f3f2ea12"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    
	


    

<style>
 #content1 {width:100%; height:1000px; background: #ffffff; }
</style>
</head>
<body>
  <div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
  
        <!-- //header -->
        <!-- //banner -->
        <div id="content">
            <!-- reserv -->
            <div id="content1">
                <div class="contaniner" >
 					<div id="map">찾아오시는 길</div><br><br><br><br><br><br><br><br>
                    <div margin-top:200px>
                        <p id="font1">기존주소 : 서울특별시 강남구 역삼동 823-34</p>
                        <p id="font2">도로명 새주소 : 서울특별시 강남구 테헤란로 14길 6남도빌딩</p>
                    </div>
 				</div>
            </div>
        </div>
        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
 <style>
 #map{width:100%; height:512px; top:150px; overflow:none;}
 </style>
    <script>
	//지도를 담을 영역의 dom 레퍼런스
	var container = document.getElementById('map');
	//지도를 생성할 때 필요한 기본 옵션
	var options = {
	//지도의 중심좌표.
	center: new daum.maps.LatLng(37.5117394, 127.0430889),
	//지도의 레벨(확대, 축소 정도)
	level: 3
	};
		
	//지도 생성 및 객체 리턴
	var map = new kakao.maps.Map(container, options);
	
	var marker = new kakao.maps.Marker();
	
	kakao.maps.event.addListener(map,'tilesloaded', displayMarker);
	
	function displayMarker() {
		
		marker.setPosition(map.getCenter());
		marker.setMap(map);
	}
</script>
</body>
</html>