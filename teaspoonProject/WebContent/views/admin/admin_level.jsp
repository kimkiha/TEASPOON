<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.member.model.vo.*,com.teaspoon.common.PageInfo "%>
<%
ArrayList<Grade> gList = (ArrayList<Grade>)request.getAttribute("gList");

%>
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
         #levelInsertForm,#levelUpdateForm{
        	display:none;
        }
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
                                    <th>최소달성금액</th>
                                    <th>등급별할인률</th>
                                    <th>
                                        <button id="btnInsertForm" type="button" style="width: 100px;" >등급추가</button>
                                    </th>
                                </tr>
                            </tbody>

                            <tfoot>
                     <%if(gList.isEmpty()){%>
				<tr>
					<td colspan="5">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{%>
					<%for(int i=0; i<gList.size();i++){ %>
						<tr class="grade<%=gList.get(i).getGradeCode() %>">
							<td><%=gList.get(i).getGradeCode() %></td>
							<td><%=gList.get(i).getGradeName() %></td>
							<td><%=gList.get(i).getMinAcount() %></td>
							<td><%=gList.get(i).getGradeRate() %></td>
							<%if(i==0){%>
							<td>
								기본 등급 수정불가
							</td>
							<%}else{ %>
							<td>
							<button type="button" class="btnUpdateForm">수정</button>
							<button type="button">삭제</button>
							</td>
							<%} %>
						</tr>
					<%} %>
				<%} %>
                               
                               
                               
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div id="c1_2" style="height: 120px;">
                	<form id="levelInsertForm" action="insertGrade.me" method="post">
                	 <table>
                        <tbody>
                            <tr>
                                <th>등급번호</th>
                                <th>등급명</th>
                                <th>최소달성금액</th>
                                <th>등급별할인률</th>
                                <th></th>
                                
                                </tr>
                        </tbody>
                       
                          <tfoot>
                              <tr>
                                  <td><input type="text" value="자동생성" disabled></td>
                                  <td><input type="text" id="gradeName" name="gradeName" placeholder="추가할등급명" required></td>
                                  <td><input type="number" id="minMoney" name="minMoney" placeholder="최소달성금액" required></td>
                                  <td><input type="number" id="discontRate" name="discontRate" placeholder="추가할할인률" required></td>
                                  <td>
                                   <button type="button"  style="width: 70px;" id="enroll" >등록</button>
                                   <button type="reset"  style="width: 70px;">취소</button>
                                   </td>
                                  </tr>

                          </tfoot>
                         
                  </table>
                	</form>
                   <form  id="levelUpdateForm" action="gradeUpdate.me" method="post">
                     <table>
                        <tbody>
                            <tr>
                                <th>등급번호</th>
                                <th>등급명</th>
                                <th>등급달성금액</th>
                                <th>등급별할인률</th>
                                <th></th>
                                
                                </tr>
                        </tbody>
                       
                          <tfoot>
                              <tr>
                                  <td><input type="text" id="gNo"  name="gNo" disabled></td>
                                  <td><input type="text" id="updateGradeName" name="updateGradeName" placeholder="수정할등급명" required></td>
                                  <td><input type="number" id="updateMinMoney" name="updateMinMoney" placeholder="수정할최소금액" required></td>
                                  <td><input type="number" id="updateDiscountRate" name="updateDiscountRate" placeholder="수정할할인률" required></td>
                                  <td>
                                  
                                      <button type="button" id="btnUpdate" style="width: 70px;">수정</button>
                                      <button type="reset"  style="width: 70px;">취소</button>
                                   </td>
                                   <input id ="nextG" type="hidden" class="nextG" >
                                  </tr>

                          </tfoot>
                         
                  </table>
                   </form>
                 
                </div>
               
               
            </div>
        </div>
    </div>  
    <form id="maxGradeForm" action="<%=contextPath%>/maxGradeInsert.me" method="post">
		<input type="hidden" id="maxGradeName" name="maxGradeName">
		<input type="hidden" id="maxMinMoney" name="maxMinMoney">
		<input type="hidden" id="maxDiscountRate" name="maxDiscountRate">
	</form>
    <script>
    	$(function(){
    		$("#btnInsertForm").click(function(){
    			$("#levelInsertForm").css("display","block");
    			$("#levelUpdateForm").css("display","none");
    		})
    		$(".btnUpdateForm").click(function(){
    			$("#levelUpdateForm").css("display","block");
    			$("#levelInsertForm").css("display","none");
    			
    			var gNo = $(this).parent().parent().children().eq(0).text();
                var updateGradeName =$(this).parent().parent().children().eq(1).text();
                var updateMinMoney =$(this).parent().parent().children().eq(2).text();
                var updateDiscountRate =$(this).parent().parent().children().eq(3).text();
    			$("#gNo").val(gNo);
    			$("#updateGradeName").val(updateGradeName);
    			$("#updateMinMoney").val(updateMinMoney);
    			$("#updateDiscountRate").val(updateDiscountRate);
    			
    			
    		})
    		
    	});
    	
    	$(function(){
    		$("#enroll").click(function(){
    			var gradeCount = <%=gList.size()%>;
    			var gradeName = $("#gradeName").val();
    			var minMoney = $("#minMoney").val();
    			var discountRate = $("#discontRate").val();
				
				
    			if(gradeName == ''){
    				alert("등급명을 입력하세요.");
    				
    			}else if(minMoney == ''){
    				alert("달성금액을 입력하세요.");
    				
    			}else if(discountRate == ''){
    				alert("할인률을 입력하세요.");
    				
    			}else if(gradeCount>=10){
    				alert("등급 10개 초과로 추가가 불가능합니다.");

    			}else if($("#minMoney").val() > <%=gList.get(gList.size()-1).getMinAcount()%>){
    				$("#maxGradeName").val(gradeName);
    				$("#maxMinMoney").val(minMoney);
    				$("#maxDiscountRate").val(discountRate);
    				
    				$("#maxGradeForm").submit();
    			}else{
    				$("#levelInsertForm").submit();
    			}
    		});
    	});
    </script> 
    
    <script>
    	$(function(){
    		$("#btnUpdate").click(function(){
    			var gNo = $("#gNo").val();
    			var updateMinMoney = $('#updateMinMoney').val();
    			var updateDiscountRate =$("#updateDiscountRate").val();
    			
    			var prevGno= '.grade'+(gNo-10);
    			var prevGradeMinMoney = $('.grade'+(Number(gNo)-10)).children().eq(2).text();
    			var prevGradeDiscountGrade = $('.grade'+(Number(gNo)-10)).children().eq(3).text();
    		
    			
    			var nextGno= '.grade'+(gNo+10);
    			var nextGradeMinMoney = $('.grade'+(Number(gNo)+10)).children().eq(2).text();
    			var nextGradeDiscountGrade = $('.grade'+(Number(gNo)+10)).children().eq(3).text();
    			
    			//console.log(updateDiscountRate);
    			//console.log(nextGradeDiscountGrade);
    	
    			if(Number(updateMinMoney) >=Number(nextGradeMinMoney)){
    				alert("상위 등급보다 달성금액이 크거나 같을 수 없습니다.");
    			}else if(Number(updateMinMoney) <=Number(prevGradeMinMoney)){
    				alert("하위 등급보다 달성금액이 작거나 같을 수 없습니다.");
    			}else if(Number(updateDiscountRate)<= Number(prevGradeDiscountGrade)){
    				alert("상위 등급보다 할인률이 크거나 같을 수 없습니다.");
    			}else if(Number(updateDiscountRate)>= Number(nextGradeDiscountGrade)){
    				alert("하위 등급보다 할인률이 작거나 같을 수 없습니다.");
    			}
    			
    			
    		});
    	});
    </script>
    
 
  
</body>
</html>