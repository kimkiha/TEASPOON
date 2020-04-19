<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/event.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner{height: 170px; line-height: 170px; background:rgb(222, 219, 210);}
    </style>
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <div></div>
        <div id="banner">
            <div class="contaniner title">이벤트</div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="event">
                        <div class="status">
                            <ul>
                                <li style="margin-left:350px; "><a href="#"><b>진행중이벤트</b></a></li>
                                <li>&nbsp;/&nbsp;</li>
                                <li><a href="#">종료된이벤트</a></li>
                            </ul>
                        </div>
                        <div>
                            <div id="event_content">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <div class="img">
                                                <img src="사이트이미지/이벤트/이벤트-1.jpg">
                                            </div>
                                        </a>
                                        <div class="event_text">
                                            <span>D-30</span>
                                            <h1>4월 출석이벤트!!</h1>
                                            <p>2020.04.01~2020.04.30</p>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="img">
                                                <img src="사이트이미지/이벤트/이벤트-2.jpg">
                                            </div>
                                        </a>
                                        <div class="event_text">
                                            <span>D-30</span>
                                            <h1>4월 출석이벤트!!</h1>
                                            <p>2020.04.01~2020.04.30</p>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="img">
                                                <img src="사이트이미지/이벤트/이벤트-1.jpg">
                                            </div>
                                        </a>
                                        <div class="event_text">
                                            <span>D-30</span>
                                            <h1>4월 출석이벤트!!</h1>
                                            <p>2020.04.01~2020.04.30</p>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="img">
                                                <img src="사이트이미지/이벤트/이벤트-2.jpg">
                                            </div>
                                        </a>
                                        <div class="event_text">
                                            <span>D-30</span>
                                            <h1>4월 출석이벤트!!</h1>
                                            <p>2020.04.01~2020.04.30</p>
                                        </div>
                                    </li>
                                </ul>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <div id="footer">
            <div class="contaniner">
                <div id="foot">
                    <div class="ft_logo"> 
                        <img src="사이트이미지/메인/foot_logo.png">
                    </div>
                    <div class="ft_content">
                        <ul>
                            <li style="padding-left: 0;"><a href="#">브랜드소개</a></li>
                            <li><a href="#">서비스 이용약관</a></li>
                            <li><a href="#">개인정보 처리방침</a></li>
                            <li><a href="#">영상정보 처리방침</a></li>
                            <li><a href="#">관리자 로그인</a></li>
                        </ul>
                        <br>
                        <p>(주)TEA SPOON<br>
                            서울특별시 강남구 테헤란로 14길 6 남도빌딩 | 사업자등록번호 : 111 - 22 - 33333<br>
                            (주)ooo 구매안전서비스 고객님의 안전거래를 위해 현금 거래에 대해 ooo 에스크로 서비스를 이용하실 수 있습니다.
                            <br><br>
                            TEA SPOON. All rights reserved.
                        </p>
                    </div>
                    <div class="ft_quick">
                        <a href="#"><img src="사이트이미지/메인/loca.png"></a>
                        <a href="#"><img src="사이트이미지/메인/chat.png"></a>
                        <a href="#"><img src="사이트이미지/메인/insta.png"></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- //footer-->
    </div>
    <!-- //wrap-->
    </div>
    <script>
        $(function(){
            $("#login").click(function(){
                alert("로그인하시겠습니까?");
            });
        });
        $(function(){
            $(document).ready(function(){
                $("#navi li").hover(function(){
                    $(".ul", this).stop().slideDown(600);
                },
                function(){
                    $(".ul", this).stop().slideUp(600);
                });
            });
        });

        $(function(){
            $(document).ready(function(){
                $("#myPage_icon").click(function(){
                    $("ul", this).stop().slideDown(600);
                    },
                    function(){
                    $("ul", this).stop().slideUp(600);
                });
            });
        });
    </script>
</body>
</html>