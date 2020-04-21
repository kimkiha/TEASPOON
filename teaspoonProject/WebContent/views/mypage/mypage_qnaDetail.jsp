<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.member.model.vo.*, com.teaspoon.board.model.vo.*"%>
<%
	MenToMen m = (MenToMen)request.getAttribute("m");
	Attachment at =(Attachment)request.getAttribute("at");


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
                                        <td width="60" name="username">홍길동</td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" >골드등급</td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="#" >회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" >500Point</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" >3장</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" >10개</a>
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
                                                <td width="900" id="opt">
                                                    <span>
                                                        <label for="opt1"> <input type="radio"id="opt1"name="qna" checked>주문/결제
                                                        </label>
                                                    </span>    
                                                    <span>
                                                        <label for="opt2">
                                                        <input type="radio" id="opt2"name="qna">배송
                                                        </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt3">
                                                        <input type="radio" id="opt3"name="qna">이벤트/쿠폰
                                                        </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt4">
                                                        <input type="radio"id="opt4"name="qna">환불/반품/교환
                                                        </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt5">
                                                        <input type="radio"id="opt5"name="qna">회원/포인트
                                                       </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt6">
                                                        <input type="radio"id="opt6"name="qna">사이트이용/기타
                                                        </label>
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
                                        </div>
                                        <%if(at != null){ //첨부파일이 존재할 경우 %>
                                        <div></div><a href="<%=contextPath %>/resources/thumbnail_upfiles/<%=at.getChangeName()%>"><%= at.getOriginName() %></a></div>
                                        <% }else{ %>
                                        	첨부파일이 없습니다
                                        <% }%>
                                        <div class="func">
                                            <button class="btn btn-cancel">뒤로가기</button>
                                           
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