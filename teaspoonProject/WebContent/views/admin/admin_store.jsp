<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품</title>
   
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
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/커피.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>상품관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="제목" name="idName">
                            <button type="button" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>검색키워드</th>
                                    <th>공급가(원)</th>
                                    <th>판매가(원)</th>
                                    <th>상품옵션</th>
                                    <th>재고</th>
                                    <th>노출여부</th>
                                    <th><button type="button" style="width: 100px;">
                                        <a href="adminStoreEnrollForm.html">상품등록</a></button></th>
                                    </tr>
                            </tbody>
                           
                              <tfoot>
                                  <tr>
                                      <td>P0001</td>
                                      <td>블랙스트</td>
                                      <td>부드러운,무난한</td>
                                      <td>18,000</td>
                                      <td>18,000</td>
                                      <td>한정판매</td>
                                      <td>10</td>
                                      <td>Y</td>
                                      <td>
                                          <button type="button"><a href="adminStoreUpdateForm.html">수정</a></button>
                                          <button type="button">삭제</button>
                                        </td>
                                      </tr>
                                  
                              </tfoot>
                             
                      </table>
                    </div>
                </div>
                <div id="c1_2">

                </div>
                <div id="c1_3">
                        <a>&lt;</a>
                       <button>1</button>
                       <button>2</button>
                       <button>3</button>
                       <button>4</button>
                       <button>5</button>
                       <a>&gt;</a>
                </div>
            </div>
               
            </div>
        </div>
    </div>  
</body>
</html>