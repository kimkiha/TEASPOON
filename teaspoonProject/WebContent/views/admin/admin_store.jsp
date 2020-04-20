<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*"%>
<%
	ArrayList<Product> list =  (ArrayList<Product>)request.getAttribute("list");
	System.out.println(list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품목록 전체보기</title>
   
    <style>
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
        table td{height:50px;}
    </style>
</head>
<body>
     <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="" width="50px"></div>
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
                                    <th style="width:50px;">상품번호</th>
                                    <th style="width:170px;">상품명</th>
                                    <th style="width:60px;">공급가</th>
                                    <th style="width:60px;">가격</th>
                                    <th style="width:50px;">재고</th>
                                    <th style="width:50px;">진열상태</th>
                                    <th style="width:170px;">키워드</th>
                                    <th style="width:50px;">누적판매</th>
                                    <th style="width:50px;">상품종류</th>
                                    <th><button type="button" style="width: 100px;">
                                        <a href="<%=contextPath%>/enroll.st">상품등록</a></button></th>
                                    </tr>
                            </tbody>
                           
                              <tfoot>
                              <%for(Product p : list){ %>
                                  <tr>
                                      <td><%=p.getPcode()%></td>
                                      <td><%=p.getPname() %></td>
                                      <td><%=p.getSupPrice() %></td>
                                      <td><%=p.getPrice() %></td>
                                      <td><%=p.getStock() %></td>
                                      <td><%=p.getStatus() %></td>
                                      <td><%=p.getKeyword() %></td>
                                      <td><%=p.getTotalCount() %></td>
                                      <td><%=p.getKind() %></td>
                                      <td>
                                          <button type="button"><a href="adminStoreUpdateForm.html">수정</a></button>
                                          <button type="button">삭제</button>
                                        </td>
                                      </tr>
                                  <%} %>
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