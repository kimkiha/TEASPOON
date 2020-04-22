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
                                        <button id="btnInsert" type="button" style="width: 100px;" >등급추가</button>
                                    </th>
                                </tr>
                            </tbody>

                            <tfoot>
                     <%if(gList.isEmpty()){%>
				<tr>
					<td colspan="5">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{%>
					<%for(Grade g : gList){ %>
						<tr>
							<td><%=g.getGradeCode() %></td>
							<td><%=g.getGradeName() %></td>
							<td><%=g.getMinAcount() %></td>
							<td><%=g.getGradeRate() %></td>
							<td>
							<button type="button" id="btnUpdate">수정</button>
							<button type="button">삭제</button>
							</td>
							
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
                   <form  id="levelUpdateForm">
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
                                  <td><input type="text" value="수정할등급번호" disabled></td>
                                  <td><input type="text" placeholder="수정할등급명" required></td>
                                  <td><input type="number" placeholder="수정할최소금액" required></td>
                                  <td><input type="number" placeholder="수정할할인률" required></td>
                                  <td>
                                      <button type="submit"  style="width: 70px;">수정</button>
                                      <button type="reset"  style="width: 70px;">취소</button>
                                   </td>
                                  </tr>

                          </tfoot>
                         
                  </table>
                   </form>
                 
                </div>
               
               
            </div>
        </div>
    </div>  
    
    <script>
    	$(function(){
    		$("#btnInsert").click(function(){
    			$("#levelInsertForm").css("display","block");
    			$("#levelUpdateForm").css("display","none");
    		})
    		$("#btnUpdate").click(function(){
    			$("#levelUpdateForm").css("display","block");
    			$("#levelInsertForm").css("display","none");
    		})
    		
    	});
    	
    	$(function(){
    		$("#enroll").click(function(){
    			
    		
    			
    			
    			
    			var gradeCount = <%=gList.size()%>;
    			var gradeName = $("#gradeName").val();
    			var minMoney = $("#minMoney").val();
    			var discountRate = $("#discontRate").val();
				console.log(gradeName);
				
    			if(gradeName == ''){
    				alert("등급명을 입력하세요.");
    				
    			}else if(minMoney == ''){
    				alert("달성금액을 입력하세요.");
    				
    			}else if(discountRate == ''){
    				alert("할인률을 입력하세요.");
    				
    			}else if(gradeCount>=10){
    				alert("등급 10개 초과로 추가가 불가능합니다.");

    			}else if($("#minMoney").val() > <%=gList.get(gList.size()-1).getMinAcount()%>){
    				
    				
    			}else{
    				$("#levelInsertForm").submit();
    			}
    		});
    	});
    </script> 
    
  
</body>
</html>