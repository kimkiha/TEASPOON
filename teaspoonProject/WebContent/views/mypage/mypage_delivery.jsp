<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_delivery.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
        #banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
      
    </style>
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <div id="banner">
            <div class="contaniner title">마이페이지</div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- product -->
                <div class="contaniner">
                    <div id="mypage">
                        <div id="mypage_info">
                            <div class="user_info" style="width:95px; border-left:1px solid #bebbb6">
                                <div class="user_photo" style="margin-top:30px; padding-left:10px; float: left;">
                                    <img src="<%=contextPath%>/resources/img/admin/user.png">
                                </div>
                            </div>
                            <div class="user_info" style="width:450px;">
                                <table class="detail_tb" cellpadding="0" cellspacing="0"  >
                                    <tr class="d1">
                                        <td width="60" name="username">홍길동</td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" >골드등급</td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2"
							style="border-left: 1px solid #bebbb6; height: inherit;">
								<p class="info_th">적립포인트</p>
								<a href="<%=contextPath%>/mypoint.me?currentPage=1"><%= loginUser.getPoint() %>Point</a>
							</div>
							<div class="detail_info2">
								<p class="info_th">할인쿠폰</p>
								<a href="#"><%= loginUser.getCouponCount() %>장</a>
							</div>
							<div class="detail_info2">
								<p class="info_th">위시리스트</p>
								<a href="<%=contextPath %>/wishList.me"><%=loginUser.getWishCount() %>개</a>
						</div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="<%=contextPath %>//mydelivery.me" class=" float"> 주문배송조회</a>
							<a href="#" class=" float">공간대여확인</a>
							<a href="<%=contextPath %>/myAdress.me" class=" float">나의배송지</a>
							<a href="<%=contextPath %>/myqna.me?currentPage=1" class="float">1:1문의</a>
							<a href="<%=contextPath %>/mycart.me" class="float">장바구니</a>
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
                            <!-- 날짜 조회 -->
                            <div class="inquiry-box">
                                <form action=""class="inquiry">
                                    <div class="inquiry-pad">
                                      
                                        <div class="btn-group">
                                            <button type="button" class="set-period btn" data-set-date="-1m" data-track-name="1개월/검색기간">1개월</button>
                                            <button type="button" class="set-period btn" data-set-date="-1m" data-track-name="3개월/검색기간">3개월</button>
                                            <button type="button" class="set-period btn" data-set-date="-1m" data-track-name="6개월/검색기간">6개월</button>

                                        </div>
                                        <label for="date-from" >기간입력</label>
                                        <div class="input-group">
                                            <div class="input-wrap">
                                                <input type="date" name="startDate" id="date-from"class="input-date date-from x-datepicker hasDatepicker" value="2019.04.14">
                                                <input type="hidden" id="starDate" value="2019.04.14">
                                            </div>
                                            <i>~</i>
                                            <div class="input-wrap">
                                                <input type="date" name="endDate" id="date-to"class="input-date date-to x-datepicker hasDatepicker" value="2019.10.14">
                                                <input type="hidden" id="endDate" value="2019.10.14">
                                            </div>

                                        </div>
                                        <button type="submit"class="btn-gim" id="btn-mypage">조회</button>
                                    </div>

                                </form>

                            </div>
                            <br><br>

                            <!-- 주문 내역-->
                            <div class="order-list"><p>주문내역</p></div>
                            <table id="mypage_table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th width="130">주문일시</th>
                                        <th>주문번호</th>
                                        <th colspan="2">상품명</th>
                                        <th>상태</th>
                                        <th>주문</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2020.04.01</td>
                                        <td>2060702173</td>
                                        <td  style="text-align:left;"><img src="사이트이미지/메인/1.jpg" width="90px" height="90px"></td>
                                        <td  style="text-align:left;">녹차 스프레드</td>
                                        <td>상품준비중</td>
                                        <td>18,000원</td>
                                        <td><a><button class="btn_review">리뷰쓰기</button></a></td>
                                    </tr>
                                    <tr>
                                        <td>2020.04.01</td>
                                        <td>2060702173</td>
                                        <td  style="text-align:left;"><img src="사이트이미지/메인/1.jpg" width="90px" height="90px"></td>
                                        <td  style="text-align:left;">녹차 스프레드</td>
                                        <td>상품준비중</td>
                                        <td>18,000원</td>
                                        <td>
                                        <a><button class="btn_review">구매확정</button></a>
                                        <a><button class="btn_review">리뷰쓰기</button></a>
                                        </td>
                                        
                                    </tr>
                                </tbody>
                            </table>

                            <div class="pagingarea">
                                <div class="pagingvar" align="center">
                                    <button><<</button>
                                    <button><</button>
                                    <button>1</button>
                                    <button>></button>
                                    <button>>></button>
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