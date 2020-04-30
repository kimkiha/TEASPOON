<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.board.model.vo.*, com.teaspoon.common.PageInfo "%>
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
<title>공지사항  | TeaSpoon</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/board/notice.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
        #banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
		#paging button{border:0px; background:white; color:#4e4f53; font-weight:bold; margin:10px;}
		#paging button:hover{cursor:pointer;color:#d6ae71;}
</style>
            
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <div id="banner">
            <div class="contaniner title">공지사항</div>
        </div>
        <!-- //banner -->
          <div id="content" style="width:1200px; height:100%" >
            <!-- mypage -->
                <div class="contaniner_1 " style="height:100%">
	                <div class="notice" align="center">
	                <div class="notice_tt">티스푼 뉴스</div>
						<table class="listArea" cellspacing="0">
							<thead>
								<tr>
									<th width="50">번호</th>
									<th width="300">제목</th>
									<th width="30">조회수</th>
									<th width="100">등록일</th>
								</tr>
							</thead>
							<tbody>
								<%if(list.isEmpty()){%>
									<tr>
										<td colspan="8">조회된 리스트가 없습니다.</td>
									</tr>
									<%}else{%>
										<%for(Board b : list){ %>
											<tr>
												<td><%=b.getBoardNo() %></td>
												<td><%=b.getBoardTitle() %></td>
												<td><%=b.getCount() %></td>
												<td><%=b.getCreateDate() %></td>
											</tr>
										<%} %>
									<%} %> 
							</tbody>
						</table>
					</div>	
                </div>
                
                	<div id="paging" class="pagination" style="height:100px">
                    <!-- 현재 페이지에 보여질 페이징바 -->
					<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
						<!-- 맨 처음으로(<<) -->
						<button onclick="location.href='noticeList.bo?currentPage=1>'">&lt;&lt;</button>
						<!-- 이전페이지로(<) -->
						<button onclick="location.href='noticeList.bo?currentPage=<%=currentPage-1%>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='noticeList.bo?currentPage=<%=p%>'"><%=p%></button>
						<%}else{ %>
						<button disabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
						<!-- 다음페이지로(<) -->
						<button onclick="location.href='noticeList.bo?currentPage=<%=currentPage+1%>'">&gt;</button>
						<!-- 맨 마지막으로(>>) -->
						<button onclick="location.href='noticeList.bo?currentPage=<%=maxPage %>'">&gt;&gt;</button>
					<%} %>
                	</div>
                </div>
            <!-- //contaniner-->
   <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!--//wrap-->
    <script>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				//console.log("클릭");
				
				//현재클릭했을 때 공지사항 번호 뽑아오기
				var bno = $(this).children().eq(0).text();
				//쿼리스트링을 이용해서 전달값 전달
				location.href="<%=contextPath%>/noticeDetail.bo?bno=" + bno;
			});	
		});
		
	</script>
</body>
</html>