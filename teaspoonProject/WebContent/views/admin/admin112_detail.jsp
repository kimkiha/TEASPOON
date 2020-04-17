<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고</title>
   
    <style>
        table th{text-align: center;}
        .outer p{margin-top: 30px; margin-bottom: 30px; font-size: 30px; font-weight: bold;}        
        table *{padding: 5px; margin: auto; font-size: 18px;}
        table tr:first-child{border-top: 1px solid lightgray ;}
        table tr{border-bottom: 1px solid lightgray ;}
    </style>
</head>
<body>
     <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div class="outer">
                    <p>신고사유 상세보기</p>
                    
                    <table>
                        <tr>
                            <th width="150">신고번호</th>
                            <td>003</td>
                            <th>리뷰번호</th>
                            <td>001</td>
                        </tr>
                        <tr>
                            <th>신고한회원</th>
                            <td>user02</td>
                            <th>신고당한회원</th>
                            <td>user01</td>
                        </tr>
                      
                        <tr>
                            <th>회원명</th>
                            <td>아무개</td>
                            <th>연락처</th>
                            <td>010-5555-5555</td>
                        </tr>
                        <tr>
                            <th>최근신고일</th>
                            <td>2020.12.12</td>
                            <th>신고사유</th>
                            <td>악성댓글</td>
                        </tr>
                        <tr>
                            <th>신고당한<br>리뷰내용</th>
                            <td colspan="3"><textarea cols="70" rows="4" style="resize: none;" readonly></textarea></td>
                        </tr>
                        
                    </table>
                    <br>
                    
                    <div class="btns">
                        <button type="submit" style="width: 100px;"><a href="admin112.html">목록보기</a></button>
                    </div>
                </div>  
                   
            </div>
        </div>
    </div>  
</body>
</html>