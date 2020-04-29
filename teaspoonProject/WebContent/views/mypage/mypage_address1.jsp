<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Address = (String)request.getAttribute("Address");
int count =0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의배송지 | TeaSpoon </title>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_address1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>
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
                                        <td colspan="2"><a href="<%=contextPath %>/memberModifyForm.me" >회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" ><%=loginUser.getPoint()%></a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" ><%=loginUser.getCouponCount()%></a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" ><%=loginUser.getWishCount() %></a>
                            </div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="#" class=" float"> 주문배송조회</a>
                            <a href="#" class=" float">공간대여확인</a>
                            <a href="#" class="active float" id="my_receive">나의배송지</a>
                            <a href="#" class="float">1:1문의</a>
                            <a href="#" class="float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>
                        <div id="mp_con1">
                           <div class="addresstitle">
                               <div class="adtitle1"><P>배송지추가</P></div>
                               <div></div>
                               <div class="adtitle2"><button onclick="add(this);"id="add">배송지변경</button></div>
                           </div>
                            </div>
                           
                            <table id="mypage_table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th id="address_name">배송지명</th>
                                        <th id="receive">받는분</th>
                                        <th colspan="2"id="place">주소</th>
                                        <th >휴대폰번호</th>
                                        <th >선택</th>
                                    </tr>
                                </thead>
                                <%if(count !=0) {%>
                                <tbody >
                                    <tr id="adAdd"class="add">
                                        <td><input type="text" name="address-info" id="address-info"></td><!-- 배송지명 -->
                                        <td><input type="text" id="name" name="name"></td><!-- 받는분 -->
                                        <td><input type="address" id="address" name="address"></td><!-- 주소 -->
                                        <td><button type="button" onclick="goPopup();">주소찾기</button></td>
                                        <td colspan="2"><input type="phone" id="phone"></td><!-- 휴대폰번호 -->
                                        <td>
                                            <div id="func">
                                             <form id="AddressInsert" action="<%=contextPath %>/insertAddress.me" method="post">
                                             <input type="hidden" id="address-info2" name="address-info">
                                             <input type="hidden" id="name2" name="name">
                                             <input type="hidden" id="address2" name="address">
                                             <input type="hidden" id="phone2" name="phone">
                                                <input type="button" value="확인" onclick="check();"></input>
                                                <button>취소</button>
                                            </div>
                                            </form><!--  -->
                                        </td>
                                      
                                    </tr>
                                    
                                </tbody>
                                <%} %>
                            </table>
                            </form>
                            <div class="non-address">
                                <p>조회된주소</p>
                            </div>
                            <div class="my-ad">
                                <div><p>*연락처등록시 - 입력해야합니다</p> </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <!-- //content-->
           <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
   
    
    
     	<script> /* "확인" 버튼 클릭시 -> 값을 담아줌 */
    	 function check(){
                	
                var Address = document.getElementById("Address");
                
    			var addressinfo = $("#addressinfo").val();
    			var name = $("#name").val();
    			var address = $("#address").val();
    			var phone = $("#phone").val();


    				$("#address-info2").val(address-info);
    				$("#name2").val(name2);
    				$("#address2").val(address2);
    				$("#phone2").val(phone2);

    				$("#AddressInsert").submit();
    				
              	
              	}
       	 	
    	
    	
    	</script>
</body>
</html>