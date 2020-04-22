<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*"%>
<%
	
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Best | TeaSpoon</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/store/storeBestListView.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<style>
	#content1 {width:100%; height:inherit; background: #ffffff; }
	#banner {height: 270px; line-height: 270px; background:url("<%=request.getContextPath() %>/resources/img/store/storetop_best.jpg") center top no-repeat;}
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
        <div id="content" style="padding-bottom:70px;">
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
                            	<input type="hidden" value=<%=list.get(0).getPcode() %>>
                                <img src="<%=contextPath%>/resources/thumbnail_upfiles/<%=list.get(0).getTitleImg() %>" style="float:left; width:100%; height:inherit">
                            </div>
                            <div class="product_detail">
                                <p style="padding-top:5px;padding-left:20px;"><%=list.get(0).getPname()%></p>
                            </div>
                            <div class="like">
                                <img class="like_icon" src="<%=contextPath %>/resources/img/store/heart_emtpy.png" onclick="wishList();">
                            </div>
                            <div class="basket">
                                <img id="open" src="<%=contextPath %>/resources/img/store/cart.png">
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
                                    <td width="400px"><a href="#"><%=list.get(0).getPname()%></a></td>
                                </tr>
                                <tr>
                                    <th>2</th>
                                    <td><a href="#"><%=list.get(1).getPname()%></a></td>
                                </tr>
                                <tr>
                                    <th>3</th>
                                    <td><a href="#"><%=list.get(2).getPname()%></a></td>
                                </tr>
                                <tr>
                                    <th>4</th>
                                    <td><a href="#"><%=list.get(3).getPname()%></a></td>
                                </tr>
                                <tr>
                                    <th>5</th>
                                    <td><a href="#"><%=list.get(4).getPname()%></a></td>
                                </tr>
                                <tr>
                                    <th>6</th>
                                    <td><a href="#"><%=list.get(5).getPname()%></a></td>
                                </tr>
                                <tr>
                                    <th>7</th>
                                    <td><a href="#"><%=list.get(6).getPname()%></a></td>
                                </tr>
                            </table>

                        </div>
                        <div id="productList">
                        
                        <% for(int i=1; i<list.size(); i++) { %>
                        	<%Product p = list.get(i); %>
                            <div class="product" style="margin-top:50px; margin-right:30px;">
                            	<input type="hidden" value=<%=p.getPcode() %>>
                                <div class="product_img">
                                	<input type="hidden" value=<%=list.get(i).getPcode() %>>
                                    <img src="<%=contextPath%>/resources/thumbnail_upfiles/<%=p.getTitleImg() %>" style="float:left; width:300px; height:inherit">
                                </div>
                                <div class="product_detail" style="width:300px; height:60px; padding:0px">
                                    <p style="padding-top:20px;padding-left:12px;"><%=p.getPname() %></p>
                                </div>
                                <div class="like">
                                    <img class="like_icon" src="<%=contextPath %>/resources/img/store/heart_emtpy.png" onclick="wishList();">
                                </div>
                                <div class="basket">
                                    <img id="open" src="<%=contextPath %>/resources/img/store/cart.png">
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
                    </div> 
                </div>
            </div>
        </div>

        <!--product-->
        
        <script>
        
        	
        $(function(){
    		$('.product').click(function(){
    			var pcode = $(this).children().eq(0).val();
    			location.href="<%=contextPath%>/detail.sb?pcode="+pcode;
    		});
    	});
        
        
            state=0;
            function wishList() {
              
                    $(this).attr("src","../../resources/img/store/heart_full.png");
                    console.log("<%=contextPath %>/resources/img/store/heart_full.png");
                    window.confirm("위시리스로 등록되었습니다. 위시리스트로 이동하시겠습니까?");
         
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