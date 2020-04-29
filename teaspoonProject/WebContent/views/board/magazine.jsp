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
<title>매거진 | TeaSpoon</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/magazine_photo.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
    
    <script type="text/javascript" src="resources/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
         #banner {margin-top:84px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
        #paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
		#paging button:hover{cursor:pointer;color:#d6ae71;}
		#content1{height:100%}
    </style>
</head>

<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <br clear="both">
        <div id="banner" >
            <div class="contaniner title">매거진</div>
        </div>
        <!-- //banner -->
          <div id="content">
            <!-- magazine -->
                <div class="contaniner" >
                <!-- magazine -->
                    <div id="magazine">
                        <div id="line_one">
                        	<%for(Board b : list) {%>
                                <div class="first_mz">
                                    <div class="effect-wrap">
                                        <figure class="effect7">
                                            <img style="width:100%;height:100%;"src="<%=contextPath%>/resources/img/board/<%=b.getChangeName() %>" alt="" > 
                                            <figcaption>
                                                <h3>KNOW THAT EAT</h3>
                                                <p>알고마시면 더 맛있는 커피이야기</p>
                                                <p><%=b.getBoardTitle() %></p>
                                                 <a href="<%=contextPath%>/magazineDetail.bo?bno=<%=b.getBoardNo() %>" class="read">매거진 보기+</a>
                                            </figcaption>
                                        </figure>
                                    </div>
                                </div>
                              <%} %>
                        </div>
                    </div>
                
                	<div id="paging" class="pagination" style="height:100px">
                    <!-- 현재 페이지에 보여질 페이징바 -->
					<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
						<!-- 맨 처음으로(<<) -->
						<button onclick="location.href='magazineList.bo?currentPage=1>'">&lt;&lt;</button>
						<!-- 이전페이지로(<) -->
						<button onclick="location.href='magazineList.bo?currentPage=<%=currentPage-1%>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='magazineList.bo?currentPage=<%=p%>'"><%=p%></button>
						<%}else{ %>
						<button disabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
						<!-- 다음페이지로(<) -->
						<button onclick="location.href='magazineList.bo?currentPage=<%=currentPage+1%>'">&gt;</button>
						<!-- 맨 마지막으로(>>) -->
						<button onclick="location.href='magazineList.bo?currentPage=<%=maxPage %>'">&gt;&gt;</button>
					<%} %>
                	</div>
        
                </div>
          </div>
            <!-- 공지사항 -->
            <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!-- //wrap-->
</body>
</html>