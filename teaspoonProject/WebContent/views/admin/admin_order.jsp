<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.member.model.vo.*,com.teaspoon.common.PageInfo "%>
<%
	ArrayList<Orders> list = (ArrayList<Orders>)request.getAttribute("list");
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
    <title>주문관리  | Admin</title>
  
    <style>
        .dropdown button, #search{background-color: white; color:black; border: 1px solid lightgray; font-size: 15px; width: 100px; height: 40px; border-radius: 5px;}
        .dropdown button:hover, #search:hover{border-color:coral; background-color: lightcoral; color: white;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
        #c1_2 div{float: left;}
        #cancle:hover{background-color: white; border-color: lightgray;}
    </style>
</head>
<body>
    <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/주문현황.png" width="50px"></div>
                        <div id="c1_1_1_2"><p>주문현황페이지입니다.</p></div>
                        <div id="c1_1_1_3">
                            <input type="text" placeholder="주문자" name="idName">
                            <button type="button" class="searchBtn" id="btn">검색</button>
                        </div>
                    </div>
                    <div id="c1_1_2">
                            <!-- <div>
                                <button style=" width:415px; float:left; height: 50px; border-radius: 0px; font-size: 24px; font-weight: bold;">
                                    주문현황
                                </button>
                            </div>
                            <div>
                                <button id="cancle" disabled style="width:415px; float:left; color: darkgray; height: 50px; border-radius: 0px; font-size: 24px; font-weight: bold;">
                                    취소현황
                                </button>
                            </div> -->
                            
                            <div>
                                <table>
                                <tbody>
                                <tr>
                                <th>주문일자</th>
                                <th>주문번호</th>
                                <th>주문자</th>
                                <th>수령자</th>
                                <th>결제금액</th>
                                <th>배송상태</th>
                                <th>상세내역</th>

                                </tr>
                                </tbody>

                                <tfoot>
                                <%for(int i=0; i<list.size(); i++) {%>
                                <tr>
	                                <td><%=list.get(i).getOrderDate() %></td>
	                                <td><%=list.get(i).getOrderNo() %></td>
	                                <td><%=list.get(i).getOrderer() %></td>
	                                <td><%=list.get(i).getRecipient() %></td>
	                                <td><%=list.get(i).getPayment() %></td>
	                                <td><%if(list.get(i).getProgress()==0){%>
	                                	배송중
	                                <%}else{%>
	                                	구매완료
	                                <%} %>
	                                </td>
	                                <td>
		                                <button class='Pdetail' type="button" style="width: 100px;">
		                                    		상세보기
		                                </button>
	                                </td>
                                </tr>
                                <%} %>
                                </tfoot>
                                </table>
                            </div>
                    </div>
                </div>
                <div id="c1_2">
                    
                </div>
                <div id="c1_3">
                             <!-- 현재 페이지에 보여질 페이징바 -->
			<%if(currentPage != 1){%> <!-- 현재 페이지가 1페이지가 아닐경우 -->
			<!-- 맨 처음으로(<<) -->
			<button onclick="location.href='orderCondition.st?currentPage=1'">&lt;&lt;</button>
			<!-- 이전페이지로(<) -->
			<button onclick="location.href='orderCondition.st?currentPage=<%=currentPage-1%>'">&lt;</button>
			<%} %>
			
			<%for(int p=startPage; p<=endPage; p++){%>
				<%if(currentPage != p) {%>
				<button onclick="location.href='orderCondition.st?currentPage=<%=p%>'"><%=p%></button>
				<%}else{ %>
				<button disabled><%=p %></button>
				<%} %>	
			<%} %>
			
			<%if(currentPage != maxPage){ %>
			<!-- 다음페이지로(<) -->
			<button onclick="location.href='orderCondition.st?currentPage=<%=currentPage+1%>'">&gt;</button>
			<!-- 맨 마지막으로(>>) -->
			<button onclick="location.href='orderCondition.st?currentPage=<%=maxPage %>'">&gt;&gt;</button>
			<%} %>
      

                </div>
            </div>
               
            </div>
        </div>
    </div>
    <!--드롭다운버튼 스크립트-->
    <script>
        $(function(){
            //select의 값이 변경될때마다 작동
            $(".dm1>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
               // console.log(value);
                $(".btn1").text(value);
            });
            $(".dm2>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
                //console.log(value);
                $(".btn2").text(value);
            });
            $(".dm3>.dropdown-item").click(function(){
                
                //val("값") 이렇게 값을 넣으면 벨류값을 변경하고 val()이렇게 실행만할시 이미 들어있느 벨류값을 가져온다.
                value = $(this).text();
                //console.log(value);
                $(".btn3").text(value);
            });
        });
    </script>
    <!--드롭다운 버튼 스크립트 끝-->'
    
    <script>
    	$(function(){
    		$(".Pdetail").click(function(){
    			var orderNo = $(this).parent().parent().children().eq(1).text();
        		location.href='orderdetail.st?orderNo='+orderNo;
    			
    		})
        		
    	});
    	
    </script>
    
    
</body>
</html>