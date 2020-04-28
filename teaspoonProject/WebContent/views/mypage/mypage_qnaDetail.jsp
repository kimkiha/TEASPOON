<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.member.model.vo.*, com.teaspoon.board.model.vo.*"%>
<%
	MenToMen m = (MenToMen)request.getAttribute("m");
	Attachment at =(Attachment)request.getAttribute("at");
	
	String mtmType = String.valueOf(m.getMtmType());
	String[] checked = new String[6];
	
	switch(mtmType){
	case "10" : checked[0] = "checked" ; break;
	case "20" : checked[1] = "checked" ; break;
	case "30" : checked[2] = "checked" ; break;
	case "40" : checked[3] = "checked" ; break;
	case "50" : checked[4] = "checked" ; break;
	case "60" : checked[5] = "checked" ; break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="reset.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_qnaDetail.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner {height: 170px; line-height: 170px; background:url("패턴 - 복사본.jpg") center top repeat-x;}
    </style>
</head>
<body>
<div id="wrap">
        
		<%@ include file="../common/menubar.jsp" %>
        <!-- //header -->
        <div id="banner">
            <div class="contaniner title">마이페이지</div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- mypage -->
                <div class="contaniner">
                    <div id="mypage">
                        <div id="mypage_info">
                            <div class="user_info" style="width:95px; border-left:1px solid #bebbb6">
                                <div class="user_photo" style="margin-top:30px; padding-left:10px; float: left;">
                                    <img src="사이트이미지/user.png">
                                </div>
                            </div>
                            <div class="user_info" style="width:450px;">
                                <table class="detail_tb" cellpadding="0" cellspacing="0"  >
                                    <tr class="d1">
                                        <td width="60" name="username"><%=loginUser.getUserName() %></td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" ><%=loginUser.getGradeName()%></td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" ><%=loginUser.getPointPrice()%></a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" ><%=loginUser.getCount() %></a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" ><%=loginUser.getPcode()%></a>
                            </div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="#" class=" float"> 주문배송조회</a>
                            <a href="#" class=" float">공간대여확인</a>
                            <a href="#" class=" float">나의배송지</a>
                            <a href="#" class="active float">1:1문의</a>
                            <a href="#" class="float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>
                        <div id="mp_con1">
                            <div class="mp-qna">
                               <div class="mp-qna-title"><P>1:1문의 내역</P></div>
                               <div class="outer" align="center">
                                    <form action="" method="post">
                                        <table align="center" id="mypage_table">
                                            <tr >
                                                <th width="170">상담구분</th>
                                                <td width="900" id="opt" name="mtmType">
                                                     <span>
                                                        <input type="radio"id="opt1"name="mtmType"value="10" <%=checked[0] %>>주문/결제
                                                        <label for="opt1"></label>
                                                    </span>    
                                                    <span>
                                                        <input type="radio" id="opt2"name="mtmType"value="20" <%=checked[1] %>>배송
                                                        <label for="opt2"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio" id="opt3"name="mtmType"value="30" <%=checked[2] %>>이벤트/쿠폰
                                                        <label for="opt3"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio"id="opt4"name="mtmType"value="40" <%=checked[3] %>>환불/반품/교환
                                                        <label for="opt4"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio"id="opt5"name="mtmType"value="50" <%=checked[4] %>>회원/포인트
                                                        <label for="opt5"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio"id="opt6"name="mtmType"value="60" <%=checked[5] %>>사이트이용/기타
                                                        <label for="opt6"></label>
                                                    </span>
                                                 </td>   
                                            </tr>
                                            <tr>
                                                <th>제목</th>
                                                <td> <%=m.getMtmTitle() %></td>
                                            </tr>
                                        </table>
                                        <div class="mp-qna-body">
                                            <div id="textarea">
                                                <%= m.getMtmContent() %>
                                            </div>
                                            <%if(m.getReComment() != null) {%>
                                            <div id="textarea">
                                            	<%= m.getReComment() %>
                                            </div>
                                            <%} %>
                                        </div>
                                        <%if(at != null){ //첨부파일이 존재할 경우 %>
                                        <div></div><a href="<%=contextPath %>/resources/thumbnail_upfiles/<%=at.getChangeName()%>"><%= at.getOriginName() %></a></div>
                                        <% }else{ %>
                                        	첨부파일이 없습니다
                                        <% }%>
                                        <div class="func">
                                            <button class="btn btn-cancel" onclick="history.back();">뒤로가기</button>
                                           
                                        </div>
                                    </form> 
                                    <br><br>
                                    

                               </div>    
                             
                            </div>

                           
                                
                        </div>
                    </div>
                </div>
        </div>
        
        <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
</body>
</html>