<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEASPOON</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main/main.css">

<script type="text/javascript" src="resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>

<div id="wrap">
       <%@ include file="views/common/menubar.jsp" %>
        <br clear="both">
        <div id="banner">
            <div class="contaniner"><img id="mainImg" src="<%=contextPath%>/resources/img/main/main.jpg"></div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="product">
                        <div class="pname"><p>PRODUCT</p></div>
                        <div id="product_item">
                            <div id="product_item_1"> 
                                <div>
                                    <a href="">
                                        <img src="<%=contextPath %>/resources/img/store/main_product9_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                                <div >
                                    <a href="">
                                        <img src="<%=contextPath %>/resources/img/store/main_product11_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                                <div>
                                    <a href="">
                                        <img src="<%=contextPath %>/resources/img/store/main_product12_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                                <div>
                                    <a href="#">
                                        <img src="<%=contextPath %>/resources/img/store/main_product13_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                            </div>
                            <br clear="both">
                            <div id="product_item_1"> 
                                <div>
                                    <a href="">
                                        <img src="<%=contextPath %>/resources/img/store/main_item2_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                                <div >
                                    <a href="">
                                        <img src="<%=contextPath %>/resources/img/store/main_product1_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                                <div>
                                    <a href="">
                                        <img src="<%=contextPath %>/resources/img/store/main_product2_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                                <div>
                                    <a href="">
                                        <img src="<%=contextPath %>/resources/img/store/main_item4_1.jpg" alt="">
                                    </a>
                                    <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
                                    <p>
                                        <b>\18,000원</b>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 맞춤추천/공간대여 -->
            <div id="content2">
                <div class="contaniner" >
                    <div id="link">
                        <div id="link1" align="center">
                               <p style="padding-top:65px"><small>나의 커피찾기,</small></p>
                               <p><b>내 입맞에 맞는 커피를 추천받아보세요</b></p>
                                <button id="btnLink1"><a href="<%=contextPath %>/selectitem.st">추천 바로가기</a></button>
                        </div>
                        <div id="link2" align="center">
                            <p style="padding-top:65px"><small>티스푼 공간대여 서비스</small></p>
                            <p><b>특별한 날 특별한 장소, 다양한 공간에서 즐기는 티타임</b></p>
                            <button id="btnLink2"><a href="<%=contextPath %>/rental.sp">공간대여 바로가기</a></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- best coffee20 -->
            <div id="content3">
                <div class="contaniner">
                    <div id="best">
                        <div class="bestname"><p>BEST COFFEE 4</p></div>
                        <div id="best_item"> 
                            <div class="best_content">
                            	<div class="best_num">
	                                <p class="num">1</p>
	                                <a href="">
	                                    <img src="<%=contextPath %>/resources/img/store/mainBest_product1_1.jpg" alt="">
	                                </a>
	                                <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
	                                <p class="best_product_price">
	                                   <b>\18,000원</b>
	                                </p>
                                </div>
                            </div>
                            <div class="best_content">
                            	<div class="best_num">
	                                <p class="num">2</p>
	                                <a href="">
	                                    <img src="<%=contextPath %>/resources/img/store/mainBest_product2_1.jpg" alt="">
	                                </a>
	                                <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
	                                <p class="best_product_price">
	                                   <b>\18,000원</b>
	                                </p>
                                </div>
                            </div>
                            <div class="best_content">
                            	<div class="best_num">
	                                <p class="num">3</p>
	                                <a href="">
	                                    <img src="<%=contextPath %>/resources/img/store/mainBest_product3_1.jpg" alt="">
	                                </a>
	                                <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
	                                <p class="best_product_price">
	                                   <b>\18,000원</b>
	                                </p>
                                </div>
                            </div>
                            <div class="best_content">
                            	<div class="best_num">
	                                <p class="num">4</p>
	                                <a href="">
	                                    <img src="<%=contextPath %>/resources/img/store/mainBest_product4_1.jpg" alt="">
	                                </a>
	                                <p class="best_product_name"><a href="#">콜롬비아 비오타 팔마레스</a></p>
	                                <p class="best_product_price">
	                                   <b>\18,000원</b>
	                                </p>
                                </div>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
            <!-- 할인쿠폰 -->
            <div id="content4">
                <div class="contaniner">
                    <a class="nohover" href="#">                
                        <div id="coupon">
                            <p>20% 할인쿠폰 놓치지 마세요.</p>
                        </div>
                    </a>
                </div>
            </div>
            <!-- 매거진/이벤트/어바웃티스푼 -->
            <div id="content5">
                <div class="contaniner"> 
                    <div id="etc">
                        <table id="etc_tb" cellspacing="0" cellpadding="0" border-spacing="0">
                            <tr>
                                <td rowspan="2" width="400" height="550">
                                <p></p> <!-- 이벤트 -->
                                    <a href="<%=contextPath %>/eventList.bo"><img id="maga" src="<%=contextPath %>/resources/img/main/magazine.jpg"></a>
                                </td>   <!-- 어바웃티스푼 -->
                                <td width="600" height="275">
                                    <a href="<%=contextPath %>/about.bo"><img id="eve" src="<%=contextPath %>/resources/img/main/event.jpg"></a>
                                </td>
                            </tr>
                            <tr>	    <!-- 매거진 -->
                                <td><a href="<%=contextPath %>/magazineList.bo?currentPage=1"><img id="abo" src="<%=contextPath %>/resources/img/main/brandstory.jpg"></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
               </div>
            <!-- 인스타그램 -->
            <div id="content6">
                <div class="contaniner">
                <div id="insta">
                    <div id="insta_1">
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_1.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_2.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_3.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_4.jpg"></a></div>
                    </div>
                    <br clear="both">
                    <div id="insta_1">
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_5.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_6.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_7.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_8.jpg"></a></div>
                    </div>
                </div>
                </div>
            </div>
            
        <!-- //content-->
        <%@ include file="views/common/footer.jsp" %>
    </div>
    <!-- //wrap-->
    </div>
    <script>
	    if(<%=request.getSession().getAttribute("b")%> == null){
	    	location.href='noticeMain.bo';
	    }
    	
	    
    	
    </script>    
</body>
</html>