<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_orderBoard.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
         #banner {height: 170px; line-height: 170px; background:url("패턴 - 복사본.jpg") center top repeat-x;}
      
    </style>
</head>
<body>
<div id="wrap">
      <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <div id="banner">
            <div class="contaniner">마이페이지</div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- product -->
                <div class="contaniner">
                    <div id="mypage">
                        <div id="mypage_info">
                            <div class="user_info" style="width:95px; border-left:1px solid #bebbb6">
                                <div class="user_photo" style="margin-top:30px; padding-left:10px; float: left;">
                                    <img src="사이트이미지/user.png">
                                </div>
                            </div>
                            <div class="user_info" style="width:450px;">
                                <table class="detail_tb" cellpadding="0" cellspacing="0"  >
                                    <tr class="d1">
                                        <td width="60" name="username">홍길동</td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" >골드등급</td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="#" >회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" >500Point</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" >3장</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" >10개</a>
                            </div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="#" class="active float"> 주문배송조회</a>
                            <a href="#" class=" float">공간대여확인</a>
                            <a href="<%=contextPath %>/myAdress.me" class=" float">나의배송지</a>
                            <a href="#" class=" float">1:1문의</a>
                            <a href="#" class="float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>

                        <div id="mp_con1">
                            
                            <!-- 배송 아이콘 확인칸 -->
                            <div class="mypage-outer">
                                <div class="order-outer-wrap">
                                    <div class="order-outer">
                                        <div class="order-state">
                                            <p>나의주문내역</p>
                                        <span>나의 주문내역을<br>확인해보세요</span>
                                        </div>
                                        <div class="myorder">
                                            <div class="l"><img src="주문관리_1.png" width="80"height="80"><br><br>주문접수<P>0</P></div>
                                            <div class="t"><span>></span></div>
                                            <div class="l"><img src="카드_2.png" width="80"height="80"><br><br>결제완료<P>0</P></div>
                                            <div class="t"><span>></span></div>
                                            <div class="l"><img src="상품준비2.png" width="80"height="80"><br><br>상품준비<P>0</P></div>
                                            <div class="t"><span>></span></div>
                                            <div class="l"><img src="배송중.png" width="80"height="80"><br><br>배송중<P>0</P></div>
                                            <div class="t"><span>></span></div>
                                            <div class="l"><img src="배송완료.png" width="80"height="80"><br><br>배송완료<P>0</P></div>
                                        </div>
                                    </div>   
                                </div>    
                            </div>
                            <!-- 배송 아이콘 끝 -->
                            <!-- 최근 주문 내역-->
                            <div class="rd-outer">
                                <div class="rd-1"></div>
                                <div class="rd-2" >
                                    <p >최근 주문내역</p>  
                                </div>
                                <div class="rd-3">
                                    <a >더보기></a>
                                </div>
                                <div  class="r"></div>
                                <div class="new-order-wrap">
                                    <div class="new-order">
                                        <div class="new-order-info">
                                            <ul>
                                                <li >주문일시 <span > 2020.04.19</span></li>
                                                <li> |주문번호 <span> 20204595686</span></li>
                                            </ul>
                                        </div>
                                        <div class="new-order-title"><p>일반상품 1개</p></div>
                                        
                                        
                                        <!--product list-->
                                        <div class="rd-pro-list">
                                            <div class="rd-pro1"><img src="product2_1.jpg" alt=""width="250"height="250"></div>
                                            <div class="rd-pro2 pro" ><span>콜드브루 500ml 한개</span></div>
                                            <div class="rd-pro3 pro">18000원</div>
                                            <div class="rd-pro4 pro">배송완료</div>
                                            <div class="rd-pro5 pro">배송비 2500원</div>

                                        </div>
                                     
                                        <div class="rd-pro-list">
                                        
                                            <div>최근에 주문하신 상품이없습니다</div>
                                        </div>
                                        <!-- rd dashboard-->
                                        <div class="rd-dashboard">
                                            <div class="t1">
                                                <p>결제수단 신용카드</p>
                                            </div>
                                            <div class="rd-dashboard-outer" >
                                                <div class="t2"></div>
                                                <div class="point">
                                                   <div class="point1"><span>포인트사용</span></div>
                                                   <div class="price1"><span>결제금액</span></div>
                                                </div>
                                                <div class="price">
                                                   <div class="point2">
                                                  <p>-500P</p>
                                                   </div>
                                                   <div class="price2">
                                                       <p>50,000원</p>
                                                   </div>

                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>


                             </div>

                        
                           
                        </div>
                    </div>
                </div>
        </div>
        <!-- //content-->
       
   		<%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
</body>
</html>