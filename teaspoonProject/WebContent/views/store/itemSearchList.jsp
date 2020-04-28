<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*,com.teaspoon.common.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String keyword = request.getParameter("keyword");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee|TeaSpoon</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/store/coffeeListView.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    #content1 {width:100%; height:inherit; background: #ffffff; }
	#banner{height: 270px; line-height: 270px; background:url("<%=request.getContextPath() %>/resources/img/store/storetop_coffee.jpg") center top no-repeat;}
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
                        	<%for(int i=0; i<list.size(); i++) {%>
                        	
                            <div class="product" style="margin-top:50px; margin-right:30px;" >
                            	
                                <div class="product_img">
                                	<input type="hidden" class="pcode<%=i%>" name="pcode" value=<%=list.get(i).getPcode() %>>
                                    <img src="<%=contextPath%>/resources/thumbnail_upfiles/<%=list.get(i).getTitleImg() %>" style="float:left; width:300px; height:inherit">
                                </div>
                                <div class="product_detail" style="width:300px; height:60px; padding:0px">
                                   <p style="padding-top:20px;padding-left:15px;"><%=list.get(i).getPname() %></p>
                                </div>
                                <div class="like">
                                    <img class="like_icon empty" src="<%=contextPath %>/resources/img/store/heart_emtpy.png">
                                </div>
                                
                                <div class="basket">
                                    <img id="open" class="basket_icon" src="<%=contextPath %>/resources/img/store/cart.png">
                                </div>
                            </div>
                            <%} %>
                        </div>
                        <div id="paging" class="pagination">
                            <%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
							<!-- 맨 처음으로(<<) -->
							<button onclick="location.href='searchItem.st?currentPage=1&keyword=<%=keyword %>'">&lt;&lt;</button>
							<!-- 이전페이지로(<) -->
							<button onclick="location.href='searchItem.st?currentPage=<%=currentPage-1%>&keyword=<%=keyword %>'">&lt;</button>
							<%} %>
							
							<%for(int p=startPage; p<=endPage; p++){%>
								<%if(currentPage != p) {%>
								<button onclick="location.href='searchItem.st?currentPage=<%=p%>&keyword=<%=keyword %>'"><%=p%></button>
								<%}else{ %>
								<button dispabled><%=p %></button>
								<%} %>	
							<%} %>
							
							<%if(currentPage != maxPage){ %>
							<!-- 다음페이지로(<) -->
							<button onclick="location.href='searchItem.st?currentPage=<%=currentPage+1%>&keyword=<%=keyword %>'">&gt;</button>
							<!-- 맨 마지막으로(>>) -->
							<button onclick="location.href='searchItem.st?currentPage=<%=maxPage %>&keyword=<%=keyword %>'">&gt;&gt;</button>
							<%} %>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

		<!-- <form id="duplicateDeletePcode" action="deleteWish.me" method="post">
			<input type="hidden" name="pcode" id="dPcode">
		</form> -->
		
		
        <!--product-->
        <script>
        	// 개별 상품의 상세 페이지로 이동
        	$(function(){
        		$('.product_img').click(function(){
        			var pcode = $(this).children().eq(0).val();
        			location.href="<%=contextPath%>/detail.co?pcode="+pcode;
        		});
        	});
        

    		// 페이지로딩시 로그인한 유저의 위시리스트 목록조회
    		$(function(){
    			selectWishList();
    		});
    		
    		function selectWishList(){
    			
    			var icon = $('.like_icon');
    			var loginUser = "<%=loginUser.getUserId()%>";
    			if(loginUser != null){
    				$.ajax({
    					url:"selectWish.st",
    					type:"post",
    					success:function(list){
							for(var i=0; i<12; i++){
								var p = '.pcode'+i;	
								for(var j=0; j<list.length; j++){
									if($(p).val()==list[j].pcode){
										var heart =$(p).parent().siblings().eq(1).children();
										heart.removeClass("empty");
										heart.addClass("full");
										heart.attr("src","<%=contextPath %>/resources/img/store/heart_full.png");
									}
								}
							}
    					},error:function(){
    						//console.log("사용자 위시리스트 조회용 ajax실패")
    					}
    				})
    			}
    		}
    		
    		

        	// 위시리스트 등록 ajax
        	$(function(){
        		$('.like_icon').click(function(){
        			var pcode1 = $(this).parent().siblings([".product_img"]).children().eq(0).val();
        			//console.log(pcode1);
        			
					var icon = $(this);
					
					if(icon.attr("class") == "like_icon empty"){ // 빈 하트일 경우 --> 위시리스트 등록
	        			$.ajax({
	        				url:"insertWish.me",
	        				data:{pcode:pcode1},
	        				success:function(result){
	        					if(result > 0){
				        			 icon.removeClass("empty");
				        			 icon.addClass("full");
				        			 icon.attr("src","<%=contextPath %>/resources/img/store/heart_full.png");
				        			 var bool = window.confirm("위시리스로 등록되었습니다. 위시리스트로 이동하시겠습니까?");
				        			 if(bool){
				        				 location.href="<%=contextPath %>/wishList.me";
				        			 }
	        					} else if(result<0){
	        						$("#dPcode").val(pcode1);
	        						$("#duplicateDeletePcode").submit();
	        						
	        					} else if(result == 0){
	        						window.alert("로그인이 필요한 서비스입니다.");
	        					}
	        				}, error:function(){
	        					window.alert("통신에러1");
	        				}
        				});
        			
					}else{ // 채워진 하트일 경우 --> 위시리스트 삭제
						
						$.ajax({
							url:"deleteWish.me", 
							data:{pcode:pcode1},
							success:function(result){
								if(result > 0){
				        			 icon.removeClass("full");
				        			 icon.addClass("empty");
									 icon.attr("src","<%=contextPath %>/resources/img/store/heart_emtpy.png");
									 window.alert("위시리스트에서 삭제되었습니다.")
								}else{
									
								}
							},error:function(){
								window.alert("통신에러2");
							}
						})
					}
        		 });
        	});
        	

            // 장바구니 이동
            /*$(function(){
            	$('.basket_icon').click(function(){
            		$.ajax({
            			url:,
            			type:"post",
            			data:{pcode:pcode},
            			
            		})
            	})
            })*/
            

   
        </script>
        


        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
</body>
</html>