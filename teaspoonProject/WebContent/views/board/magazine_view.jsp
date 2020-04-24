<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.board.model.vo.*"%>
<%
 Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 | TeaSpoon</title>
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
                                        <li>&nbsp;2020</li>
                                    </ul>
                                </div>
                            </div>
                            <div id="sns">
                                <ul>
                                    <li><a href="#"><img src="<%=contextPath %>/resources/img/board/twitter.png" alt="트위터공유하기"></a></li>
                                    <li><a href="#"><img src="<%=contextPath %>/resources/img/board/facebook.png" alt="페이스북 공유하기"></a></li>
                                </ul>
                            </div>
                            <div>
                            <%=b.getBoardContent() %>
                            </div>
                        </div>
                    </div>
                    <div id="pre_next">
                        <div id="pre">
                            <figure class="snip1504" >
                                <img src="<%=contextPath %>/resources/img/board/magazine_view_1.jpg"/>
                                <figcaption>
                                  <h2>KNOW THAT EAT</h2>
                                  <h4>알고마시면 더 맛있는 커피이야기</h4>
                                </figcaption>
                                <a href="<%=contextPath%>/magazineDetail.bo?bno=<%=b.getBoardNo()+1 %>"></a>
                            </figure>
                        </div>
                        <div id="next" style="float:left; margin:0 auto">
                            <figure class="snip1504" >
                                <img src="<%=contextPath %>/resources/img/board/<%=b.getChangeName() %>" >
                                <figcaption>
                                  <h2>what's a coffee</h2>
                                  <h4>커피가 나에게 물을 때</h4>
                                </figcaption>
                                <a href="<%=contextPath%>/magazineDetail.bo?bno=<%=b.getBoardNo()+1%>"></a>
                            </figure>
                        </div>
                    </div>
                </div>
            <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
</div>
    <!-- //wrap-->
    <script src="<%=contextPath %>/resources/js/magazine_view.js"></script>
    
</body>
</html>