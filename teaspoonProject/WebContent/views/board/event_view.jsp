<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.board.model.vo.*"%>
<%
 Board b = (Board)request.getAttribute("b");
int random = (int)(Math.random() * 100 +1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 | TeaSpoon</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/event_view.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main/main.css">
    
    <script type="text/javascript" src="resources/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner{height: 170px; line-height: 170px; background:rgb(222, 219, 210); margin-top:64px;}
    </style>
</head>

<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <br clear="both">
        <div id="banner" >
            <div class="title">이벤트</div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- product -->
                <div id="maga" >
                    <div id="magazine">
                        <div id="title">
                            <div id="title_detail">
                                <div id="con_tt"><p><%=b.getBoardTitle() %></p></div>
                                <br><br>
                                <div id="con_wr">
                                    <ul>
                                        <li>Editor's letter &nbsp;|</li>
                                        <li>&nbsp;<%=b.getCreateDate() %></li>
                                    </ul>
                                </div>
                            </div>
                            <div id="sns">
                                <ul>
                                    <li><a href="#"><img src="<%=contextPath %>/resources/img/board/twitter.png" alt="트위터공유하기"></a></li>
                                    <li><a href="#"><img src="<%=contextPath %>/resources/img/board/facebook.png" alt="페이스북 공유하기"></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="maga_con">
                            <div class="event_img_1" style="position: relative;">
						        <img src="<%=contextPath%>/resources/img/board/teaspoonevent.jpg">
						    </div>
						    <div class="click_div" style="position:absolute; top:50.7%; left:36.1%; z-index:100;width:277px; height:73px; border:1px solid red; border-radius:50px;" ></div>
                        </div>
                	</div>
                    <!-- //event -->
                  </div>
                <!-- //maga -->
         <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
        </div>
        <!-- //content -->
	</div>
    <!-- //wrap-->
    <script>
    	$(function(){
    		$(".click_div").click(function(){
    			alert(<%=random%>+"포인트 지급되었습니다!");
    			$.ajax({
    				url:"eventPoint.bo",
    				type:"post",
    				data:{random : random,
    					 userNo : <%=loginUser.getUserNo()%>},
    				success:function(result){
    					if(result>0){
    						console.log("ajax 통신성공!");
    					}
    				},error:function(){
    					console.log("ajax 통신실패!");
    				}
    			})
    		});
    	})
    </script>
</body>
</html>