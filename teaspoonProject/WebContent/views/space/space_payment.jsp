<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.space.model.vo.*"%>
 
 <%
	
	Space s = (Space)(request.getAttribute("s"));
 	ArrayList<Goods> list = (ArrayList<Goods>)request.getAttribute("list");
 	String[] goods = s.getGood().split(",");
 	int gTotalPrice =0;
 	int gToralSaving=0;
 	
 

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/space/space_payment.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
        #banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
    
	.adsideWrapper { 
	  position: relative;
	}
	.adside {
	  position: absolute;
	  top: 250px; left:1000px
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

          <div id="content"style="width:1200px; height:100%" >
            <!-- mypage -->
                <div class="contaniner_1" style="height:100%">
                <div style="height:100%; width:100%;" >
                        <div id="order_list">
                            <div id="mp_con1">
                                <p>주문 상품 확인</p>
                                <table class="mypage_table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="150"></th>
                                            <th width="300" >대관정보</th>
                                            <th width="50">수량</th>
                                            <th>가격</th>
                                            <th>적립혜택</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td >
                                                <img src="/사이트이미지/매거진/magazine_1.png" alt="" width="100" height="100">
                                            </td>
                                            <td style="text-align:left; padding-left:20px;font-weight: 700;">아카이야(11:00~13:00)</td>
                                            <td>1개</td>
                                            <td>200,000원</td>
                                            <td>960P</td>
                                        </tr>
                                        <%for(int i=0; i<goods.length; i++){ %>
                                        <tr>
                                            <td colspan="2" >(+)<%=goods[i] %></td>
                                            <td>1개</td>
                                            <td><%for(int j=0;j<list.size();j++){%> 
                                            	<%if(goods[i].equals(list.get(j).getGsName())){%>
                                            		 	<%=list.get(j).getGsPrice()%>원</td>
                                            		 	<td><%=list.get(j).getGsSaving()%>P</td>
                                            		 	<%gTotalPrice+=list.get(j).getGsPrice(); %>
                                            		 	<%gToralSaving+=list.get(j).getGsSaving(); %>
                                            			<%} %>
                                            		<%} %>
                                        </tr>
                                        
                                        <%} %>
                                       
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                            
                            <div id="mp_con2">
                                <p>포인트 사용</p>
                                
                                <table class="tb2"  cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td class="left_text_st top_bd">고객총포인트</td>
                                            <td class="top_bd"> <div type="text" id='pointUse1' class="point" name="point"width="400" style="padding-inline-start: 15px;"><%=loginUser.getPoint() %></div></td>
                                            
                                        </tr>
                                </table>
                                
                                <table class="tb2"  cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td class="left_text_st top_bd">티스푼포인트</td>
                                            <td class="top_bd"> <input type="number" id='pointUse' class="point" name="point"  placeholder="포인트 사용값을 입력하세요." width="400" style="padding-inline-start: px;"></td>
                                            <td class="top_bd"><button id="pointUseBtn"  style="width:180px; height:50px; background: #fff; border:1px solid #bebebe">포인트사용</button></td>
                                        </tr>
                                </table>
                            </div>
                            <!-- //mp_con2-->
                            <div id="mp_con3" style="margin-bottom:400px">
                                <p style="float:left; margin-bottom:0">공간대여 고객정보</p>
                                <p style="text-align:right;font-size: 13px;">고객님의 회원정보가 기본 입력됩니다.</p>
                                <table class="tb3"  cellspacing="0" cellpadding="0" >
                                        <tr>
                                            <td class="left_text_st top_bd " >이름</td>
                                            <td class="top_bd "colspan="3" >
                                                <input type="text" name="userName" value="<%=loginUser.getPoint()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="left_text_st" width="170">휴대전화</td>
                                            <td width="220" colspan="2"><input type="text" value="<%=loginUser.getPhone()%>"></td>
                                        </tr>
                                        <tr >
                                            <td class="left_text_st" >이메일</td>
                                            <td colspan="3" ><input type="email" value="<%=loginUser.getEmail()%>"></td>
                                        </tr>
                                </table>
                            </div>
                            <!-- //mp_con3-->
                        </div>
                       <!-- //orderlist -->
                       <div id="payment" class="adside" style="float:left">
                        <form action="<%= contextPath %>/insert.py" method="POST">
                            <table class="pay_tb" >
                                <thead>
                                    <tr>
                                        <th colspan="2">최종 결제 금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="pay_lt bd_none">대여비용</td>
                                        <td class="pay_rt bd_none">200000원</td>
                                    </tr>
                                    
                                    <tr>
                                        <td class=" pay_lt bd_none">비품비용</td>
                                        <td class=" pay_rt bd_none" name="goodsPay" ><%=gTotalPrice %>원</td>
                                    </tr>
                                    <tr>
                                        <td class=" pay_lt">포인트 할인</td>
                                        <td class=" pay_rt" id='useP'>-0원</td>
                                    </tr>
                                    <tr class="">
                                        <td colspan="2" class="bd_none pay_lt">적립예상포인트</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class=" pay_rt"><%=gToralSaving+960 %>P</td>
                                    </tr>
                                    <tr class="">
                                        <td colspan="2" class="pay_lt bd_none">총 결제 금액</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"  class=" pay_rt" id='totalPay' name="total"><%=gTotalPrice+200000%></td>
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
                                            <input type="checkbox" class="yes">동의합니다
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><button class="pay_button" onclick="return paym();">결제하기</button></td>
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
        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>

</body>
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
			var userSaving = $("#pointUse1").text();
			var pointUse= $("#pointUse").val();
			
			
			if(userSaving<pointUse){
				alert("보유포인트를 초과하셨습니다.");
				
			}else if(pointUse<0){
				alert("양수를 입력하세요.");			
			}else{

				$("#useP").text('-'+pointUse+'원');
				
				$('#totalPay').text(200000+<%=gTotalPrice%>-pointUse);
			}
		
			
		})
	})
</script>
</html>