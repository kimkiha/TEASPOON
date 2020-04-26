<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어바웃 | TeaSpoon</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/about_teaspoon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
    
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Playfair+Display|Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	<style>
	#first {font-family: 'Abril Fatface', cursive;
			font-family: 'Playfair Display', serif;}
	#second{font-family: 'Noto Sans KR', sans-serif;}
	</style>
</head>

<body>
	   <div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <!-- //banner -->
            <div id="content1" >
            <div style="height:84px"></div>
                <div class="box" id="first">
                    <div>
                        <ul>
                            <li class="first_tt">Close<br>To You<br>Teaspoon</li>
                        </ul>
                    </div>
            	</div>
            <div class="box" id="second">
            	<div>
            		<ul>
                        <li class="second_tt">About TeaSpoon </li>
                           <li class="content_text">
			                   <ul>
			                   	<li class="con">
			                   		쉴 새 없이 격변하는 시대의 흐름 속에서 <br>
									카페의 개념과 모습 또한 다양하게 변화하고 있습니다.<br>
									<br>
									이러한 상황속에서 Tea Spoon은 어떠한 공간, <br>
									어떠한 매체를 통하여 고객에게 다가갈 수 있는지 <br>
									끊임없이 고민하며<br>
									온˙오프라인의 다양한 플랫폼을 통하여 <br>
									고객에게 카페&TEA 문화를 접하는데 있어서 <br>
									최적의 환경을 선사하고자 합니다.<br><br>
									
									Tea Spoon과 함께라면 <br>
									마시는 즐거움에 있어서 아무런 제약이 없기를 바랍니다.
			                   	</li>
			                   </ul>             
                          </li>
                     </ul>
                </div>
            </div>
            <div class="box" id="third" align="center">
            	<div style="width:1200px">
	            	<div class="photo"><img src="<%=contextPath %>/resources/img/board/about_1.jpg" alt=""></div>
	            	<div class="photo"><img src="<%=contextPath %>/resources/img/board/about_2.jpg" alt=""></div>
	            	<div class="photo"><img src="<%=contextPath %>/resources/img/board/about_3.jpg" alt=""></div>
            	</div>
            	<ul >
            		<li>  			
					<p style="font-size:20px;font-weight:600">티스푼은 커피의 품질과 추출에 대해 열정을 갖고 계속해서 고민하고 함께 결정하는 것을 지향합니다.</p>
					<br>
					<p>
					우리는 서로가 만족할 수 있는 커피, 하나의 문화로 남을 수 있는 커피를 제공하기 위해 추출 교육과 퀄리티 컨트롤에 시간을 쏟아냅니다. 각 생두의 잠재적 특성을 끌어내기 위한 최적의 온도, 로스팅 시간, 
					열량 조절을 찾아내어 프로파일을 구축해냅니다. 이 모든 일련의 과정을 통해 티스푼의 커피 로스터스는 타협하지 않는 품질 관리와 모두가 공감할 수 있는 구체적인 결과물을 만들어 냅니다. 
					다양한 실험을 통해 표면적이지 않고, 또 다른 사고의 지점을 건드리는 행위. 이는 곧 작은 세계에 대한 표현이자 ‘어떤 커피를 어떻게 내어놓을까’라는 가장 원초적인 목표입니다.
					앤트러사이트는 매일 커피를 볶아내는 작업이 이루어지며 신선한 커피를 위해 노력합니다. 이러한 우리의 태도는 카페, 레스토랑, 기타 업체 등 어느 곳에서든 체험하실 수 있으며, 
					우리는 모두가 함께 즐길 수 있는 한 잔의 커피를 약속합니다.
            		</p>
            		</li>
            	</ul>
            </div>
        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!-- //wrap-->
 </div>   
    <script type="text/javascript">
        window.onload = function () {
            var elm = ".box";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 900, complete: function () {
                        }
                    });
                });
            });
        }
    </script>
</body>
</html>