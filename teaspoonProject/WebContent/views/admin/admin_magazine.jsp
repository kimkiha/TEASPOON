<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.board.model.vo.*,com.teaspoon.common.PageInfo "%>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String magazineKeyword = String.valueOf(request.getAttribute("magazineKeyword"));
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
    <title>매거진</title>
   
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table td{text-align:center}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb; text-align:center}
    </style>
</head>
<body>
    <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/매거진.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>매거진관리 페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                           <input type="text" placeholder="매거진제목" id="magazineKeyword">
                            <button type="button" class="searchBtn" id="searchBtn1">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table class="listArea" >
                            <thead>
                                <tr>
                                    <th width="100">글번호</th>
                                    <th width="300">제목</th>
                                    <th width="100">작성일</th>
                                    <th width="100">수정일</th>
                                    <th width="50">상태</th>
                                    <th >
                                        <button><a href="magazineInsertForm.bo">추가</a></button>
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
											<td><%=b.getCreateDate() %></td>
											<td><%=b.getModifyDate() %></td>
											<td class="status"><%=b.getStatus()%></td>
		                                    <td>
	                                        <button><a href="<%=contextPath%>/magazineUpdateForm.bo?bno=<%=b.getBoardNo()%>">수정</a></button>
	                                        <button><a href="<%=contextPath%>/magazineDelete.bo?bno=<%=b.getBoardNo()%>">삭제</a></button>
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
                    <!-- 현재 페이지에 보여질 페이징바 -->
                    <%if(!magazineKeyword.equals("null")){ %>
					<%if(currentPage != 1){%> 
					<!-- 현재 페이지가 1페이지가 아닐경우 -->
						<!-- 맨 처음으로(<<) -->
						<button onclick="location.href='magazineKeywordList.bo?currentPage=1&searchId=<%=magazineKeyword %>'">&lt;&lt;</button>
						<!-- 이전페이지로(<) -->
						<button onclick="location.href='magazineKeywordList.bo?currentPage=<%=currentPage-1%>&searchId=<%=magazineKeyword%>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='magazineKeywordList.bo?currentPage=<%=p%>&searchId=<%=magazineKeyword %>'"><%=p%></button>
						<%}else{ %>
						<button disabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
						<!-- 다음페이지로(<) -->
						<button onclick="location.href='magazineKeywordList.bo?currentPage=<%=currentPage+1%>&searchId=<%=magazineKeyword %>'">&gt;</button>
						<!-- 맨 마지막으로(>>) -->
						<button onclick="location.href='magazineKeywordList.bo?currentPage=<%=maxPage %>&searchId=<%=magazineKeyword %>'">&gt;&gt;</button>
					<%} %>
                    
                    
				<%} else { %>
					<!-- 현재 페이지에 보여질 페이징바 -->
					<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
						<!-- 맨 처음으로(<<) -->
						<button onclick="location.href='magazineList.bo?currentPage=1'">&lt;&lt;</button>
						<!-- 이전페이지로(<) -->
						<button onclick="location.href='magazineAdminList.bo?currentPage=<%=currentPage-1%>'">&lt;</button>
					<%} %>
					
					<%for(int p=startPage; p<=endPage; p++){%>
						<%if(currentPage != p) {%>
						<button onclick="location.href='magazineAdminList.bo?currentPage=<%=p%>'"><%=p%></button>
						<%}else{ %>
						<button disabled><%=p %></button>
						<%} %>	
					<%} %>
					
					<%if(currentPage != maxPage){ %>
						<!-- 다음페이지로(<) -->
						<button onclick="location.href='magazineAdminList.bo?currentPage=<%=currentPage+1%>'">&gt;</button>
						<!-- 맨 마지막으로(>>) -->
						<button onclick="location.href='magazineAdminList.bo?currentPage=<%=maxPage %>'">&gt;&gt;</button>
					<%} %>
					<%} %>
                </div>
               
               
            </div>
        </div>
        
        <script>
    	$(function(){
    		$("#searchBtn1").click(function(){
    			var magazineKeyword = $("#magazineKeyword").val();
    			location.href='magazineKeywordList.bo?magazineKeyword='+magazineKeyword+"&currentPage=1";
    		});
    	})
   		</script>
    
    
        <!--
    <script>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var bno = $(this).children().eq(0).text();
				location.href="<%=contextPath%>/MagazineUpdateForm.bo?bno=" + bno;
			});
		});
	</script> 
	  -->
</body>
</html>