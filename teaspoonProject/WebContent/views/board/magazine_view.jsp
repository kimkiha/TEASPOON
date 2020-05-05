<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.board.model.vo.*"%>
<%
 Board b = (Board)request.getAttribute("b");
 Board preb = (Board)request.getAttribute("preb");
 Board nextb = (Board)request.getAttribute("nextb");
 System.out.print(preb.getChangeName());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 | TeaSpoon</title>
	syso
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_view.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_view_photo.css">
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
            <div class="title">매거진</div>
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
                            <%=b.getBoardContent() %>
                        </div>
                    	<div id="pre_next">
	                        <div id="pre">
	                        	<figure class="snip1504" >
	                            <%if(nextb.getBoardTitle() != null){ %>	
	                                <img src="<%=contextPath %>/resources/img/board/<%=nextb.getChangeName()%>" >
	                                <figcaption>
	                                  <h2>"<%=nextb.getBoardTitle() %>"</h2>
	                                  <h4>Next magazine</h4>
	                                </figcaption>
	                                <a href="<%=contextPath%>/magazineDetail.bo?bno=<%=nextb.getBoardNo()%>"></a>
	                            <%}else{ %>
	                            	<img src="<%=contextPath %>/resources/img/board/magazine_view_11.jpg" />
	                                <figcaption>
	                                  <h2>다음글이 없습니다.</h2>
	                                  <h4>go-to-list</h4>
	                                </figcaption>
	                                <a href="<%=contextPath%>/magazineList.bo?currentPage=1"></a>
	                            <%} %>
	                            </figure>
	                        </div>
	                        <div id="next" style="float:left; margin:0 auto">
	                             <figure class="snip1504">
	                            <%if(preb.getBoardTitle() != null){ %>
	                                <img src="<%=contextPath %>/resources/img/board/<%=preb.getChangeName()%>"/>
	                                <figcaption>
	                                  <h2>"<%=preb.getBoardTitle() %>"</h2>
	                                  <h4>Previous magazine</h4>
	                                </figcaption>
	                                <a href="<%=contextPath%>/magazineDetail.bo?bno=<%=preb.getBoardNo() %>"></a>
	                            <%}else {%>
	                            	<img src="<%=contextPath %>/resources/img/board/magazine_view_22.jpg"/>
	                                <figcaption>
	                                  <h2>이전글이 없습니다.</h2>
	                                  <h4>go-to-list</h4>
	                                </figcaption>
	                                <a href="<%=contextPath%>/magazineList.bo?currentPage=1"></a>
	                            <%} %>
	                            </figure>
	                        </div>
                    	</div>
                	</div>
                    <!-- //magazine -->
                <!-- //maga -->
         </div>
         <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
        
        </div>
        <!-- //content -->
</div>
    <!-- //wrap-->
    <script src="<%=contextPath %>/resources/js/magazine_view.js"></script>
    
</body>
</html>