<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.space.model.vo.*,com.teaspoon.common.PageInfo "%>
<%

ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대관</title>

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
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/대관.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>대관예약관리페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="" name="idName">
                            <button type="button" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <thead>
                                <tr>
                                    <th>예약번호</th>
                                    <th>날짜</th>
                                    <th>시간</th>
                                    <!--예약은 로그인한 회원만 가능하며 예약자명과 연락처는 회원번호로 불러옴-->
                                    <th>예약자</th>
                                    <th>연락처</th>
                                    <th>인원수</th>
                                    <th>사용목적</th>
                                    <th width="100px">비품요청</th>
                                    <th>결제금액</th>
                                    <th>승인여부</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>20.04.03</td>
                                    <td>14:00-16:00</td>
                                    <!--예약은 로그인한 회원만 가능하며 예약자명과 연락처는 회원번호로 불러옴-->
                                    <td>홍길동</td>
                                    <td>010-1111-2222</td>
                                    <td>6</td>
                                    <td>회의하려고 사용하려고합니다아아아아아아아아아</td>
                                    <td>모니터1,화이트보드2,책상6,의자6</td>
                                    <td>56,000</td>
                                    <td>
                                        <button>거절</button>
                                        <button>승인</button>
                                    </td>
                                    
                                </tr>
                            </tbody>
                             
                      </table>
                    </div>
                </div>
                <div id="c1_2">

                </div>
                <div id="c1_3">
                        	           <!-- 현재 페이지에 보여질 페이징바 -->
			<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
			<!-- 맨 처음으로(<<) -->
			<button onclick="location.href='Spacelist.sp?currentPage=1'">&lt;&lt;</button>
			<!-- 이전페이지로(<) -->
			<button onclick="location.href='Spacelist.sp?currentPage=<%=currentPage-1%>'">&lt;</button>
			<%} %>
			
			<%for(int p=startPage; p<=endPage; p++){%>
				<%if(currentPage != p) {%>
				<button onclick="location.href='Spacelist.sp?currentPage=<%=p%>'"><%=p%></button>
				<%}else{ %>
				<button disabled><%=p %></button>
				<%} %>	
			<%} %>
			
			<%if(currentPage != maxPage){ %>
			<!-- 다음페이지로(<) -->
			<button onclick="location.href='Spacelist.sp?currentPage=<%=currentPage+1%>'">&gt;</button>
			<!-- 맨 마지막으로(>>) -->
			<button onclick="location.href='Spacelist.sp?currentPage=<%=maxPage %>'">&gt;&gt;</button>
			<%} %>
                </div>
               
               
            </div>
        </div>












        
    </div>  
</body>
</html>