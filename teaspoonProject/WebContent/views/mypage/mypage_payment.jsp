<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.teaspoon.member.model.vo.*"%>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	//System.out.print(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_payment.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
    #banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
	.adsideWrapper { 
	  position: absolute;
	}
	.adside {
	  position: absolute;
	  top: 250px; left:1080px
	}
	.adside.fixed {
	  position: fixed;
	  top: 50px;
	}
    </style>
            
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script>
	$(document).ready(function () {  
        var top = $('.adside').offset().top - parseFloat($('.adside').css('marginTop').replace(/auto/, 0));
        $(window).scroll(function (event) {
        var y = $(this).scrollTop();
  
       if (y >= top) {
          $('.adside').addClass('fixed');
       } else {
          $('.adside').removeClass('fixed');
      }
  });
});
</script>
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <div id="banner">
            <div class="contaniner title">주문/결제</div>
        </div>
        <!-- //banner -->
          <div id="content" style="width:1200px; height:100%" >
            <!-- mypage -->
                <div class="contaniner_1 " style="height:100%">
                <div style="height:100%; width:100%;">
                        <div id="order_list" >
                            <div id="mp_con1">
                                <p>주문 상품 확인</p>
                                <table class="mypage_table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="150"></th>
                                            <th width="300" >상품정보</th>
                                            <th width="50">수량</th>
                                            <th>상품가격</th>
                                            <th>적립혜택</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(int i=0; i<list.size(); i++) {%>
                                        <tr>
                                            <td >
                                                <img src="/사이트이미지/매거진/magazine_1.png" alt="" width="100" height="100">
                                            </td>
                                            <td style="text-align:left; padding-left:20px;font-weight: 700;"><%=list.get(i).getPname() %></td>
                                            <td><%=list.get(i).getAmount() %>개</td>
                                            <td><%=list.get(i).getPrice() %>원</td>
                                            <td><%=list.get(i).getPrice() *0.01 %>p</td>
                                        </tr>
                                    <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <div id="mp_con2">
                                <p>쿠폰 및 포인트 사용</p>
                                <table class="tb2"  cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td class="top_bd left_text_st" width="150" >쿠폰할인</td>
                                            <td class="top_bd" width="450">
                                                <select class="coupon">
                                                        <option>티스푼 회원가입 웰컴 쿠폰 5,000원</option>
                                                        <option>bronze 회원 정기 쿠폰 3,000원</option>
                                                        <option>30,000원 구매 시 10% 할인 쿠폰</option>
                                                </select>
                                            </td>
                                            <td width="200" class="top_bd">0원 할인</td>
                                        </tr>
                                        <tr>
                                            <td class="left_text_st">티스푼포인트</td>
                                            <td> <input type="number" class="point" name="point"width="400" style="padding-inline-start: 15px;"></td>
                                            <td><button style="width:180px; height:50px; background: #fff; border:1px solid #bebebe">포인트사용</button></td>
                                        </tr>
                                </table>
                            </div>
                            <!-- //mp_con2-->
                            <div id="mp_con3">
                                <p style="float:left; margin-bottom:0">주문고객정보</p>
                                <p style="text-align:right;font-size: 13px;">고객님의 회원정보가 기본 입력됩니다.</p>
                                <table class="tb3"  cellspacing="0" cellpadding="0" >
                                        <tr>
                                            <td class="left_text_st top_bd ">이름</td>
                                            <td class="top_bd "colspan="3" >
                                                <input type="text" name="userName" value="<%=loginUser.getUserName()%>" style="padding-left:20px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="left_text_st" width="170">휴대전화</td>
                                            <td><input type="text" value="<%=loginUser.getPhone() %>" style="padding-left:20px;"></td>
                                        </tr>
                                        <tr >
                                            <td class="left_text_st" >이메일</td>
                                            <td colspan="3" ><input type="email" value="<%=loginUser.getEmail()%>" style="padding-left:20px;"></td>
                                        </tr>
                                </table>
                            </div>
                            <!-- //mp_con3-->
                            <div id="mp_con3" style="margin-bottom:400px">
                                <p style="float:left; margin-bottom:0">배송 정보 입력</p>
                                <table class="tb3"  cellspacing="0" cellpadding="0" >
                                        <tr>
                                            <td class="left_text_st top_bd " >배송지 선택</td>
                                            <td class="top_bd "colspan="2" >
                                                <select style="width:200px; padding-left:15px">
                                                    <option>우리집</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="left_text_st" width="170" rowspan="2">받으시는분</td>
                                            <td style="padding-right:0px; width: 220px; border-bottom: none;" >
                                                <input type="text" placeholder="이름" style="padding-left:20px;">
                                            </td>
                                            <td style="text-align: left; border-bottom: none;"><input type="text" placeholder="휴대전화번호 필수"  style="padding-left:20px;"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="width:200px; padding-top:0">
                                                <button style="background: rgb(158, 158, 158); color:#fff; width:130px;height:53px; padding-left:10px; border:1px solid darkgray">
                                                	주소찾기
                                                </button>
                                                <input type="text" placeholder="주소" style="width: 350px; border-radius:5px; padding-left:20px;">
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="left_text_st">배송 요청 사항</td>
                                            <td colspan="2"><input type="text" placeholder="요청사항" style="width:520px; padding-left:20px;"></td>
                                        </tr>
                                </table>
                            </div>
                            <!-- //mp_con4-->
                        </div>
                       <!-- //orderlist -->
                       <div id="payment" class="adside">
                        <form action="" method="POST">
                            <table class="pay_tb" >
                                <thead>
                                    <tr>
                                        <th colspan="2">최종 결제 금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="pay_lt">상품가격</td>
                                        <td class="pay_rt">56,000원</td>
                                    </tr>
                                    <tr>
                                        <td class="bd_none pay_lt">포인트 할인</td>
                                        <td class="bd_none pay_rt">0원</td>
                                    </tr>
                                    <tr>
                                        <td class="bd_none pay_lt">쿠폰 할인</td>
                                        <td class="bd_none pay_rt">-5,000원</td>
                                    </tr>
                                    <tr>
                                        <td class=" pay_lt">배송비</td>
                                        <td class=" pay_rt">2,500원</td>
                                    </tr>
                                    <tr class="">
                                        <td colspan="2" class="bd_none pay_lt">적립예상포인트</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class=" pay_rt">1,680p</td>
                                    </tr>
                                    <tr class="">
                                        <td colspan="2" class="pay_lt bd_none">총 결제 금액</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"  class=" pay_rt">53,500원</td>
                                    </tr>
                                </tbody> 
                                <tfoot>
                                    <tr>
                                        <td colspan="2" class="pay_lt" style="padding-top: 20px;text-align: left;">
                                            위 상품의 판매조건을 명확히 확인하였으며,
                                            구매 진행에 동의합니다.
                                            (전자상거래법 제 8조 2항)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="pay_lt " style="padding: 20px 0; text-align: left;">
                                            <input type="checkbox">동의합니다
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><button class="pay_button">결제하기</button></td>
                                    </tr>
                                </tfoot>   
                            </table>
                        </form>
                    </div>
                    <!-- //payment-->
                </div>
                </div>
            <!-- //contaniner-->
        </div>
   <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!--//wrap-->
    
 
</body>
</html>