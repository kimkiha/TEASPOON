<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.member.model.vo.*,com.teaspoon.common.* "%>
<%
ArrayList<Orders> list = (ArrayList<Orders>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();

%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의주문내역 | TeaSpoon</title>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_delivery.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
        #banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
      
#paging button {
	border: 0px;
	background: white;
	color: #4e4f53;
	font-weight: bold;
	margin: 10px;
}

#paging button:hover {
	cursor: pointer;
	color: #d6ae71;
}
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
						<div class="user_info"
							style="width: 95px; border-left: 1px solid #bebbb6">
							<div class="user_photo"
								style="margin-top: 30px; padding-left: 10px; float: left;">
								<img src="<%=contextPath%>/resources/img/admin/user.png">
							</div>
						</div>
						<div class="user_info" style="width: 450px;">
							<table class="detail_tb" cellpadding="0" cellspacing="0">
								<tr class="d1">
									<td width="60" name="username"><%=loginUser.getUserName() %></td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade"><%=loginUser.getGradeName() %></td>
								</tr>
								<tr class="d2">
									<td colspan="2"><a
										href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a></td>
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
						<a href="<%=contextPath %>/mydelivery.me?currentPage=1" class="active float"> 주문내역확인</a>
						<a href="<%=contextPath %>/myReserv.me?currentPage=1" class=" float">공간대여확인</a>
						<a href="<%=contextPath %>/myAdress.me" class=" float">나의배송지</a>
						<a href="<%=contextPath %>/myqna.me?currentPage=1" class="float">1:1문의</a>
						<a href="<%=contextPath %>/mycart.me" class="float">장바구니</a>
					</div> 
					<div class="pagename"></div>

					<div id="mp_con1">

						<!-- 배송 아이콘 확인칸 -->
						<div class="mypage-outer">
								<div align="center" class="order"
									style="width: 100%; height: 60px;">주문현황</div>
								<div class="order-outer">
									<div class="order-state">
										<p>나의주문내역</p>
										<span>나의 주문내역을<br>확인해보세요
										</span>
									</div>
									<div class="myorder">
										<div class="l">
											<img src="<%=contextPath%>/resources/img/mypage/주문관리.png" width="80"
												height="80"><br>
											<br>주문접수
											<P>0</P>
										</div>
										<div class="t">
											<span>></span>
										</div>
										<div class="l">
											<img src="<%=contextPath%>/resources/img/mypage/카드.png" width="80"
												height="80"><br>
											<br>결제완료
											<P>0</P>
										</div>
										<div class="t">
											<span>></span>
										</div>
										<div class="l">
											<img src="<%=contextPath%>/resources/img/mypage/상품준비.png" width="80"
												height="80"><br>
											<br>상품준비
											<P>0</P>
										</div>
										<div class="t">
											<span>></span>
										</div>
										<div class="l">
											<img src="<%=contextPath%>/resources/img/mypage/배송중.png" width="80"
												height="80"><br>
											<br>배송중
											<P>0</P>
										</div>
										<div class="t">
											<span>></span>
										</div>
										<div class="l">
											<img src="<%=contextPath%>/resources/img/mypage/배송완료.png" width="80"
												height="80"><br>
											<br>배송완료
											<P>0</P>
										</div>
									</div>
								</div>
							</div>
						<!-- 배송 아이콘 끝 -->
						<!-- 날짜 조회 -->
					
						<br>
						<br>

						<!-- 주문 내역-->
						<div class="order-list">
							<p style="float:left">주문내역</p>
						</div>
						<table id="mypage_table" cellspacing="0">
							<thead>
								<tr>
									<th width="130">주문일시</th>
									<th>주문번호</th>
									<th colspan="2">주문상품</th>
									<th>상태</th>
									<th>구매금액</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%if(list.isEmpty()){ %>
							<tr>
								<td colspan="8">주문내역이 없습니다.</td>
							</tr>
							<%}else{ %>
								<% for(Orders or : list){ %>
								<tr>
									<td><%=or.getOrderDate() %></td>
									<td><%=or.getOrderNo() %></td>
									<td style="text-align: left;">
										</td>
									<td style="text-align: left;"><%=or.getProductInfo() %></td>
									<td class="deny">배송완료</td>
									<td><%=or.getPayment() %>원</td>
									<td> </td>
									<td>
										<button class="confirm">구매확정</button>
										
									</td>
								</tr>
								<%} %>
							
							<%} %>
								
							</tbody>
						</table>
						<%if(list.isEmpty()){ %>

						<%}else{ %>
						<div class="pagingarea">
							<div id="paging" class="pagingbar">
								<%if(currentPage != 1){%>
								<!-- 현재 페이지가 1페이지가 아닐경우 -->
								<!-- 맨 처음으로(<<) -->
								<button onclick="location.href='mydelivery.me?currentPage=1'">&lt;&lt;</button>
								<!-- 이전페이지로(<) -->
								<button
									onclick="location.href='mydelivery.me?currentPage=<%=currentPage-1%>'">&lt;</button>
								<%} %>

								<%for(int p=startPage; p<=endPage; p++){%>
								<%if(currentPage != p) {%>
								<button onclick="location.href='mydelivery.me?currentPage=<%=p%>'"><%=p%></button>
								<%}else{ %>
								<button dispabled><%=p %></button>
								<%} %>
								<%} %>

								<%if(currentPage != maxPage){ %>
								<!-- 다음페이지로(<) -->
								<button
									onclick="location.href='mydelivery.me?currentPage=<%=currentPage+1%>'">&gt;</button>
								<!-- 맨 마지막으로(>>) -->
								<button
									onclick="location.href='mydelivery.me?currentPage=<%=maxPage %>'">&gt;&gt;</button>
								<%} %>
							</div>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<!-- //content-->
       <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
<script>
$(function(){
		$(".confirm").click(function(){
			var OrderNo = $(this).parent().parent().children().eq(1).text();
			var deny = $(this).parent().parent().children().eq(4);
			$.ajax({
				url:"MyOrderConfirm.me",
				type:"post",
				data:{OrderNo:OrderNo},
				success:function(list){
					console.log(list);
					deny.text('구매완료');
					
				
				},
				error:function(){
					console.log("ajax 통신 실패!!");
				}
				
			});
		});
	});
	
	
</script>
</body>
</html>