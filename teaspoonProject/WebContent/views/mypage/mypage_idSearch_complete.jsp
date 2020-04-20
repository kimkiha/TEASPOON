<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 완료 | TeaSpoon </title>
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
            
            <div id="content1" class="contaniner1" style="margin:0 auto; ">
           
            <center style="margin-top:150px;">
            	<p1 style="margin-top:100px;"></p1>
                <p2 style="font-size:30px; text-align:center;" >아이디찾기완료</p2> <br>
                <p3 style="font-size:15px; color:rgb(85, 83, 83); text-align:center; margin-bottom:30px;">아이디 찾기가 완료되었습니다.<br></p2>
                                                                    고객님의 개인정보 보호를 위해 아이디 일부를 별표(*)로 표시하겠습니다.</p3>
            </center>
 		

   			 <div id="아이디찾기" class="tabcontent">

       			 <ul class="im1">
           
            		<p style="font-size:20px; text-align:center;"><input type="text" id="userid" type="userid" placeholder="hong*****" style="text-align:center;"></p>
          
           		 	<button type="button" class="login">로그인</button> 
            
     				<div id="id" style="margin-left:200px; margin-right:200px;">
     				
            		<p style="font-size:18px; text-align:left; Line-height:200%; ">아이디발송</p>
            		<p style="float:left; font-size:15px; text-align:left; color:rgb(85, 83, 83); ">
            				고객님이 가입하실 때 입력하신 이메일로 아이디를 발송해 드립니다. <br>
                                                                            아래 발송 요청 버튼을 선택해 주세요. </p>
       				</div>
  
            		<button type="button" class="userid_request" onclick="request();">아이디 발송 요청</button>
   
        		</ul>
        	</div>
        </div>
    

            <!--product-->
            <script>
                state=0;
                function request() {
                   if(state==0){
                        state=1;
                        window.confirm("이메일 발송이 완료되었습니다.");
                   } 
                }
       
            </script>


      <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
    <!-- //footer-->
</body>
</html>