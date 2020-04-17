<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰</title>
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
                            <td>111</td>
                            <th>상품번호</th>
                            <td>111</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>아무개</td>
                            <th>작성일</th>
                            <td>2010.12.12</td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3"><textarea cols="70" rows="4" style="resize: none;" readonly></textarea></td>
                        </tr>
                        
                    </table>
                    <br>
                    <div class="btns">
                        <button type="button" style="width: 100px;">
                            <a href="adminReview.html">목록으로</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>