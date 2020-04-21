<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee|TeaSpoon</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/store/coffeeListView.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<style>
    #content1 {width:100%; height:inherit; background: #ffffff; }
	#banner {height: 270px; line-height: 270px; background:url("<%=request.getContextPath() %>/resources/img/store/storetop_coffee.jpg") center top no-repeat;}
</style>
</head>
<body>
<div id="wrap">
         <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <div style="height:115px"></div>
        
        <div id="banner">
            <div class="contaniner">
                <b><p style="font-size:40px;">STORE</p></b>
            </div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="productArea">
                        <div id="productList">
                        
                        	<!-- listArea -->
                        	<%for(Product p : list) {%>
                        	
                            <div class="product" style="margin-top:50px; margin-right:30px;">
                                <div class="product_img">
                                	<input type="hidden" value=<%=p.getPcode() %>>
                                    <img src="<%=contextPath%>/resources/thumbnail_upfiles/<%=p.getTitleImg() %>" style="float:left; width:300px; height:inherit">
                                </div>
                                <div class="product_detail">
                                    <a href=""><p><%=p.getPname() %></p></a>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="<%=contextPath %>/resources/img/store/heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <img id="open" class="basket_icon" src="<%=contextPath %>/resources/img/store/cart.png">
                                </div>
                                <div class="modal">
                                        <div class="modal_content">
                                            <p>장바구니로 이동하시겠습니까?</p>
                                            <button class="gobasket">장바구니보기</button>
                                            <button class="close">계속쇼핑</button>
                                        </div>
                                </div>
                            </div>
                            <%} %>
                        </div>
                        <div id="paging" class="pagination">
                            <a href="#">&laquo;</a>
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">&raquo;</a>
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
                    $('.like_icon').attr("src","<%=contextPath %>/resources/img/store/heart_full.png");
                    window.confirm("위시리스로 등록되었습니다. 위시리스트로 이동하시겠습니까?");
               } else{
                   state=0;
                   $('.like_icon').attr("src","<%=contextPath %>/resources/img/store/heart_emtpy.png");
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