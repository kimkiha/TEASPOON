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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	#content1 {width:100%; height:inherit; background: #ffffff; }
	#banner {height: 270px; line-height: 270px; background:url("<%=request.getContextPath() %>/resources/img/store/storetop_best.jpg") center top no-repeat;}
	.top_list>#top_list>tr *:hover{color:#d6ae71;}
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
	                        	<input type="hidden" name="pcode" value=<%=list.get(0).getPcode() %>>
	                            <input type="hidden" name="kind" value=<%=list.get(0).getKind() %>>
                                <img src="<%=contextPath%>/resources/thumbnail_upfiles/<%=list.get(0).getTitleImg() %>" style="float:left; width:100%; height:inherit">
                            </div>
                            <div class="product_detail">
                                <p style="font-size:22px; padding-bottom:10px;"><%=list.get(0).getPname()%></p>
                            </div>
                            <div class="like">
                                <img class="like_icon empty" src="<%=contextPath %>/resources/img/store/heart_emtpy.png">
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
                                <% for(int i=0; i<8; i++) { %>
                        		<% Product p = list.get(i); %>
                                <tr id="top_list">
                                	<td><input type="hidden" name="pcode" value=<%=p.getPcode() %>></td>
	                            	<td><input type="hidden" name="kind" value=<%=p.getKind() %>></td>
                                    <th><%=i+1 %></th>
                                    <td width="400px" style="padding-left:50px; cursor:pointer;"><%=p.getPname()%></td>
                                </tr>
                                <%} %>
                            </table>

                        </div>
                        <div id="productList">
                        
                        <% for(int i=1; i<list.size(); i++) { %>
                        	<% Product p = list.get(i); %>
	                            <div class="product" style="margin-top:50px; margin-right:30px;">
	                                <div class="product_img">
	                            		<input type="hidden" name="pcode" value=<%=p.getPcode() %>>
	                            		<input type="hidden" name="kind" value=<%=p.getKind() %>>
	                                    <img src="<%=contextPath%>/resources/thumbnail_upfiles/<%=p.getTitleImg() %>" style="float:left; width:300px; height:inherit">
	                                </div>
	                                <div class="product_detail" style="width:300px; height:60px; padding:0px">
	                                    <p style="padding-top:20px;padding-left:12px;"><%=p.getPname() %></p>
	                                </div>
	                                <div class="like">
	                                    <img class="like_icon empty" src="<%=contextPath %>/resources/img/store/heart_emtpy.png">
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
    		$('.product_img').click(function(){
    			var kind = $(this).children().eq(1).val();
    			var pcode = $(this).children().eq(0).val();
    			if(kind=='C'){
    				location.href="<%=contextPath%>/detail.co?pcode="+pcode;
    			} else{
    				location.href="<%=contextPath%>/detail.it?pcode="+pcode;
    			}
    		});
    	});
        
        
        
        // 베스트 상품 목록(1~7번) 상세페이지 연결
        $(function(){
    		$('#top_list').click(function(){
    			var pcode = $(this).children().eq(0).val();
    			var kind = $(this).children().eq(1).val();
    			if(kind=='C'){
    				location.href="<%=contextPath%>/detail.co?pcode="+pcode;
    			} else{
    				location.href="<%=contextPath%>/detail.it?pcode="+pcode;
    			}
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
        
        
        // 장바구니 이동 팝업
       /* $("#open").click(function(){
            $(".modal").fadeIn();
        });
        $("#gobasket").click(function(){
            // 장바구니로 이동 링크
        });
        $(".close").click(function(){
            $(".modal").fadeOut();
        });
            */

        </script>

        <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
</body>
</html>