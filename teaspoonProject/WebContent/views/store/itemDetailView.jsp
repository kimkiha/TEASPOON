<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*, com.teaspoon.board.model.vo.*"%>
<%
	Product p = (Product)request.getAttribute("p");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세 | TeaSpoon</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/store/itemDetailView.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer1.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    #content1 {width:100%; min-height:100%; background: #ffffff; }
    #productArea{min-height:100%}
</style>
</head>
<body>
<div id="wrap">
         <%@ include file="../common/menubar.jsp" %>
         <div style="height:115px"></div>
        <!-- //header -->
        <div id="banner">
            <div class="contaniner">
                <div style="margin: 100px 0px;">
                    <p id="head_title"><%=p.getPname() %></p>
                </div>
                <div style="border: 1px solid; width:150px; float:left; margin-left: 500px;">
                </div>
            </div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="productArea" >
                        <div id="productList" >
                            <div id="productList1">
                                <div class="pList1">
                                    <div class="thumbnail">
                                        <img width="500px" height="400px" 
                                        	src="<%=contextPath %>/resources/thumbnail_upfiles/<%=list.get(0).getChangeName()%>">
                                    </div>
                                    <div class="move_review">
                                        <a href="#review"><p>REVIEW &gt;&gt;</p></a>
                                    </div>
                                </div>
                                <div class="pList2">
                                    <!--상품명, 상품설명요약 -->
                                    <div class="p_explain1">
                                        <h4><%=p.getPname() %></h4>
                                        <p><%=p.getKeyword() %></p>
                                   </div>

                                   <!-- 구매수량 변경 옵션 -->
                                   <div class="p_explain4">
                                        <div class="num">
                                            <p>구매수량</p>
                                        </div>
                                        <div class="number">
                                            <a href="#" id="decreaseQuantity">
                                                <img src="<%=contextPath %>/resources/img/store/minus.png" width="20px" height="20px">
                                            </a>
                                            <b><span id="numberUpDown" style="padding-left: 20px; padding-right: 20px;">1</span></b>
                                            <a href="#" id="increaseQuantity">
                                                <img src="<%=contextPath %>/resources/img/store/plus.png" width="20px" height="20px">
                                            </a>
                                        </div>
                                   </div>

                                   <!--상품금액 합계, 정기배송버튼, 장바구니버튼, 바로구매버튼 -->
                                   <div class="p_explain5">
                                        <span> 상품금액합계 </span>
                                        <input id="price" type="hidden" value="<%=p.getPrice() %>">
                                        <span id="totalPrice"><%=p.getPrice() %>원</span>
                                        <button id="delivery">정기배송 5%할인</button>
                                        <button id="basket">장바구니 담기</button>
                                        <button id="buyNow">바로 구매하기</button>
                                   </div>
                                </div>

                                <!--제품상세버튼, 고객리뷰버튼-->
                                <div class="pList3">
                                    <p>제품상세</p>
                                    <a href="#review"><p style="font-weight:bold;">고객리뷰</p></a>
                                </div>
                                
                                <!--상품상세페이지-->
                                <div class="pList4"style="height:inherit;">
                                    <hr>
                                    <div>
                                    	<p style="font-size:20px; text-align:left; padding-bottom:30px;"><%=p.getPcontent() %></p>
                                    </div>
                                   	<% for(int i=1; i<=list.size()-1; i++){ %>
                                    <div style="text-align:center; width:inherit;">
                                    	<img style="width:100%;"
                                    		src="<%=contextPath %>/resources/thumbnail_upfiles/<%=list.get(i).getChangeName()%>">
                                    </div>
                                   	<%} %>
                                </div>

								<br><br>
                                <div class="pList5_1">
                                <hr>
                                    <p style="font-weight:bold; margin-top: 120px;">고객리뷰</p>
                                    <button class="writeReview">리뷰쓰기</button>
                                </div>
                                <!-- action에 경로설정(리뷰작성하면 아래 리뷰칸으로 넣어지도록? -->
                                <div id="reviewList">
                                <form id="reviewForm" action="<%=contextPath %>/insert.re" method="post">
	                                <table id="writeReview" cellpadding="0" cellspacing="0" >
	                                    <tr>
	                                        <td style="width:130px;text-align: right; font-size: 18px; vertical-align: top; padding-top: 10px; padding-right: 30px; border-top: 1px solid #ddd;">내용</td>
	                                        <td colspan="3" style="border-top: 1px solid #ddd;"><textarea name="" id="" cols="" rows="10" style="resize: none; border-radius: 5px; width: 750px; height:185px ; border-color: #ddd;" placeholder="내용을 입력해주세요"></textarea></td>
	                                        
	                                        <td style="width:100px; border-top: 1px solid #ddd;"></td>
	                                    </tr>
	                                    <tr style="height: 50px;">
	                                        <td colspan="2" style="text-align: right;"></td>
	                                        <td width="100px">
	                                            <button id="resetReview" class="btn" type="reset" name="reset" value="reset">취소</button>
	                                        </td>
	                                        <td width="100px">
	                                            <button id="subReview" class="btn" type="submit" name="submit" value="submit">작성완료</button>
	                                        </td>
	                                        <td></td>
	                                    </tr>
	                                </table>
                                </form>
                                </div>
                                <!--//리뷰쓰기 버튼-->

                                <!--고객리뷰페이지(상단과 엥커걸림)-->
                                <div id="review" class="pList5">
                                    <br><br>
                                    <div class="pList5_2" style="padding-bottom:20px">
                                        <button class="btn_review">전체리뷰</button>
                                        <button class="btn_review">사진리뷰</button>
                                    </div>
                                    <!--사용자 후기모음-->
                                    <div class="pList5_3">
                                        <table>
                                            <tr>
                                                <td width="200px">날짜</td>
                                                <td width="600px" style="text-align: left;">구매자(아이디**)</td>
                                            </tr>
                                            <tr>
                                            	<td></td>
                                                <td><p>내용</p></td>
                                            </tr>
                                        </table>
                                        <!--더보기 할때 글 3개씩 밑으로?-->
                                        <button> 더보기 </button>
                                        <br><br><br>
                                    </div>
                                </div>
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
        // 구매수량 변경 옵션
        
        $(function(){
        	
        	var price;
        	var num1;
        	
            $('#decreaseQuantity').click(function(e){
                e.preventDefault();
                var stat = $('#numberUpDown').text();
                var num = parseInt(stat,10);
                  num--;
                if(num<=0){
                    alert('더이상 줄일수 없습니다.');
                    num =1;
                }
                $('#numberUpDown').text(num);
                totalSum();
                
            });
                $('#increaseQuantity').click(function(e){
                    e.preventDefault();
                    var stat = $('#numberUpDown').text();
                    var num = parseInt(stat,10);
                    num++;

                    if(num>5){
                    alert('더이상 늘릴수 없습니다.');
                    num=5;
                }
                    $('#numberUpDown').text(num);
                    totalSum();
                    
            });
                
                function totalSum(){
        			num1 =  $('#numberUpDown').text();
                	price = $("#price").val();
                	total = num1*price;
                	$("#totalPrice").text(total+"원");
                }
        });
        

        //리뷰쓰기 버튼
        $(function(){
            $(".writeReview").click(function(){
                var review = $(this).next();
                if(review.css("display")=="none"){
                    $(this).siblings("p").slideUp();
                    review.slideDown();
                }
            });
        });


    </script>
</body>
</html>