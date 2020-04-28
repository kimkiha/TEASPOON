<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.member.model.vo.*, com.teaspoon.store.model.vo.*, com.teaspoon.board.model.vo.*"%>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
    //int onePrice = (list.get(0).getPrice()+list.get(0).getAddPrice());
	//int totalPrice = (list.get(0).getPrice()+list.get(0).getAddPrice())*list.get(0).getAmount();
	//System.out.print(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_cart.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
        #banner {height: 170px; line-height: 170px; background:url("패턴 - 복사본.jpg") center top repeat-x;}
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
                                    <img src="<%=contextPath%>/resources/img/main/mypage.png">
                                </div>
                            </div>
                            <div class="user_info" style="width:450px;">
                                <table class="detail_tb" cellpadding="0" cellspacing="0"  >
                                    <tr class="d1">
                                        <td width="60" name="username"><%=loginUser.getUserName() %></td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" >silver</td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" ><%=loginUser.getPointPrice() %>점</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" ><%=loginUser.getCount() %>장</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" ><%=list.size() %>개</a>
                            </div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="#" class="float">주문배송조회</a>
                            <a href="#" class="float">공간대여확인</a>
                            <a href="#" class="float">나의배송지</a>
                            <a href="#" class="float">1:1문의</a>
                            <a href="#" class="active float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>
                        <div id="mp_con1">
                            <p>장바구니</p>
                            <table id="mypage_table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();">전체선택</th>
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
                                        	<img width="130px" height="130px" src="">
                                        </td>
                                        <td style="text-align:left;" class="t-title">
                                        	<p class="pDetail" style="cursor:pointer"><%=list.get(i).getPname() %></p>
                                        	<input type="hidden" class="pcode" name="pcode" value=<%=list.get(i).getPcode() %>>
                                        	<input type="hidden" name="kind" value=<%=list.get(i).getKind() %>>
                                        	<p style="font-weight:100; font-size:16px;"><%=list.get(i).getOptionType1() %>, <%=list.get(i).getOptionType2() %></p>
                                        </td>
                                        <td>
                                        	<div class="number">
                                            <a href="#" id="decreaseQuantity">
                                                <img src="<%=contextPath %>/resources/img/store/minus.png" width="20px" height="20px">
                                            </a>
                                            <b><span id="numberUpDown" style="padding-left: 20px; padding-right: 20px;"><%=list.get(i).getAmount()%></span></b>
                                            <a href="#" id="increaseQuantity">
                                                <img src="<%=contextPath %>/resources/img/store/plus.png" width="20px" height="20px">
                                            </a>
                                        </div>
                                        </td>
                                        <td id='totalProductPrice'><%=(list.get(i).getPrice()+list.get(i).getAddPrice())*list.get(i).getAmount()%></td>
                                        <td>2,500원</td>
                                        <td><input type="hidden" id='onePrice' value='<%=list.get(i).getPrice()+list.get(i).getAddPrice()%>'></td>
                                    </tr>
                                    <%} %>
                                 <%} %>
                                 
                                </tbody>
                                
                            </table>
                            <div class="t-func">
                                <div class="t-func1"><button>선택삭제</button></div>
                                <div class="t-func2"><button>선택상품 위시리스트 담기</button></div>
                                <div class="t-func3"><span>장바구니에 보관된 상품은 15일뒤에 삭제됩니다</span></div>
                            </div>
                            <div class="bill-box">
                                <div class="billbox">
                                    <span>상품가격</span>
                                    <b>~~~~~~~~~~~~~~~~~~</b>
                                    <b>+</b>
                                    <span>배송비</span>
                                    <b>2,500원</b>
                                    <b>=</b>
                                    <b>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~원</b>
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

		$('#decreaseQuantity').click(function(e) {
			e.preventDefault();
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num--;
			if (num <= 0) {
				alert('더이상 줄일수 없습니다.');
				num = 1;
			}
			$('#numberUpDown').text(num);
			totalSum();
		});

		$('#increaseQuantity').click(function(e) {
			e.preventDefault();
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num++;

			if (num > 5) {
				alert('더이상 늘릴수 없습니다.');
				num = 5;
			}
			$('#numberUpDown').text(num);
			totalSum();

		});

		// 상품금액 합계
		$('.amount').click(function() {
			totalSum();
		});

		// 상품금액 합계 출력
		function totalSum() {
			var onePrice = $("#onePrice").val();
			amount = $("#numberUpDown").val();
			num1 = $('#numberUpDown').text();
			
			var totalPrice = onePrice * num1;
			$("#totalProductPrice").text(totalPrice);

		}
	});
	
    </script>
</body>
</html>