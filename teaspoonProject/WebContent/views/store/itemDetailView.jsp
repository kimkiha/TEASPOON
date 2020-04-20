<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Item i = (Item)request.getAttribute("i");
	// ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	// 0번 인덱스 : 대표이미지(클래스이름이 thumbnail인 div에 들어갈 이미지)
	// 1~3번 인덱스 : Content영역에 들어갈 이미지
	// Attachment titleImg = list.get(0); // 대표이미지 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세 | TeaSpoon</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/store/itemDetailView.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<style>
    #content1 {width:100%; height:2300px;background: #ffffff; }
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
                    <p id="head_title"> CUP & ITEM</p>
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
                                        	src="<%=contextPath %>/resources/img/store/product4_1.jpg">
                                    </div>
                                    <div class="move_review">
                                        <a href="#review"><p>REVIEW &gt;&gt;</p></a>
                                    </div>
                                </div>
                                <div class="pList2">
                                    <!--상품명, 상품설명요약 -->
                                    <div class="p_explain1">
                                        <h4>i.getItemName();</h4>
                                        <p>i.getItemText();</p>
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
                                        <span> i.getPrice() * 구매수량</span>
                                        <button id="delivery">정기배송 5%할인</button>
                                        <button id="basket">장바구니 담기</button>
                                        <button id="buyNow">바로 구매하기</button>
                                   </div>
                                </div>

                                <!--제품상세버튼, 고객리뷰버튼-->
                                <div class="pList3">
                                    <p>제품상세</p>
                                    <a href="#review"><p>고객리뷰</p></a>
                                </div>
                                
                                <!--상품상세페이지-->
                                <div class="pList4">
                                    <hr>
                                    <div>
                                    	<!--<=img width="500px" height="400px" -->
                                    		<!--<=src="contextPath %>/resources/~~ <=list.get(1).chageName() %>"-->
                                    </div>
                                    <div>
                                    	i.getItemContent();
                                    </div>
                                    <div>
                                    	<!--img width="500px" height="400px" -->
                                    		<!--<=src="contextPath%> /resources/~~ <=list.get(2).chageName() %>"-->
                                    </div>
                                    <div>
                                    	<!-- img width="500px" height="400px" -->
                                    		<!--<=src="contextPath%>/resources/~~ <=list.get(3).chageName() %>"-->
                                    </div>
                                </div>


                                <div class="pList5_1">
                                    <p>고객리뷰</p>
                                    <!--리뷰쓰기 버튼 : 로그인 고객이면서 해당상품 구매완료 고객만 보이도록 설정-->
                                    <!-- if(loginUser !=null && loginUser.getUserId().equals(n.getNoticeWriter())){ -->
                                    <button class="writeReview">리뷰쓰기</button>
                                </div>
                                <!-- action에 경로설정(리뷰작성하면 아래 리뷰칸으로 넣어지도록? -->
                                <form id="reviewForm" action="" method="post">
	                                <table id="reviewForm" >
	                                    <tr style="height: 50px;">
	                                        <td width="130px" style="text-align: right; font-size: 18px; padding-right: 30px;">별점</td>
	                                        <td colspan="3" width="600px" style="text-align: left;">
	                                            <form >
	                                                <select name="starPoint" id="starPoint" style="border: 1px solid #ddd; height: 40px; width: 180px; border-radius: 5px;">
	                                                    <option value="5" selected>★★★★★</option>
	                                                    <option value="4">★★★★☆</option>
	                                                    <option value="3">★★★☆☆</option>
	                                                    <option value="2">★★☆☆☆</option>
	                                                    <option value="1">★☆☆☆☆</option>
	                                                </select>
	                                            </form>
	                                        </td>
	                                        
	                                        <td width="100px"></td>
	                                    </tr>
	                                    <tr>
	                                        <td style="text-align: right; font-size: 18px; vertical-align: top; padding-top: 10px; padding-right: 30px;">내용</td>
	                                        <td colspan="3"><textarea name="" id="" cols="" rows="10" style="resize: none; border-radius: 5px; width: 750px; height:185px ; border-color: #ddd;" placeholder="내용을 입력해주세요"></textarea></td>
	                                        
	                                        <td></td>
	                                    </tr>
	                                    <tr style="height: 50px;">
	                                        <td style="text-align: right;"></td>
	                                        <td>
	                                            <div>
	                                                <div style="float: left; padding-top: 5px;">
	                                                    <img src="<%=contextPath %>/resources/img/store/img.png" width="40px" >
	                                                </div>
	                                                <div style="float: left;">
	                                                    <button id="reviewImg" class="imgBtn" type="submit" name="img" value="img">이미지등록</button>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td width="100px">
	                                            <button id="resetReview" class="btn" type="reset" name="reset" value="reset">취소</button>
	                                        </td>
	                                        <td width="100px">
	                                            <button id="subReview" class="btn" type="submit" name="submit" value="submit"> 작성완료</button>
	                                        </td>
	                                        <td></td>
	                                    </tr>
	                                </table>
                                </form>
                                <!--//리뷰쓰기 버튼-->

                                <!--고객리뷰페이지(상단과 엥커걸림)-->
                                <div id="review" class="pList5">
                                    
                                    <hr>
                                    <div class="pList5_2">
                                        <button class="btn_review">전체리뷰</button>
                                        <button class="btn_review">사진리뷰</button>
                                        <p>평점 4.5 &starf;&starf;&starf;&starf;&star;</p>
                                    </div>
                                    <!--사용자 후기모음-->
                                    <div class="pList5_3">
                                        <table>
                                            <tr>
                                                <td width="200px">날짜</td>
                                                <td width="600px" style="text-align: left;">구매자(아이디**)</td>
                                            </tr>
                                            <tr>
                                                <td>평점</td>
                                                <td><p>내용</p></td>
                                            </tr>
                                            <tr>
                                                <td>날짜</td>
                                                <td style="text-align: left;">구매자(아이디**)</td>
                                            </tr>
                                            <tr>
                                                <td>평점</td>
                                                <td><p>내용</p></td>
                                            </tr>
                                            <tr>
                                                <td>날짜</td>
                                                <td style="text-align: left;">구매자(아이디**)</td>
                                            </tr>
                                            <tr>
                                                <td>평점</td>
                                                <td><p>내용</p></td>
                                            </tr>
                                        </table>
                                        <!--더보기 할때 글 3개씩 밑으로?-->
                                        <button> 더보기 </button>
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
            });
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