<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기완료 | TeaSpoon</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_idSearch_complete.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <!-- //header -->

            <!-- product -->
            <div id="content" class="contaniner">
            
            <center style="padding:35px;">
            	<p style="margin-top:100px;"></p>
                <p style="font-size:30px; Line-height:200%;">비밀번호 찾기 완료</p>
                <hr style="color:gray; width:600px;">
                <p style="font-size:17px; color:rgb(85, 83, 83);  margin-left: 450px; text-align:left; margin-top:30px; margin-bottom: 30px;">비밀번호 찾기가 완료되었습니다.<br>
                <p style="font-size:12px; text-align:left; margin-left: 450px;"> 이메일로 비밀번호 발송요청 <br>
                    	고객님이 가입하실 때 입력하신 이메일로 비밀번호를 발송해 드립니다. <br>
                    	아래  비밀번호 발송 버튼을 선택해 주세요. <br>
                    	발송은 버튼을 클릭 후 이메일를 확인해 주시기 바랍니다. <br>
                		</p>                                      
            </center>
 
 

    <div id="비밀번호찾기 완료" class="tabcontent" style="margin-left: 300px;">

        <ul class=im1>
           
            <p style="font-size:20px; text-align:center;"><input type="text" id="userid" type="userid" placeholder="hong*@naver.com" style="text-align:center;" disabled></p>
          
            <center>
            <p style="font-size:15px; text-align:left; color:rgb(85, 83, 83); margin-left: 200px;">고객님의 개인정보 보호를 위해 이메일의 일부를 별표(*)로 표시 하였습니다.<br>
			</center>
            <button type="button" class="password2" onclick="password_change();">비밀번호 발송</button> 
 
            <button type="button" class="login" style="margin-bottom:110px;">로그인</button>
   
        </ul>   
    </div>


      <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
       
       
       
       
       
       
       
       
       
       
       
       
       
       
</body>
</html>