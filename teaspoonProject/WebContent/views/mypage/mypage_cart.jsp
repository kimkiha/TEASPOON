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
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" ><%=loginUser.getGradeName() %></td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="#" >회원정보수정</a> </td>
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
                                <a  href="#" ><%=loginUser.getPcode() %>개</a>
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
                                        <th>상품가격</th>
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
                                        <td ><input type="checkbox" name="checkRow" value="${content.IDX}" ></td>
                                        <td  style="text-align:left;"><img src="" width="130px" height="130px"></td>
                                        <td  style="text-align:left;" class="t-title"><%=list.get(i).getPname() %></td>
                                        <td><input type="number" value="1" class="input-qnt"></td>
                                        <td><p><%=list.get(i).getPrice() %>원</p></td>
                                        <td><p><%=list.get(i).getPrice() %>원</p></td>
                                        <td><p>2,500원</p></td>
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
                                    <b>18,000원</b>
                                    <b>+</b>
                                    <span>총배송비</span>
                                    <b>2,500원</b>
                                    <b>=</b>
                                    <b>20,500원</b>
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
        /* */


    </script>
</body>
</html>