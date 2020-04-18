<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Coffee c = (Coffee)request.getAttribute("c");
	// ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	// 0번 인덱스 : 대표이미지(클래스이름이 thumbnail인 div에 들어갈 이미지)
	// 1~3번 인덱스 : Content영역에 들어갈 이미지
	// Attachment titleImg = list.get(0); // 대표이미지 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="../../resources/css/store/storeDetail.css">
<link rel="styleSheet" href="../../resources/css/common/reset.css">
<link rel="styleSheet" href="../../resources/css/common/menubar.css">
<link rel="styleSheet" href="../../resources/css/common/footer.css">
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
                    <p id="head_title">c.getName()</p>
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
                                        <img src="<%=contextPath %>/resources/img/store/product6_1.jpg">
                                    </div>
                                    <div class="move_review">
                                        <a href="#review"><p>REVIEW &gt;&gt;</p></a>
                                    </div>
                                </div>
                                <div class="pList2">
                                    <!--상품명, 상품설명요약 -->
                                    <div class="p_explain1">
                                        <h4>c.getName()</h4>
                                        <p>c.getCoffeeText()</p>
                                   </div>

                                   <!--원두 그람수 옵션(셋중에 하나만 가능)-->
                                   <div class="p_explain2">
                                        <hr>
                                        <p><b>&gt; 얼마나 담아드릴까요?</b></p>
                                        <form>
                                            <input type="radio" id="small" name="amount" value="small" checked>
                                            <label for="small">200g (￦18,000) 주말에 한두잔 가벼운 커피타임</label><br>
                                            <input type="radio" id="medium" name="amount" value="medium">
                                            <label for="medium">400g (￦30,000) 하루 한 잔의 커피</label><br>
                                            <input type="radio" id="large" name="amount" value="large">
                                            <label for="large">600g (￦42,000) 소중한 사람과 함께 즐기는 커피</label>
                                        </form>
                                   </div>

                                   <!--원두 굵기조절 옵션(select된 하나만 가능)-->
                                   <div class="p_explain3">
                                        <hr>
                                        <p><b>&gt; 갈아드릴까요?</b></p>
                                        <form action="">
                                            <select name="grind" id="bean" style="width: 100%; height: 40px; font-size: medium;">
                                                <option value="holeBean">홀빈(갈지않음)</option>
                                                <option value="handDrip">핸드드립/클레버용</option>
                                                <option value="coffeeMaker">커피메이커용</option>
                                                <option value="franchPress">프렌치프레스용</option>
                                                <option value="mokaPot">모카포트/에어로프레스용</option>
                                                <option value="espresso">에스프레소머신용</option>
                                                <option value="dutch">더치/콜드브루용</option>
                                            </select>
                                        </form>
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

                                   <!-- 선택한 옵션 담아서 목록 보여주기 -->








                                   <!--상품금액 합계, 정기배송버튼, 장바구니버튼, 바로구매버튼 -->
                                   <div class="p_explain5">
                                        <span> 상품금액합계</span>
                                        <span> c.getPrice() * 구매수량</span>
                                        <button id="delivery">정기배송 5%할인</button>
                                        <button id="basket">장바구니 담기</button>
                                        <button id="buyNow">바로 구매하기</button>
                                   </div>
                                </div>

                                <!--제품상세버튼, 고객리뷰버튼-->
                                <div class="pList3">
                                    <p class="">제품상세</p>
                                    <a href="#review"><p class="">고객리뷰</p></a>
                                </div>
                                
                                <!--상품상세페이지-->
                                <div class="pList4">
                                    <hr>
                                    <div>
                                    	<!--<=img width="500px" height="400px" -->
                                    		<!--<=src="contextPath %>/resources/~~ <=list.get(1).chageName() %>"-->
                                    </div>
                                    <div>
                                    	c.getCoffeeContent();
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

                                <!--고객리뷰페이지-->
                                <div class="pList5_1">
                                    <p>고객리뷰</p>
                                    
                                    <!--리뷰쓰기 버튼-->
                                    <button>리뷰쓰기</button>
                                </div>
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
                                <!--//리뷰쓰기 버튼-->
                                <br>
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

            // checked & selected div에 띄우기



    </script>

</body>
</html>