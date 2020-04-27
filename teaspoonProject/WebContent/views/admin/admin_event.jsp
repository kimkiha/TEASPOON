<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.board.model.vo.*,com.teaspoon.common.PageInfo "%>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	String eventKeyword = String.valueOf(request.getAttribute("eventKeyword"));

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트</title>
  
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
    </style>
</head>
<body>
   <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/이벤트.png" width="50px" width="50px"></div>
                        <div id="c1_1_1_2"><p>이벤트관리 페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                             <input type="text" placeholder="이벤트제목" id="eventKeyword">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table class="listArea" >
                            <thead>
                                <tr>
                                    <th width="100">글번호</th>
                                    <th width="300">제목</th>
                                    <th width="50">조회수</th>
                                    <th width="100">작성일</th>
                                    <th width="100">수정일</th>
                                    <th width="50">상태</th>
                                    <th >
                                        <button><a href="eventInsertForm.bo">추가</a></button>
                                    </th>
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
											<td><%=b.getModifyDate() %></td>
											<td class="status"><%=b.getStatus()%></td>
		                                    <td>
	                                        <button><a href="<%=contextPath%>/eventUpdateForm.bo?bno=<%=b.getBoardNo()%>">수정</a></button>
	                                        <button><a href="<%=contextPath%>/eventDelete.bo?bno=<%=b.getBoardNo()%>">삭제</a></button>
                                   			</td>
										</tr>
									
									<%} %>
								<%} %>
                      </table>
                    </div>
                </div>
                <div id="c1_2">

                </div>
                <div id="c1_3">
                <% if(!eventKeyword.equals("null")){ %>
                	<!-- 현재 페이지에 보여질 페이징바 -->
					<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
						<!-- 맨 처음으로(<<) -->
						<button onclick="location.href='eventKeywordList.bo?currentPage=1&eventKeyword=<%=eventKeyword %>'">&lt;&lt;</button>
						<!-- 이전페이지로(<) -->
						<button onclick="location.href='eventKeywordList.bo?currentPage=<%=currentPage-1%>&eventKeyword=<%=eventKeyword%>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='eventKeywordList.bo?currentPage=<%=p%>&eventKeyword=<%=eventKeyword %>'"><%=p%></button>
						<%}else{ %>
						<button disabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
						<!-- 다음페이지로(<) -->
						<button onclick="location.href='eventKeywordList.bo?currentPage=<%=currentPage+1%>&eventKeyword=<%=eventKeyword %>'">&gt;</button>
						<!-- 맨 마지막으로(>>) -->
						<button onclick="location.href='eventKeywordList.bo?currentPage=<%=maxPage %>&eventKeyword=<%=eventKeyword %>'">&gt;&gt;</button>
					<%} %>
                    
                <%}else { %>
                    <!-- 현재 페이지에 보여질 페이징바 -->
					<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
						<!-- 맨 처음으로(<<) -->
						<button onclick="location.href='eventAdminList.bo?currentPage=1>'">&lt;&lt;</button>
						<!-- 이전페이지로(<) -->
						<button onclick="location.href='eventAdminList.bo?currentPage=<%=currentPage-1%>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='eventAdminList.bo?currentPage=<%=p%>'"><%=p%></button>
						<%}else{ %>
						<button disabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
						<!-- 다음페이지로(<) -->
						<button onclick="location.href='eventAdminList.bo?currentPage=<%=currentPage+1%>'">&gt;</button>
						<!-- 맨 마지막으로(>>) -->
						<button onclick="location.href='eventAdminList.bo?currentPage=<%=maxPage %>'">&gt;&gt;</button>
					<%} %>
				<%} %>
                </div>
               
               
            </div>
        </div>
        
        <script>
    	$(function(){
    		$("#searchBtn1").click(function(){
    			var eventKeyword = $("#eventKeyword").val();
    			location.href='eventKeywordList.bo?eventKeyword='+eventKeyword+"&currentPage=1";
    		});
    	})
   	 	</script>     
</body>
</html>