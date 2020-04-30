<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.board.model.vo.*,com.teaspoon.common.PageInfo, java.text.SimpleDateFormat, java.util.Date"%>

출처: https://hyeonstorage.tistory.com/232 [개발이 하고 싶어요] "%>
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
<title>이벤트 | TeaSpoon</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/board/event.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main/main.css">
    
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner {margin-top:88px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
    	#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
		#paging button:hover{cursor:pointer;color:#d6ae71;}
		.goEvent{
			cursor:pointer;
		}
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
          <div id="content" style="height:2000px">
            <!-- product -->
            <div id="content1" style="height:100%">
                <div class="contaniner" style="hegith:100%">
                    <div id="event">
                        <%--<div class="status">
                            <ul>
                                <li style="margin-left:350px;"><a href="#"><b>진행중이벤트</b></a></li>
                                <li>&nbsp;/&nbsp;</li>
                                <li><a href="#">종료된이벤트</a></li>
                            </ul>
                        </div> --%>
                            <div id="event_content" style="margin-top:120px">
                                <ul>
                                <%for(Board b : list){ %>
                                    <li class="goEvent">
                                        <div class="img" onclick="location.href='<%=contextPath%>/eventDetail.bo?bno=<%=b.getBoardNo() %>'">
                                          <img src="<%=contextPath %>/resources/img/board/<%=b.getChangeName()%> ">
                                        
                                        </div>
                                        <div class="event_text">
                                            <span><%=b.getCreateDate()%></span>
                                            <h1><%=b.getBoardTitle() %></h1>
                                            <p><%=b.getCreateDate()%>~</p>
                                        </div>
                                    </li>
                                <%} %>
                                </ul> 
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
                    </div>
                     
                </div>
            </div>
      
        <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
  </div>
    <!-- //wrap-->
 <script>
 	$(function(){
 	})
		 function CountDownTimer(dt, id)
		 {
			 var end = new Date(dt);
			
			 var _second = 1000;
			 var _minute = _second * 60;
			 var _hour = _minute * 60;
			 var _day = _hour * 24;
			 var timer;
			
			 function showRemaining() {
			 var now = new Date();
			 var distance = end - now;
			 if (distance < 0) {
			
			 clearInterval(timer);
			 document.getElementById(id).innerHTML = 'EXPIRED!';
			
			 return;
			 }
			 var days = Math.floor(distance / _day);
			 document.getElementById(id).innerHTML = days + '일 ';
			 }
			
			 timer = setInterval(showRemaining, 1000);
		 }
 </script>
 </body>
</html>