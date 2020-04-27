<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.board.model.vo.*"%>
<%
 Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
									<th width="700" style="text-align:left; padding-left:50px"><%=b.getBoardTitle() %></th>
									<th width="150"><%=b.getCreateDate() %></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2">
										<%=b.getBoardContent() %>
									</td>
								</tr>
							</tbody>
						</table>
						<div style="width:90%">
							<button id="btn" type="button">
								<a href="<%=contextPath%>/noticeList.bo?currentPage=1"  style="color:white;" >목록으로</a>
							</button>
						</div>
					</div>	
                </div>
                
                </div>
            <!-- //contaniner-->
   <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!--//wrap-->
</body>
</html>