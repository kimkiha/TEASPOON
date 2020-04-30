<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.store.model.vo.* , com.teaspoon.common.*"%>
<%
	Review r = (Review)request.getAttribute("r");
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰관리  | Admin</title>
    <style>
        .outer p{margin-top: 30px; margin-bottom: 30px; font-size: 30px; font-weight: bold;}        
        table *{padding: 5px; margin: auto; font-size: 18px;}
        table th{width: 100px; text-align: center;}
        table tr:first-child{border-top: 1px solid lightgray ;}
        table tr{border-bottom: 1px solid lightgray ;}
    </style>
</head>
<body>
  <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div class="outer">
                    <p>리뷰 상세보기</p>
                    <table>
                        <tr>
                            <th width="100px">리뷰번호</th>
                            <td><%=r.getReviewNo()%></td>
                            <th width="100px">상품명</th>
                            <td><%=r.getPname() %></td>
                        </tr>
                        <tr>
                            <th>작성자(작성자ID)</th>
                            <td><%=r.getUserName() %>(<%=r.getUserId() %>)</td>
                            <th>작성일자</th>
                            <td><%=r.getCreateDate() %></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3"><textarea cols="70" rows="4" style="resize: none;" readonly><%=r.getContent() %></textarea></td>
                        </tr>
                        
                    </table>
                    <br>
                    <div class="btns">
                        <button onclick="history.back();" style="width:100px;'">목록으로</button>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>