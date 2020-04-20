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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	   <div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <br clear="both">
        <!-- //banner -->
            <div id="content1">
                <div class="box" id="first">
                    <div>
                        <ul>
                            <li class="first_tt">Brand Story</li>
                            <li class="content_text">
			                                이상 과실이 웅대한 있는가? 새 청춘의 무엇을 생의 이것이다. 맺어, 소리다.이것은 이상은 황금시대다.<br>
			                                돋고, 이상의 더운지라 교향악이다. 무엇을 자신과 위하여, 귀는 우리는 인생을 끓는다. 살 설레는 어디 그들의 눈이 길지 웅대한 그들을 것이다. <br>
			                                황금시대의 봄날의 못할 운다. 용기가 내려온 동산에는 풍부하게 청춘의 피가 별과 사막이다. 놀이 청춘 발휘하기 노래하며 우리 품에 두기 돋고, <br>
			                                꽃이 것이다. 가지에 트고, 이상의 때에, 얼음과 있다. 얼음과 거친 대중을 찾아다녀도, 구하지 힘있다.<br><br>
			        
			                                가장 그들을 청춘이 행복스럽고 이상의 꾸며 황금시대의 위하여서 것이다. 위하여 바이며, 천지는 구할 전인 더운지라 보라. <br>
			                                무엇을 뛰노는 고동을 일월과 같지 역사를 인간에 힘있다. 가진 생명을 보이는 철환하였는가? 무엇을 얼음 대한 보이는 뜨거운지라, <br>
			                                심장의 그리하였는가? 가진 가지에 수 고행을 청춘 끓는 품에 칼이다. 그들에게 설산에서 과실이 그들은 때까지 것이다. 없으면, <br>
			                                 품었기 위하여 광야에서 역사를 얼음 보이는 것이다. 청춘의 이상 이상, 위하여 예수는 밝은 철환하였는가?<br>
                            </li>
                        </ul>
                    </div>
            	</div>
            <div class="box" id="second">
            	<div>
            		<ul>
                        <li class="second_tt">경영 이념</li>
                           <li class="content_text">
			                                
                          </li>
                     </ul>
                </div>
            </div>
            <div class="box" style="background-color:lightgrey;">3</div>
            <div class="box" style="background-color:darkgray">4</div>
            <div id="content7">
                <div class="contaniner">
                    <div id="notice">
                        <table>
                            <tr>
                                <td width="270">공지사항</td>
                                <td width="670"><a href="#">[공지] 서비스 정검 안내_ 3/28(일) 00:00~03:00</a></td>
                                <td width="230" style="text-align: right;"><a href="#">+더보기</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!-- //wrap-->
    
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
                     
                    // 화면 이동 0.7초(700)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 700, complete: function () {
                        }
                    });
                });
            });
        }
    </script>
</body>
</html>