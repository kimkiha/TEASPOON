<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  

    <style>
        #addPage *{text-decoration: none; color: black;}
        #addPage *:hover{text-decoration: none; color: white;}
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
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/어바웃.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>어바웃티스푼 페이지입니다.</h3></div>
                        <div id="c1_1_1_3">
                             <input type="text" placeholder="키워드" name="keyword">
                            <button type="button" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2" >
                        <table>
                            <tbody>
                                 <tr>
                                     <th width="70">글번호</th>
                                    <th width="150">제목</th>
                                    <th width="70">조회수</th>
                                    <th width="90">작성일</th>
                                    <th width="90">수정일</th>
                                    <th width="70">상태</th>
                                    <th width="100">상세보기</th>
                                    <th>
                                        <button><a href="adminEventEnrollForm.html">추가</a></button>
                                    </th>
                                </tr>
                            </tbody>
                            
                            <tfoot>
                                <tr>
                                    <td>1</td>
                                    <td>Tea spoon이야기</td>
                                    <td>10</td>
                                    <td>20.02.12</td>
                                    <td>20.02.12</td>
                                    <td>Y</td>
                                    <td><button type="button">이동</button></td>
                                    <td>
                                        <button><a href="adminAboutUpdateForm.html">수정</a></button>
                                        <button>삭제</button>
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
</body>
</html>