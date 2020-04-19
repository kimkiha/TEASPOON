<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 | TeaSpoon</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_view.css">>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_view_photo.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main/main.css">
    
    <script type="text/javascript" src="resources/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner{height: 170px; line-height: 170px; background:rgb(222, 219, 210); margin-top:64px;}
    </style>
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <br clear="both">
        <div id="banner" >
            <div class="title">매거진</div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- product -->
                <div id="maga" >
                    <div id="magazine">
                        <div id="title">
                            <div id="title_detail">
                                <div id="con_tt"><p>아침에 커피를 내릴때면,</div>
                                <br><br>
                                <div id="con_wr">
                                    <ul>
                                        <li>Editor's letter &nbsp;|</li>
                                        <li>&nbsp;2020 SPRING</li>
                                    </ul>
                                </div>
                            </div>
                            <div id="sns">
                                <ul>
                                    <li><a href="#"><img src="<%=contextPath %>/resources/img/board/twitter.png" alt="트위터공유하기"></a></li>
                                    <li><a href="#"><img src="<%=contextPath %>/resources/img/board/facebook.png" alt="페이스북 공유하기"></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="magazine_photo1">
                            <img src="">
                        </div>
                        <div class="magazine_content1">
                            <p>
				                                커피는 아라비카, 로부스타, 리베리카 이렇게 세 종류의 나무에서 생산됩니다.
				                                아라비카는 좋은 향미가 풍부하고 카페인 함량이 적어 전 세계 커피 산출량의 약 70%를 차지하고 있습니다. 
				                                주요 생산국은 브라질, 콜롬비아, 멕시코, 과테말라, 에티오피아, 하와이, 인도 등이 있습니다. 
				                                마일드 종은 향기가 풍부해 스트레이트 커피에 많이 사용되고, 브라질 종은 다른 커피콩과 섞었을 때 
				                                향미가 특히 좋아지기 때문에 블렌드 커피에 많이 사용됩니다.
				                                로부스타는 인스턴트 커피에 이용되며 베트남, 인도네시아, 우간다, 콩고, 필리핀 등에서 주로 생산됩니다. 
				                                아라비카 종과 달리 척박한 환경에서도 잘 자라는데 품질이 약간 떨어져 맛이 쓰고 거칠며 향기가 약한 편입니다. 
				                                세계 커피 수확량의 약 30%를 차지하며, 수확량이 많기 때문에 저렴한 커피의 재료로 이용되고 있습니다.
				                                리베리카는 향기와 맛이 별로 좋지 않은데다 전체 산출량이 1%도 되지 않아 주요 생산국에서 현지 소모되고 있습니다.
                            </p>
                        </div>
                        <div class="magazine_photo1">
                            <img src="">
                        </div>
                        <div class="magazine_content1 magazine_content2">
                            <p>
				                                커피는 아라비카, 로부스타, 리베리카 이렇게 세 종류의 나무에서 생산됩니다.
				                                아라비카는 좋은 향미가 풍부하고 카페인 함량이 적어 전 세계 커피 산출량의 약 70%를 차지하고 있습니다. 
				                                주요 생산국은 브라질, 콜롬비아, 멕시코, 과테말라, 에티오피아, 하와이, 인도 등이 있습니다. 
				                                마일드 종은 향기가 풍부해 스트레이트 커피에 많이 사용되고, 브라질 종은 다른 커피콩과 섞었을 때 
				                                향미가 특히 좋아지기 때문에 블렌드 커피에 많이 사용됩니다.
				                                로부스타는 인스턴트 커피에 이용되며 베트남, 인도네시아, 우간다, 콩고, 필리핀 등에서 주로 생산됩니다. 
				                                아라비카 종과 달리 척박한 환경에서도 잘 자라는데 품질이 약간 떨어져 맛이 쓰고 거칠며 향기가 약한 편입니다. 
				                                세계 커피 수확량의 약 30%를 차지하며, 수확량이 많기 때문에 저렴한 커피의 재료로 이용되고 있습니다.
				                                리베리카는 향기와 맛이 별로 좋지 않은데다 전체 산출량이 1%도 되지 않아 주요 생산국에서 현지 소모되고 있습니다.
                            </p>
                        </div>
                    </div>
                    <div id="pre_next">
                        <div id="pre">
                            <figure class="snip1504" >
                                <img src="<%=contextPath %>/resources/img/board/magazine_view_1.jpg"/>
                                <figcaption>
                                  <h2>KNOW THAT EAT</h2>
                                  <h4>알고마시면 더 맛있는 커피이야기</h4>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                        </div>
                        <div id="next" style="float:left; margin:0 auto">
                            <figure class="snip1504" >
                                <img src="<%=contextPath %>/resources/img/board/magazine_view_2.jpg" >
                                <figcaption>
                                  <h2>what's a coffee</h2>
                                  <h4>커피가 나에게 물을 때</h4>
                                </figcaption>
                                <a href="#"></a>
                            </figure>
                        </div>
                    </div>
                </div>
            <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!-- //wrap-->
    <script src="<%=contextPath %>/resources/js/magazine_view.js"></script>
    
</body>
</html>