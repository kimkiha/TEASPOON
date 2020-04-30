<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.member.model.vo.*, com.teaspoon.store.model.vo.*, com.teaspoon.board.model.vo.*"%>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	int totalPrice = 0;
	// list.get(0).getpDetailNo()
    //int onePrice = (list.get(0).getPrice()+list.get(0).getAddPrice());
	//int totalPrice = (list.get(0).getPrice()+list.get(0).getAddPrice())*list.get(0).getAmount();
	//System.out.print(list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 | TeaSpoon</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_cart.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
            <!-- mypage -->
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
                                        <td width="60" name="username"><%=loginUser.getUserName() %></td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" ><%=loginUser.getGradeName() %></td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
						<div class="detail_info2"
							style="border-left: 1px solid #bebbb6; height: inherit;">
							<p class="info_th">적립포인트</p>
							<a href="<%=contextPath%>/mypoint.me?currentPage=1"><%=loginUser.getPoint()%>Point</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">할인쿠폰</p>
							<a href="#"><%=loginUser.getCouponCount()%>장</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">위시리스트</p>
							<a href="<%=contextPath%>/wishList.me"><%=loginUser.getWishCount()%>개</a>
						</div>
					</div>
                        <div id="mypage_menu_tab">
                            <a href="<%=contextPath %>/mydelivery.me?currentPage=1" class=" float"> 주문내역확인</a>
							<a href="<%=contextPath %>/myReserv.me?currentPage=1" class=" float">공간대여확인</a>
							<a href="<%=contextPath %>/myAdress.me" class=" float">나의배송지</a>
							<a href="<%=contextPath %>/myqna.me?currentPage=1" class="float">1:1문의</a>
							<a href="<%=contextPath %>/mycart.me" class="float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>
                        <div id="mp_con1">
                            <p>장바구니</p>
                            <table id="mypage_table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"><label for="th_checkAll">전체선택</label></th>
                                        <th colspan="2">상품명</th>
                                        <th>수량</th>
                                        <th>판매가격</th>
                                        <th>배송비</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%if(list.isEmpty()){ %>
                                    <tr>
                                        <td colspan="7" height="150">장바구니에 선택된 상품이 없습니다</td>
                                    </tr>
                                <%}else{ %>
                                	<%for(int i=0; i<list.size(); i++) {%>
                                    <tr>
                                        <td><input type="checkbox" name="checkRow" value="${content.IDX}" ></td>
                                        <td style="text-align:left;">
                                        	<img width="130px" height="130px" src="<%=contextPath %>/resources/thumbnail_upfiles/<%=list.get(i).getChangeName()%>">
                                        </td>
                                        <td style="text-align:left;" class="t-title">
                                        	<p class="pDetail" style="cursor:pointer"><%=list.get(i).getPname() %></p>
                                        	<input type="hidden" class="pcode" name="pcode" value=<%=list.get(i).getPcode() %>>
                                        	<input type="hidden" name="kind" value=<%=list.get(i).getKind() %>>
                                        	<input type="hidden" name="pDetailNo" value=<%=list.get(i).getpDetailNo()%>>
                                        	<p style="font-weight:100; font-size:16px;"><%=list.get(i).getOptionType1() %>, <%=list.get(i).getOptionType2() %></p>
                                        </td>
                                        <td>
                                        	<input type="hidden" id='onePrice' value='<%=list.get(i).getPrice()+list.get(i).getAddPrice()%>'>
                                        	<div class="number">
	                                            <a href="#" class="decreaseQuantity">
	                                                <img src="<%=contextPath %>/resources/img/store/minus.png" width="20px" height="20px">
	                                            </a>
	                                            <b><span class="numberUpDown" style="padding-left: 20px; padding-right: 20px;"><%=list.get(i).getAmount()%></span></b>
	                                            <a href="#" class="increaseQuantity">
	                                                <img src="<%=contextPath %>/resources/img/store/plus.png" width="20px" height="20px">
	                                            </a>
                                        	</div>
                                        </td>
                                        <td class='totalProductPrice'><%=(list.get(i).getPrice()+list.get(i).getAddPrice())*list.get(i).getAmount() %></td>
                                        <td>2,500원</td>
                                    </tr>
                                    <% totalPrice += (list.get(i).getPrice()+list.get(i).getAddPrice())*list.get(i).getAmount(); %>
                                    
                                    <%} %>
                                 <%} %>
                                 
                                </tbody>
                                
                            </table>
                            <div class="t-func">
                                <div class="t-func1"><button>선택삭제</button></div>
                                <div class="t-func2"><button>선택상품 위시리스트 담기</button></div>
                                <div class="t-func3"><span>장바구니에 보관된 상품은 15일뒤에 삭제됩니다</span></div>
                            </div>
                            <div>
                                <div>
                                </div>
                            </div>
                            <div class="func">
                                <div class="func-group">
                                    <button type="submit" onclick="location.href='payment.me'" >선택상품 주문</button>
                                    <button type="submit" onclick="location.href='payment.me'" id="btn-func">전체상품 주문</button>
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
    
    
    
    <script>
    /* 전체 선택 */
    function checkAll(){
	    if( $("#th_checkAll").is(':checked') ){
	      $("input[name=checkRow]").prop("checked", true);
	    }else{
	      $("input[name=checkRow]").prop("checked", false);
	    }
    }
    </script>
    
    <script>
	
	// 상품상세로 이동
	$(function(){
   		$('.pDetail').click(function(){
   			var kind = $(this).siblings(['#kind']).val();
   			var pcode = $(this).siblings(['#pcode']).val();
   			if(kind=='C'){
   				location.href="<%=contextPath%>/detail.co?pcode="+pcode;
   			} else{
   				location.href="<%=contextPath%>/detail.it?pcode="+pcode;
   			}
   		});
   	});
	
	// 구매수량 변경 옵션
	$(function() {

		var amount;
		var num1;

		$('.decreaseQuantity').click(function(e) {
			e.preventDefault();
			
			var stat = $(this).siblings().eq(0).children().text();
			//console.log(stat);
			var num = parseInt(stat, 10);
			num--;
			if (num <= 0) {
				alert('더이상 줄일수 없습니다.');
				num = 1;
			}
			//$('.numberUpDown').text(num);
			$(this).siblings().eq(0).children().text(num);
			
			var onePrice = $(this).parent().prev().val();	// 한상품의 본래 가격에 옵션을 더한 가격(P_DETAIL)
			var pDetailNo = $(this).parent().parent().siblings().eq(2).children().eq(3).val();
			var amount = $(this).siblings().eq(0).children().text();	// 사용자가 정하는 상품갯수(1~5)
			var totalPrice = onePrice * amount;	// 총 가격
			
			var minusPrice = $(this).parent().parent().next().text(totalPrice);

			//console.log(pDetailNo);
			$.ajax({
				url:"ordersUpdate.st",
				data:{amount:amount, pDetailNo:pDetailNo},
				success:function(result){
					if(result>0){

					}
				}
				
			})
			
		});

		$('.increaseQuantity').click(function(e) {
			e.preventDefault();
			var stat = $(this).siblings().eq(1).children().text();
			//console.log(stat);
			var num = parseInt(stat, 10);
			num++;

			if (num > 5) {
				alert('더이상 늘릴수 없습니다.');
				num = 5;
			}
			//$('#numberUpDown').text(num);
			$(this).siblings().eq(1).children().text(num);
			
			var onePrice = $(this).parent().prev().val();	// 한상품의 본래 가격에 옵션을 더한 가격(수정불가)
			var pDetailNo = $(this).parent().parent().siblings().eq(2).children().eq(3).val();
			var amount = $(this).siblings().eq(1).children().text(); // 사용자가 정하는 상품갯수(1~5로 변경가능)
			var totalPrice = onePrice * amount;		// 총 가격
			
			var plusPrice = $(this).parent().parent().next().text(totalPrice);
			
			$.ajax({
				url:"ordersUpdate.st",
				data:{amount:amount, pDetailNo:pDetailNo},
				success:function(result){
					
				}, error:function(){
					console.log("너 실패다아아아")
				}
				
			})
		});
	});
	
    </script>
</body>
</html>