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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	4acab902db6d66a02e5e7d7eaf9dcf01"></script>
    <!-- services 라이브러리 불러오기 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
    <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<style>
 #content1 {width:100%; height:1500px; background: #ffffff; }
</style>
</head>
<body>
  <div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
  
        <!-- //header -->
        <div id="banner" style="margin-top:150px">
            <div class="contaniner">기하의 베너존</div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- reserv -->
            <div id="content1">
                <div class="contaniner">
 				
 					<div id="map">찾아오시는 길</div><br>
                    <span>
                        <p id="font1">기존주소 : 서울특별시 강남구 역삼동 823-34</p>
                        <p id="font2">도로명 새주소 : 서울특별시 강남구 테헤란로 14길 6남도빌딩</p>
                    </span>
                    
                    <div id="hr"></div>
 				
 				</div>
            </div>
        </div>
        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>

</body>
</html>