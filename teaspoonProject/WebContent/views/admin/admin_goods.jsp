<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
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
                <div id="c1_1" style="height: 420px;">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/비품.png" width="50px" width="50px"></div>
                        <div id="c1_1_1_2"><p>대관비품관리페이지입니다.</p></div>
                        <div id="c1_1_1_3"></div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th width="100">비품번호</th>
                                    <th>비품명</th>
                                    <th>단가</th>
                                    <th>비품수량</th>
                                    <th>예약수량</th>
                                    <th><button type="button" style="width: 100px;">비품등록</button></th>
                                </tr>
                            </tbody>
                           
                            <tfoot>
                                <tr>
                                    <td>1</td>
                                    <td>테이블</td>
                                    <td>20,000</td>
                                    <td>20</td>
                                    <td>6</td>
                                    <td>
                                        <button>수정</button>
                                        <button>삭제</button>
                                    </td>
                                </tr>
                                
                            </tfoot>
                        </table>
                    </div>
                </div>


                <div id="c1_2" style="height: 120px;">
                    <table>
                        <tbody>
                            <tr>
                                <th>비품번호</th>
                                <th>비품명</th>
                                <th>단가</th>
                                <th>비품총수량</th>
                                <th></th>
                            </tr>
                        </tbody>
                       
                        <tfoot>
                            <tr>
                                <td><input type="text" size="10" value="비품번호" disabled></td>
                                <td><input type="text" value="수정할비품명"></td>
                                <td><input type="text" value="수정할단가"></td>
                                <td><input type="text" value="비품수량"></td>
                                <td>
                                    <button type="button" style="width: 70px;">수정</button>
                                    <button type="reset" style="width: 70px;">취소</button>
                                </td>
                            </tr>
                        </tfoot>
                         
                  </table>
                </div>
               
               
            </div>
        </div>
    </div>  
</body>
</html>