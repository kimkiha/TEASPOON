<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="../../resources/css/store/storeBest.css">
<link rel="styleSheet" href="../../resources/css/common/reset.css">
<link rel="styleSheet" href="../../resources/css/common/menubar.css">
<link rel="styleSheet" href="../../resources/css/common/footer.css">
<style>
	#content1 {width:100%; height:2300px;background: #ffffff; }
	#banner {height: 270px; line-height: 270px; background:url("../../resources/img/store/storetop_best.jpg") center top no-repeat;}
</style>
</head>
<body>
<div id="wrap">
         <%@ include file="../common/menubar.jsp" %>
         
        <!-- //header -->
        <div style="height:115px"></div>
        <div id="banner">
            <div class="contaniner">
                <b><p style="font-size:40px;">Weekly Best</p></b>
            </div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="productArea">
                        <div>
                            <p id="head_title2" style="margin-top: 100px; font-size: 36px; color: black;">
                                <b>한주의 베스트 상품을 만나보세요</b>
                            </p>
                        </div>
                        <div class="product_top">
                            <div class="product_img">
                                <img src="product.jpg" style="float:left; width:100%; height:inherit">
                            </div>
                            <div class="product_detail">
                                <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                            </div>
                            <div class="like">
                                <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                            </div>
                            <div class="basket">
                                <img id="open" src="cart.png">
                            </div>
                            <div class="modal">
                                    <div class="modal_content">
                                        <p>장바구니로 이동하시겠습니까?</p>
                                        <button class="gobasket">장바구니보기</button>
                                        <button class="close">계속쇼핑</button>
                                    </div>
                            </div>
                        </div>
                        <div class="top_list">
                            <table>
                                <caption><b>베스트 상품 순위</b></caption>
                                
                                <tr>
                                    <th>1</th>
                                    <td width="400px"><a href="#">제품1</a></td>
                                </tr>
                                <tr>
                                    <th>2</th>
                                    <td><a href="#">제품1</a></td>
                                </tr>
                                <tr>
                                    <th>3</th>
                                    <td><a href="#">제품1</a></td>
                                </tr>
                                <tr>
                                    <th>4</th>
                                    <td><a href="#">제품1</a></td>
                                </tr>
                                <tr>
                                    <th>5</th>
                                    <td><a href="#">제품1</a></td>
                                </tr>
                                <tr>
                                    <th>6</th>
                                    <td><a href="#">제품1</a></td>
                                </tr>
                                <tr>
                                    <th>7</th>
                                    <td><a href="#">제품1</a></td>
                                </tr>
                            </table>

                        </div>
                        <div id="productList">
                            <div class="product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <img id="open" src="cart.png">
                                </div>
                                <div class="modal">
                                        <div class="modal_content">
                                            <p>장바구니로 이동하시겠습니까?</p>
                                            <button class="gobasket">장바구니보기</button>
                                            <button class="close">계속쇼핑</button>
                                        </div>
                                </div>
                            </div>
                            <div class="p1 product" >
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img  id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="fr product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img  id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon"  id="open" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="p1 product" >
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="fr product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="p1 product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="fr product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="p1 product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="fr product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="p1 product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                            <div class="fr product">
                                <div class="product_img">
                                    <img src="product.jpg" style="float:left; width:100%; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href="해당 상품의 상세페이지로 이동"><p> SPECIAL COFFEE <br> 체리향, 월넛향 </p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <a href="장바구니에 넣기"><img id="open" class="basket_icon" src="cart.png"></a>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>


        <!--product-->
        <script>
            state=0;
            function wishList() {
               if(state==0){
                    state=1;
                    $('.like_icon').attr("src","heart_full.png");
                    window.confirm("위시리스로 등록되었습니다. 위시리스트로 이동하시겠습니까?");
               } else{
                   state=0;
                   $('.like_icon').attr("src","heart_emtpy.png");
                   window.alert("위시리스트에서 삭제되었습니다.")
               }
            }

            // 장바구니 이동 팝업
            $("#open").click(function(){
                $(".modal").fadeIn();
            });
            $("#gobasket").click(function(){
                // 장바구니로 이동 링크
            });
            $(".close").click(function(){
                $(".modal").fadeOut();
            });

   
        </script>
        


        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
</body>
</html>