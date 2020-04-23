<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.member.model.vo.* "%>
<%

Member myInfo = (Member)session.getAttribute("myInfo");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>layout06</title>
    		 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_main.css">
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
                <div class="contaniner" style="height:2000px;">
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
                                        <td width="60" name="username"><%= myInfo.getUserName() %></td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" ><%=myInfo.getGradeName() %></td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="#" >회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" ><%= myInfo.getPointPrice() %></a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" ><%= myInfo.getCount() %>장</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" ><%=myInfo.getPcode() %>개</a>
                            </div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="#" class=" float"> 주문배송조회</a>
                            <a href="#" class=" float">공간대여확인</a>
                            <a href="#" class=" float">나의배송지</a>
                            <a href="<%=contextPath %>/myqna.me?currentPage=1&userNo=<%=loginUser.getUserNo() %>" class="float">1:1문의</a>
                            <a href="#" class="float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>

                        <div id="mp_con1">
                            <p>배송조회</p>
                            <div style="width:100%; height:360px; background:darkgray; margin-top:40px;">
                            <!-- 배송 아이콘 확인칸 -->
                            <div class="mypage-outer">
                                <div align="center" class="order" style="width:100%; height:60px;">
                                    주문현황
                                </div>
                                <div class="order-outer">
                                    <div class="order-state">
                                        <p>나의주문내역</p>
                                       <span>나의 주문내역을<br>확인해보세요</span>
                                    </div>
                                    <div class="myorder">
                                        <div class="l"><img src="..\mypage main\마페아이콘\주문관리_1.png" width="80"height="80"><br><br>주문접수<P>0</P></div>
                                        <div class="t"><span>></span></div>
                                        <div class="l"><img src="..\mypage main\마페아이콘\카드_2.png" width="80"height="80"><br><br>결제완료<P>0</P></div>
                                        <div class="t"><span>></span></div>
                                        <div class="l"><img src="..\mypage main\마페아이콘\상품준비2.png" width="80"height="80"><br><br>상품준비<P>0</P></div>
                                        <div class="t"><span>></span></div>
                                        <div class="l"><img src="..\mypage main\마페아이콘\배송중.png" width="80"height="80"><br><br>배송중<P>0</P></div>
                                        <div class="t"><span>></span></div>
                                        <div class="l"><img src="..\mypage main\마페아이콘\배송완료.png" width="80"height="80"><br><br>배송완료<P>0</P></div>
                                    </div>
                                </div>     
                            </div>
                            <!-- 배송 아이콘 끝 -->
                            <!--  마이쿠폰-->
                             <div class="cp-outer" >
                                 <div class="cp1"> 
                                     <p style="margin-left: 20px;">마이쿠폰</p>  
                                   </div>
                                   <div class="cp-a"> <a style="float:right;font-size: 17px;margin-bottom: 30p;">더보기></a></div>
                                 <div class="cp2">
                                    <div class="cp">
                                        <div align="center"><img src="../mypage main\coupon.png" width="150"height="110"></div>
                                        <span>멤버십 3천원할인쿠폰</span>
                                     </div>
                                     <div class="cp">
                                        <div align="center"><img src="../mypage main\coupon.png" width="150"height="110"></div>
                                        <span>멤버십 3천원할인쿠폰</span>
                                     </div>
                                     <div class="cp">
                                        <div align="center"><img src="../mypage main\coupon.png" width="150"height="110"></div>
                                        <span>멤버십 3천원할인쿠폰</span>
                                     </div>
                                 </div>
                             </div>
                             <!-- 마이쿠폰 끝-->

                             <!-- 최근 주문내역 -->
                             <div class="rd-outer">
                                <div class="rd-1"></div>
                                <div class="rd-2" >
                                    <p >최근 주문내역</p>
                                  
                                    </div>
                                <div class="rd-3">
                                    <a >더보기></a>
                                </div>
                                <div  class="r"></div>
                                <div class="rd-layer1">
                                    <div class="rd-layer2">
                                        <div class="rd-board1">
                                            <p>주문일자</p>
                                            <p>2030.04.09</p>
                                            <p> | 주문번호</p>
                                            <p>0987654567</p>
                                        </div>
                                        <div class="rd-board2">
                                            <div class="rd1">
                                                <div class="rd11"><p style="font-size: 20px;text-align: left;">일반상품(1)</p></div>
                                                <div class="rd12"><img src="스토어-4.jpg"width="280"height="250" ></div>
                                            </div>
                                            <div class="rd2">
                                                <p style="font-size:20px;">맛난커피200g</p>
                                                <p style="font-size:20px;">1개</p> 
                                            </div>
                                            <div class="rd3"><p style="font-size:20px;">18000원</p></div>
                                            <div class="rd4"><p style="font-size:20px;">결제완료</p></div>
                                            <div class="rd5"> 
                                                <div class="rd51" ><p style="font-size:20px;">배송비25000원</p></div>
                                                <div class="rd52" >
                                                    <p style="font-size:17px;">결제수단 신용카드</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="rd-board3">
                                            <div class="rd6">
                                                <p style="font-size:17px;float:left; margin-top:20px;">포인트사용</p>
                                                <P style="font-size:24px;float:right;margin-right:25px;margin-top:15px;">-500p</P>
                                            </div>
                                            <div class="rd7">
                                                <p style="font-size: 20px;float: left;">결제금액</p>
                                                <p style="font-size: 20px;float:right;margin-right: 25px;">20,000원</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             </div>
                             <!-- 최근 구매 내역-->
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