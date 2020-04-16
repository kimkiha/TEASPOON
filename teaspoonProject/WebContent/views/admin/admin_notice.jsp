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
                <div id="c1_1">
                    <div id="c1_1_1" >
                        <div id="c1_1_1_1"><img src="회원등급.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>공지사항관리 페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="아이디" name="idName">
                            <button type="button" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <thead>
                                <tr>
                                    <th>공지번호</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>조회수</th>
                                    <th>작성일</th>
                                    <th>수정일</th>
                                    <th>상태</th>
                                    <th>
                                        <button><a href="adminNoticeErollForm.html">추가</a></button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>공지1 제목입니다</td>
                                    <td>공지1 내용입니다</td>
                                    <td>10</td>
                                    <td>20.03.02</td>
                                    <td>20.03.02</td>
                                    <td>Y</td>
                                    <td>
                                        <button><a href="adminNoticeUpdateForm.html">수정</a></button>
                                        <button>삭제</button>
                                    </td>
                                    
                                </tr>
                            </tbody>
                             
                      </table>
                    </div>
                </div>
                <div id="c1_2"></div>
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