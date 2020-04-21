<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*, com.teaspoon.common.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item | TeaSpoon</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/store/itemListView.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	#content1 {width:100%; height:inherit; background:#ffffff;}
	#banner {height: 270px; line-height: 270px; background:url("<%=request.getContextPath() %>/resources/img/store/storetop_item.jpg") center top no-repeat;}
	#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
	#paging button:hover{cursor:pointer;color:#d6ae71;}
</style>
</head>
<body>
	<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
       <div style="height:115px"></div>
        <div id="banner">
            <div class="contaniner">
                <b><p style="font-size:40px;">CUP & ITEM</p></b>
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
                                <div class="product_detail" style="width:300px; height:60px; padding:0px">
                                    <p style="padding-top:20px;padding-left:12px;"><%=p.getPname() %></p>
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
                            <%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
		<!-- 맨 처음으로(<<) -->
		<button onclick="location.href='item.st?currentPage=1'">&lt;&lt;</button>
		<!-- 이전페이지로(<) -->
		<button onclick="location.href='item.st?currentPage=<%=currentPage-1%>'">&lt;</button>
		<%} %>
		
		<%for(int p=startPage; p<=endPage; p++){%>
			<%if(currentPage != p) {%>
			<button onclick="location.href='item.st?currentPage=<%=p%>'"><%=p%></button>
			<%}else{ %>
			<button dispabled><%=p %></button>
			<%} %>	
		<%} %>
		
		<%if(currentPage != maxPage){ %>
		<!-- 다음페이지로(<) -->
		<button onclick="location.href='item.st?currentPage=<%=currentPage+1%>'">&gt;</button>
		<!-- 맨 마지막으로(>>) -->
		<button onclick="location.href='item.st?currentPage=<%=maxPage %>'">&gt;&gt;</button>
		<%} %>
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