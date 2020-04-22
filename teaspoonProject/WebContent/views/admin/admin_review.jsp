<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*, com.teaspoon.common.*"%>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
    <title>리뷰관리 | Admin</title>
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
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/리뷰.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>리뷰관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="제목" name="idName">
                            <button type="button" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th>리뷰번호</th>
                                    <th>상품명</th>
                                    <th>작성자ID</th>
                                    <th>작성일자</th>
                                    <th>내용</th>
                                    <th>상세보기</th>
                                </tr>
                            </tbody>
                           
                              <tfoot>
                              
                              <% for (Review r : list) {%>
                                  <tr>
                                      <td><%=r.getReviewNo() %></td>
                                      <td><%=r.getPname() %></td>
                                      <td><%=r.getUserId() %></td>
                                      <td><%=r.getCreateDate() %></td>
                                      <td><%=r.getContent() %></td>
                                     
                                      <td>
                                          <button type="button" style="width: 100px;">
                                              <a href="adminDtailReview.html">상세보기</a></button>
                                          <button type="button" style="width: 100px;">삭제</button>
                                        </td>
                                      </tr>
                                   <%} %>
                                   
                              </tfoot>
                             
                      </table>
                    </div>
                </div>
                <div id="c1_2" >
                  
                </div>
                <div id="c1_3">
                 <!-- 현재 페이지에 보여질 페이징바 -->
				<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
				<!-- 맨 처음으로(<<) -->
				<button onclick="location.href='list.st?currentPage=1'">&lt;&lt;</button>
				<!-- 이전페이지로(<) -->
				<button onclick="location.href='list.st?currentPage=<%=currentPage-1%>'">&lt;</button>
				<%} %>
				
				<%for(int p=startPage; p<=endPage; p++){%>
					<%if(currentPage != p) {%>
					<button onclick="location.href='list.st?currentPage=<%=p%>'"><%=p%></button>
					<%}else{ %>
					<button dispabled><%=p %></button>
					<%} %>	
				<%} %>
				
				<%if(currentPage != maxPage){ %>
				<!-- 다음페이지로(<) -->
				<button onclick="location.href='list.st?currentPage=<%=currentPage+1%>'">&gt;</button>
				<!-- 맨 마지막으로(>>) -->
				<button onclick="location.href='list.st?currentPage=<%=maxPage %>'">&gt;&gt;</button>
				<%} %>

                </div>
               
               
            </div>
        </div>
    </div>  
</body>
</html>