<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰</title>

    
   
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
                                    <th>작성자</th>
                                    <th>작성일자</th>
                                    <th>내용</th>
                                    <th>상세보기</th>
                                </tr>
                            </tbody>
                           
                              <tfoot>
                                  <tr>
                                      <td>R0001</td>
                                      <td>케냐응다로이니</td>
                                      <td>USER01</td>
                                      <td>20.03.18</td>
                                      <td>맛있어요...</td>
                                     
                                      <td>
                                          <button type="button" style="width: 100px;">
                                              <a href="adminDtailReview.html">상세보기</a></button>
                                          <button type="button" style="width: 100px;">삭제</button>
                                        </td>
                                      </tr>
                                   
                                   
                              </tfoot>
                             
                      </table>
                    </div>
                </div>
                <div id="c1_2" >
                  
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
</body>
</html>