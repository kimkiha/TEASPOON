<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.teaspoon.member.model.vo.*"%>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	int totalPrice = 0;
	int totalPoint = 0;
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
<script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        <form action="<%=contextPath %>/storePayment.st" method="POST">
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
                                            <td>
                                                <img src="<%=contextPath %>/resources/thumbnail_upfiles/<%=list.get(i).getChangeName()%>" width="100" height="100">
                                            </td>
                                            <td style="text-align:left; padding-left:20px;font-weight: 700;">
                                            	<%=list.get(i).getPname() %>
                                            	<p style="font-weight:100; font-size:16px;padding:0px;"><%=list.get(i).getOptionType1() %>, <%=list.get(i).getOptionType2() %></p>
                                            </td>
                                            <td><%=list.get(i).getAmount() %>개</td>
                                            <td><%=(list.get(i).getPrice()+list.get(i).getAddPrice())*list.get(i).getAmount()%>원</td>
                                            <td><%=(int)((list.get(i).getPrice()+list.get(i).getAddPrice())*list.get(i).getAmount()*0.01) %>p</td>
                                        </tr>
                                        <% totalPrice += (list.get(i).getPrice()+list.get(i).getAddPrice())*list.get(i).getAmount(); %>
                                        <% totalPoint += (int)((list.get(i).getPrice()+list.get(i).getAddPrice())*list.get(i).getAmount()*0.01); %>
                                    <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <div id="mp_con2">
                                <p>포인트 사용</p>
                                <table class="tb2"  cellspacing="0" cellpadding="0" style="margin-top:10px">
                                   <tr>
                                       <td class="left_text_st" style="border-top:1px solid #bebebe;">보유포인트</td>
                                       <td style="border-top:1px solid #bebebe;"><input type="number" id='pointUse1' class="point" name="point" width="400" style="padding-left: 15px; border:0px;" value="<%=loginUser.getPoint() %>" readonly></td>
                                       <td style="border-top:1px solid #bebebe;"></td>
                                   </tr>
                                   <tr>
                                       <td class="left_text_st">사용할포인트</td>
                                       <td> <input type="number" id='pointUse' class="point" name="point" placeholder="사용할 포인트를 입력하세요." width="400" style="padding-inline-start: 15px;"></td>
                                       <td><button type="button" id="pointUseBtn" style="width:180px; height:50px; background: #fff; border:1px solid #bebebe">포인트사용</button></td>
                                   </tr>
                                </table>
                            </div>
                            <!-- //mp_con2-->
                            <div id="mp_con3">
                                <p style="float:left; margin-bottom:0">주문고객정보</p>
                                <p style="text-align:right;font-size: 13px;">고객님의 회원정보가 기본 입력됩니다.</p>
                                <table class="tb3" cellspacing="0" cellpadding="0" >
                                        <tr>
                                            <td class="left_text_st top_bd ">이름</td>
                                            <td class="top_bd "colspan="3">
                                                <input type="text" name="userName" value="<%=loginUser.getUserName()%>" style="padding-left:20px;" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="left_text_st" width="170">휴대전화</td>
                                            <td><input type="text" name="phone" value="<%=loginUser.getPhone() %>" style="padding-left:20px;" readonly></td>
                                        </tr>
                                </table>
                            </div>
                            <!-- //mp_con3-->
                            <div id="mp_con3" style="margin-bottom:400px">
                                <p style="float:left; margin-bottom:0">배송 정보 입력</p>
                                <table class="tb3"  cellspacing="0" cellpadding="0" >
                                        <!-- <tr>
                                            <td class="left_text_st top_bd " >배송지 선택</td>
                                            <td class="top_bd "colspan="2" >
                                                <select style="width:200px; padding-left:15px">
                                                    <option>우리집</option>
                                                </select>
                                            </td>
                                        </tr> -->
                                        <tr>
                                            <td class="left_text_st top_bd " width="170" rowspan="2">받으시는분</td>
                                            <td style="padding-right:0px; width: 220px; border-bottom: none;" class="left_text_st top_bd " >
                                                <input type="text" placeholder="이름" style="padding-left:20px;width:200px;" name="recipient" required>
                                            </td>
                                            <td class="left_text_st top_bd "style="text-align: left; border-bottom: none;">
                                            	<input type="text" name="recipientPhone" placeholder="휴대전화번호"  style="padding-left:20px; width:320px;" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="left_text_st" colspan="2" style="width:200px; padding-top:0">
                                                
                                                <!--  <input type="text" placeholder="배송받을 주소입력" name="recipientAddress" style="width: 520px; border-radius:5px; padding-left:20px;"required>-->
												<input type="text" id="del_postcode" placeholder="우편번호">
												<input type="button" onclick="del_execDaumPostcode()" value="우편번호 찾기"><br>
												<input type="text" id="del_detailAddress" placeholder="상세주소">
												<input type="text" id="del_address" placeholder="주소">
												<input type="text" id="del_extraAddress" placeholder="참고항목">
												
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="left_text_st">배송 요청 사항</td>
                                            <td colspan="2"><input type="text" name="orderMessage" placeholder="요청사항" style="width:520px; padding-left:20px;"></td>
                                        </tr>
                                </table>
                            </div>
                            <!-- //mp_con4-->
                        </div>
                       <!-- //orderlist -->
                       <div id="payment" class="adside">
                       
                            <table class="pay_tb" >
                                <thead>
                                    <tr>
                                        <th colspan="2">최종 결제 금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="pay_lt">상품가격</td>
                                        <td class="pay_rt"><%=totalPrice %>원</td>
                                    </tr>
                                    <tr>
                                        <td class="bd_none pay_lt">포인트 할인</td>
                                        <td class="bd_none pay_rt" id='useP'>-0원</td>
                                    </tr>
                                    
                                    <tr>
                                        <td class=" pay_lt">배송비</td>
                                        <td class=" pay_rt">2,500원</td>
                                        <input type="hidden" name="shippingFee" value="2500">
                                    </tr>
                                    <tr class="">
                                        <td colspan="2" class="bd_none pay_lt">적립예상포인트</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class=" pay_rt"><%=totalPoint %>p</td>
                                    </tr>
                                    <tr class="">
                                        <td colspan="2" class="pay_lt bd_none">총 결제 금액</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"  id='totalPay' class=" pay_rt"><%=totalPrice+2500 %>원</td>
                                        <input type="hidden" name="total" value="<%=totalPrice+2500 %>">
                                    </tr>
                                </tbody> 
                                <tfoot>
                                    <tr>
                                        <td colspan="2" class="pay_lt" style="padding-top: 20px;text-align: left;">
                                        위 상품의 판매조건을 명확히 확인하였으며,구매 진행에 동의합니다.(전자상거래법 제 8조 2항)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="pay_lt " style="padding: 20px 0; text-align: left;">
                                            <input type="checkbox" class="yes">동의합니다
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><button class="pay_button" onclick="return paym();">결제하기</button></td>
                                    </tr>
                                </tfoot>   
                            </table>
                    </div>
                    <!-- //payment-->
                </div>
                </div>
            <!-- //contaniner-->
        </div>
   <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </form>
    </div>
    <!--//wrap-->
    
    <script>
	function paym(){
		
	var yes = $("input[class='yes']:checked").val();	
	
	if(yes==undefined){
		alert("전자결제 동의해주세요.");
		return false;
	}else{
		return true;
	}
	
	}
	
	$(function(){
		$("#pointUseBtn").click(function(){
			var userSaving = $("#pointUse1").val();
			var pointUse= $("#pointUse").val();
			
			
			if(Number(userSaving)<Number(pointUse)){
				alert("보유포인트를 초과하셨습니다.");
				
			}else if(Number(pointUse)<0){
				alert("양수를 입력하세요.");			
			}else{

				$("#useP").text('-'+pointUse+'원');
				
				//var tPay= $("#totalPay").text();
				//var aa = tPay.substring(0,tPay.length-1);
				//$("#totalPay").text(aa-pointUse+"원");
				$('#totalPay').text((<%=totalPrice+2500%>-pointUse)+"원");

				
			}
		
			
		})
	})
	</script>
	<script>
    function del_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("del_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("del_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('del_postcode').value = data.zonecode;
                document.getElementById("del_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("del_detailAddress").focus();
            }
        }).open();
    }
</script>
 
</body>
</html>