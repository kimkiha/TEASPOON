<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쿠폰</title>
   
    <style>
     	.searchBtn:hover, #detailViewBtn:hover{border-color:#ac8b5a; background-color: #d6ae71; color: white;} 
        .dropdown button, #search{background-color: white; color:black; border: 1px solid lightgray; font-size: 15px; width: 140px; height: 40px; border-radius: 5px;}
        .dropdown button:hover, #search:hover{border-color:coral; background-color: lightcoral; color: white;}
        #c1_1_2 div{padding-left: 25px; float:left;}
        #oneToOneKinds input{margin-right: 5px; vertical-align: middle;}
        table tr{border-bottom: 1px solid lightgray;}
        table tr:first-child{border-top: 1px solid lightgray;}
        table th{background-color: #dbdbdb;}
        #c1_2 div{float: left;}
        #cuponInsertForm,#cuponUpdateForm{
        	display:none;
        }
    </style>
    
</head>
<body>
     <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" style="margin-top: 20px;">
                <div id="c1_1" style="height: 420px;">
                    <div id="c1_1_1">
                        <div id="c1_1_1_1"><img src="<%=contextPath%>/resources/img/admin/쿠폰.png" width="50px" width="50px"></div>
                        <div id="c1_1_1_2"><p>쿠폰관리페이지입니다.</p></div>
                        <div id="c1_1_1_3"></div>
                    </div>
                    <div id="c1_1_2">
                        <table>
                            <tbody>
                                <tr>
                                    <th>쿠폰번호</th>
                                    <th>쿠폰명</th>
                                    <th>할인금액</th>
                                    <th><button type="button"style="width: 100px;" id="btnInsert">쿠폰등록</button></th>
                                </tr>
                            </tbody>
                           
                            <tfoot>
                                <tr>
                                    <td>001</td>
                                    <td>1만원할인쿠폰</td>
                                    <td>10,000</td>
                                    <td>
                                        <button type="button" id="btnUpdate">수정</button>
                                        <button type="button">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>002</td>
                                    <td>3만원할인쿠폰</td>
                                    <td>30,000</td>
                                    <td>
                                        <button type="button">수정</button>
                                        <button type="button">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>003</td>
                                    <td>5만원할인쿠폰</td>
                                    <td>50,000</td>
                                    <td>
                                        <button type="button">수정</button>
                                        <button type="button">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>004</td>
                                    <td>10만원할인쿠폰</td>
                                    <td>100,000</td>
                                    <td>
                                        <button type="button">수정</button>
                                        <button type="button">삭제</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>


                <div id="c1_2" style="height: 120px;">
                                       <div class="dropdown"style="padding-right:10px">
                        <button type="button1" class="btn btn-primary dropdown-toggle btn1" data-toggle="dropdown">
                        쿠폰발급회원등급
                        </button>
                        <div class="dropdown-menu dm1">
                          <a class="dropdown-item" href="#">VIP회원에게</a>
                          <a class="dropdown-item" href="#">골드회원에게</a>
                          <a class="dropdown-item" href="#">실버회원에게</a>
                          <a class="dropdown-item" href="#">브론즈회원에게</a>
                        </div>
                      </div>
                      <div class="dropdown" style="padding-right:10px">
                        <button type="button2" class="btn btn-primary dropdown-toggle btn2" data-toggle="dropdown">
           	쿠폰선택
                        </button>
                        <div class="dropdown-menu dm2">
                          <a class="dropdown-item" href="#">1만원할인쿠폰</a>
                          <a class="dropdown-item" href="#">3만원할인쿠폰</a>
                          <a class="dropdown-item" href="#">5만원할인쿠폰</a>
                          <a class="dropdown-item" href="#">10만원할인쿠폰</a>
                        </div>
                      </div>
                      <div class="search">
                        <button type="button" id="search" >발송</button>
                      </div>
                         
                  </table>
                </div>
                <div id="c1_3">
                    <table id="cuponUpdateForm">
                        <tbody>
                            <tr>
                                <th>등급번호</th>
                                <th>등급명</th>
                                <th>할인금액</th>
                                <th></th>
                                
                            </tr>
                        </tbody>
                       
                        <tfoot>
                            <tr>
                                <td><input type="text" placeholder="선택한쿠폰번호" disabled></td>
                                <td><input type="text" placeholder="수정할쿠폰명"></td>
                                <td><input type="text" placeholder="수정할할인금액"></td>
                                <td>
                                    <button type="button" style="width: 70px;">수정</button>
                                    <button type="reset" style="width: 70px;">취소</button>
                                </td>
                            </tr>
                        </tfoot>
                        
                         <table id="cuponInsertForm">
                        <tbody>
                            <tr>
                                <th>등급번호</th>
                                <th>등급명</th>
                                <th>할인금액</th>
                                <th></th>
                                
                            </tr>
                        </tbody>
                       
                        <tfoot>
                            <tr>
                                <td><input type="text" placeholder="자동발생" disabled></td>
                                <td><input type="text" placeholder="등록할쿠폰명"></td>
                                <td><input type="text" placeholder="할인금액"></td>
                                <td>
                                    <button type="button" style="width: 70px;">등록</button>
                                    <button type="reset" style="width: 70px;">취소</button>
                                </td>
                            </tr>
                        </tfoot>
                </div>
            </div>
        </div>
    </div> 
    
    <script>
    	$(function(){
    		$("#btnInsert").click(function(){
    			$("#cuponInsertForm").css("display","block");
    			$("#cuponUpdateForm").css("display","none");
    		})
    		$("#btnUpdate").click(function(){
    			$("#cuponUpdateForm").css("display","block");
    			$("#cuponInsertForm").css("display","none");
    		})
    	});
    </script> 
</body>
</html>