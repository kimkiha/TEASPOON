<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>layout01</title>
   
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
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/신고.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>신고관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="아이디" name="idName">
                            <button type="button" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th colspan="2">회원번호</th>
                                    <th>신고당한회원아이디</th>
                                    <th>회원명</th>
                                    <th>연락처</th>
                                    <th>최근신고일</th>
                                    <th>신고누적</th>
                                    <th>상세사유</th>
                                    </tr>
                            </tbody>
                           
                              <tfoot>
                                  <tr>
                                      <td><input type="checkbox" name="userNo"></td>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>홍길동</td>
                                        <td>010-5555-2222</td>
                                        <td>2020.12.12</td>
                                        <td>3</td>
                                        <td>
                                            <button type="button" style="width: 100px;">
                                                <a href="admin112DetailView.html">사유보기</a></button>
                                        </td>
                                      </tr>
                              </tfoot>
                             
                     
                            </table>
                        </div>
                    </div>
                    <div id="c1_2" style="text-align: center;">
                        <p>선택한회원을 블랙리스트에 추가합니다 </p>
                        <button type="button" style="float: left;"> 추가 </button>
                        
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

