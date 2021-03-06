<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEASPOON</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main/main.css">

<script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>

<div id="wrap">
       <%@ include file="views/common/menubar.jsp" %>
        <br clear="both">
        <div id="banner">
            <div class="contaniner"><img id="mainImg" src="<%=contextPath%>/resources/img/main/main.jpg"></div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="product">
                        <div class="pname"><p>NEW ARRIVAL</p></div>
                        <div id="product_item">
                            <div id="product_item_1"> 
                            
                            </div>
                            <br clear="both">
                            <div id="product_item_2"> 
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 맞춤추천/공간대여 -->
            <div id="content2">
                <div class="contaniner" >
                    <div id="link">
                        <div id="link1" align="center" style=" background:url('<%=contextPath%>/resources/img/main/advice.jpg')">
                               <p style="padding-top:65px"><small>나의 커피찾기,</small></p>
                               <p><b>내 입맞에 맞는 커피를 추천받아보세요</b></p>
                                <button id="btnLink1"><a href="<%=contextPath %>/selectitem.st">추천 바로가기</a></button>
                        </div>
                        <div id="link2" align="center" style=" background:url('<%=contextPath%>/resources/img/main/rental.jpg')">
                            <p style="padding-top:65px"><small>티스푼 공간대여 서비스</small></p>
                            <p><b>특별한 날 특별한 장소, 다양한 공간에서 즐기는 티타임</b></p>
                            <button id="btnLink2"><a href="<%=contextPath %>/rental.sp">공간대여 바로가기</a></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- best coffee20 -->
            <div id="content3">
                <div class="contaniner">
                    <div id="best">
                        <div class="bestname"><p>BEST COFFEE 4</p></div>
                        <div id="best_item"> 
                            
                        </div>
                      
                    </div>
                </div>
            </div>
            <!-- 할인쿠폰 -->
            <div id="content4">
                <div class="contaniner">
                    <a class="nohover" href="#">                
                        <div id="coupon" style=" background:url('<%=contextPath%>/resources/img/main/discount.jpg')">
                            <p>20% 할인 이벤트 놓치지 마세요.</p>
                        </div>
                    </a>
                </div>
            </div>
            <!-- 매거진/이벤트/어바웃티스푼 -->
            <div id="content5">
                <div class="contaniner"> 
                    <div id="etc">
                        <table id="etc_tb" cellspacing="0" cellpadding="0" border-spacing="0">
                            <tr>
                            <figure class="snip1273 hover">
                                <td rowspan="2" width="400" height="550">
                                <p></p> <!-- 이벤트 -->
                                    <a href="<%=contextPath %>/eventList.bo?currentPage=1"><img id="maga" src="<%=contextPath %>/resources/img/main/magazine.jpg"></a>
                                </td>
                                </figure>   <!-- 어바웃티스푼 -->
                                <td width="600" height="275">
                                    <a href="<%=contextPath %>/about.bo"><img id="eve" src="<%=contextPath %>/resources/img/main/event.jpg"></a>
                                </td>
                            </tr>
                            <tr>	    <!-- 매거진 -->
                                <td><a href="<%=contextPath %>/magazineList.bo?currentPage=1"><img id="abo" src="<%=contextPath %>/resources/img/main/brandstory.jpg"></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
               </div>
            <!-- 인스타그램 -->
            <div id="content6">
                <div class="contaniner">
                <div id="insta">
                    <div id="insta_1">
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_1.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_2.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_3.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_4.jpg"></a></div>
                    </div>
                    <br clear="both">
                    <div id="insta_1">
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_5.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_6.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_7.jpg"></a></div>
                        <div><a href=""><img src="<%=contextPath %>/resources/img/main/insta_8.jpg"></a></div>
                    </div>
                </div>
                </div>
            </div>
            
        <!-- //content-->
        <%@ include file="views/common/footer.jsp" %>
    </div>
    <!-- //wrap-->
    </div>
    <script>
	    <%-- if(<%=request.getSession().getAttribute("b")%> == null){
	    	location.href='noticeMain.bo';
	    } --%>
	    
	    $(function(){
	    	$.ajax({
	    		url:"mainProductList.st",
	    		type:"post",
	    		success:function(list){
	    			var value ="";
	    			for(var i=0; i<list.length; i++){
	    			  value += "<div>" +
		                        "<a href='<%=contextPath%>/detail.co?pcode=" + list[i].pcode + "'>"+
		                        "<img src='<%=contextPath %>/resources/thumbnail_upfiles/" + list[i].changeName + "'>" +
		                        "</a>"+
		                        "<p class='best_product_name'>"+"<a href='<%=contextPath%>/detail.co?pcode=" + list[i].pcode +"'>" + list[i].pname + "</a>"+"</p>"+
		                        "<p>"+"<b>"+list[i].price+"</b>"+
		                        "</p>"+
		                    	"</div>";
	    			}
	    			$("#product_item_1").html(value);
	    			
	    		},error:function(){
	    			console.log("ajax 통신실패!");
	    		}
	    	})
	    });
	    
            
	    $(function(){
	    	$.ajax({
	    		url:"mainBestList.st",
	    		type:"post",
	    		success:function(bestlist){
	    			var value = "";
	    			for(var i=0; i<bestlist.length; i++){
	    				value += "<div class='best_content'>"+
	    		    			 "<div class='best_num'>"+	
		    					"<p class='num'>"+(i+1) +"</p>"+
			    				"<a href='<%=contextPath%>/detail.co?pcode=" + bestlist[i].pcode + "'>"+
			    				"<img src='<%=contextPath %>/resources/thumbnail_upfiles/" + bestlist[i].changeName + "'>" +
			                    "</a>"+
			                    "<p class='best_product_name'>"+"<a href='<%=contextPath%>/detail.co?pcode=" + bestlist[i].pcode +"'>" + bestlist[i].pname + "</a>"+"</p>"+
			                    "<p class='best_product_price'><b>"+bestlist[i].price+"</b></p>"+
			                    "</div>"+
			                    "</div>"
	    			}
	    			$("#best_item").html(value);
	    		},error:function(){
	    			console.log("ajax 통신실패!");
	    		}
	    	})
	    });
    	
    </script>

</body>
</html>