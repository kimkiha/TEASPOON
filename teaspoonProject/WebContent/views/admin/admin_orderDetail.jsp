<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.member.model.vo.*"%>
<% 

	Orders or =	(Orders)request.getAttribute("or");
	//System.out.print(or);

%>
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
                            <td><%=or.getOrderNo() %></td>
                            <th width="200">회원번호</th>
                            <td><%=or.getUserNo() %></td>
                        </tr>
                        <tr>
                            <th>주문인</th>
                            <td><%=or.getOrderer() %></td>
                            <th>주문자연락처</th>
                            <td><%=or.getOrdererPhone() %></td>
                        </tr>
                        <tr>
                            <th>수령인</th>
                            <td><%=or.getRecipient() %></td>
                            <th>수령인연락처</th>
                            <td><%=or.getRecipientPhone() %></td>
                        </tr>
                        <tr>
                            <th >배송비</th>
                            <td><%=or.getShippingFee() %></td>
                            <th>결제금액</th>
                            <td><%=or.getPayment() %></td>
                        </tr>
                        <tr>
                            <th>배송지</th>
                            <td><%=or.getRecipientAddress() %></td>
                            <th>요청사항</th>
                            <td><%=or.getOrderMessage() %></td>
                        </tr>
                        <tr>
                            <th>총상품 종류</th>
                            <td  colspan="3">
                            <textarea cols="70" rows=4 readonly style="resize: none;"><%=or.getProductInfo() %></textarea>
                        </td>
                           
                        </tr>
                        <tr>
                            <th>주문날짜</th>
                            <td><%=or.getOrderDate() %></td>
                            <th>진행상태</th>
                            <td><%=or.getProgress() %></td>
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