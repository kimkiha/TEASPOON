<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원등급</title>
   
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
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/회원등급.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>회원등급관리페이지입니다.</p></div>
                        <div id="c1_1_1_3"></div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th>등급번호</th>
                                    <th>등급명</th>
                                    <th>등급달성금액</th>
                                    <th>
                                        <button type="button" style="width: 100px;">등급추가</button>
                                    </th>
                                </tr>
                            </tbody>

                            <tfoot>
                                <tr>
                                    <td>001</td>
                                    <td>VIP</td>
                                    <td>100만원이상</td>

                                    <td>
                                        <button type="button">수정</button>
                                        <button type="button">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>002</td>
                                    <td>골드</td>
                                    <td>70만원이상</td>

                                    <td>
                                        <button type="button">수정</button>
                                        <button type="button">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>003</td>
                                    <td>실버</td>
                                    <td>50만원이상</td>

                                    <td>
                                        <button type="button">수정</button>
                                        <button type="button">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>004</td>
                                    <td>브론즈</td>
                                    <td>30만원이상</td>

                                    <td>
                                        <button type="button">수정</button>
                                        <button type="button">삭제</button>
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
                                <th>등급번호</th>
                                <th>등급명</th>
                                <th>등급달성금액</th>
                                <th></th>
                                
                                </tr>
                        </tbody>
                       
                          <tfoot>
                              <tr>
                                  <td><input type="text" value="수정할등급번호" disabled></td>
                                  <td><input type="text" value="수정할등급명"></td>
                                  <td><input type="text" value="수정할달성금액"></td>
                                
                                  <td>
                                      <button type="button"  style="width: 70px;">수정</button>
                                      <button type="reset"  style="width: 70px;">취소</button>
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