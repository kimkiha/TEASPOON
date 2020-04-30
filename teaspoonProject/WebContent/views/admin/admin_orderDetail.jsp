<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문관리  | Admin</title>
   
    <style>
        table * {padding: 10px; font-size: 18px;}
        table th{text-align: center;}
        .outer p{margin-top: 30px; margin-bottom: 30px; font-size: 30px; font-weight: bold;}        
        table *{padding: 5px; margin: auto;}
        table tr:first-child{border-top: 1px solid lightgray ;}
        table tr{border-bottom: 1px solid lightgray ;}
    </style>
</head>
<body>
     <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div class="outer">
                    
                    <p>주문 상세보기</p>
                    
                    <table>
                        <tr>
                            <th width="100">주문번호</th>
                            <td>003</td>
                            <th width="200">회원아이디</th>
                            <td>user01</td>
                        </tr>
                        <tr>
                            <th>주문인</th>
                            <td>박대광</td>
                            <th>주문자연락처</th>
                            <td>010-5252-8585</td>
                        </tr>
                        <tr>
                            <th>수령인</th>
                            <td>박아무개</td>
                            <th>수령인연락처</th>
                            <td>010-8888-8888</td>
                        </tr>
                        <tr>
                            <th >주문수량</th>
                            <td>3</td>
                            <th>결제금액</th>
                            <td>35000</td>
                        </tr>
                        <tr>
                            <th>배송지</th>
                            <td>서울특별시 광진구 군자오 444-55</td>
                            <th>요청사항</th>
                            <td>문앞에놓아주세요</td>
                        </tr>
                        <tr>
                            <th>총상품 종류</th>
                            <td  colspan="3">
                            <textarea cols="70" rows=4 readonly style="resize: none;">케냐1(200g,홀빈), 과테말라1(400g,핸드드립), 키위2(600g,커피메이커) 케냐1(200g,홀빈), 과테말라1(400g,핸드드립), 키위2(600g,커피메이커) 케냐1(200g,홀빈), 과테말라1(400g,핸드드립), 키위2(600g,커피메이커)
                            </textarea>
                        </td>
                           
                        </tr>
                        <tr>
                            <th>주문날짜</th>
                            <td>2020.12.12</td>
                            <th>진행상태</th>
                            <td>상품준비중</td>
                        </tr>
                       
                        
                    </table>
                    <br>
                    
                    <div class="btns">
                        <button type="submit" style="width: 100px;">
                            <a href="adminOder.html">목록보기</a>
                        </button>
                    </div>
                    
                   
                </div></div>
        </div>
    </div>  
</body>
</html>