<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.board.model.vo.*,com.teaspoon.common.PageInfo "%>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	ArrayList<Attachment> atList = (ArrayList<Attachment>)request.getAttribute("atList");
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
<title>Insert title here</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/event.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner{height: 170px; line-height: 170px; background:rgb(222, 219, 210);}
    </style>
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <div></div>
        <div id="banner">
            <div class="contaniner title">이벤트</div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div id="event">
                        <div class="status">
                            <ul>
                                <li style="margin-left:350px;"><a href="#"><b>진행중이벤트</b></a></li>
                                <li>&nbsp;/&nbsp;</li>
                                <li><a href="#">종료된이벤트</a></li>
                            </ul>
                        </div>
                        <div>
                            <div id="event_content">
                                <ul>
                                <%for(Board b : list){ %>
                                    <li>
                                        <div class="img">
                                        <a href="#">
                                                <img src="<%=contextPath %>/resources/img/board/<%=b.getChangeName()%>">
                                        </a>
                                        </div>
                                        <div class="event_text">
                                            <span><</span>
                                            <h1><%=b.getBoardTitle() %></h1>
                                            <p>2020.04.01~2020.04.30</p>
                                        </div>
                                    </li>
                                <%} %>
                                </ul>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!-- //wrap-->
 </body>
</html>