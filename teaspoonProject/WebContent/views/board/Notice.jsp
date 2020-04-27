<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/notice.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
        #banner {margin-top:115px;height: 170px; line-height: 170px; background:url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg") center top repeat-x;}
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
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>조회수</th>
								<th>등록일</th>
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
            <!-- //contaniner-->
        </div>
   <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!--//wrap-->
</body>
</html>