<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1대1문의</title>
   
    <style>
        table * {padding: 10px; font-size: 18px;}
        table th{text-align: center;}
        .outer p{margin-top: 30px; margin-bottom: 30px; font-size: 30px; font-weight: bold;}        
        table *{padding: 5px; margin: auto;}
        table th{width: 100px;}
        table tr:first-child{border-top: 1px solid lightgray ;}
        table tr{border-bottom: 1px solid lightgray ;}
    </style>
</head>
<body>
     <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1">
                <div class="outer">
                    <p>답변 상세보기</p>
                    <table>
                        <tr>
                            <th width="100px">문의번호</th>
                            <td>111</td>
                            <th>상담유형</th>
                            <td>주문/결제</td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>상품을 주문했는데 포인트 쓰고싶어요.</td>
                            <th>상담신청일</th>
                            <td>2010.12.12</td>
                        </tr>
                        <tr>
                            <th>회원명</th>
                            <td>박대광</td>
                            <th>회원아이디</th>
                            <td>userId</td>
                        </tr>
                        <tr>
                            <th>답변내용</th>
                            <td colspan="3"><textarea cols="60" rows="5" style="resize:none" required></textarea></td>
                        </tr>
                        
                    </table>
                    <br>
                    <div class="btns" >
                        <button type="button" style="width: 100px;">
                            <a>목록으로</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>