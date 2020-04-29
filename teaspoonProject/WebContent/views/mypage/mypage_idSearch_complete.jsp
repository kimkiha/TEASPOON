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
    <script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>

        <!-- //header -->

            <!-- product -->
            <div id="content" class="contaniner">
            
            <div id="content1" class="contaniner1" style="margin:0 auto; height:700px;">
           
            <p style="margin-top:200px;">
            	<p1 style="margin-top:100px;"></p1>
                <p2 style="font-size:30px; text-align:center; margin-top:40px; margin-bttom:40px;" >아이디찾기완료</p2> <br>
                <p3 style="font-size:15px; color:rgb(85, 83, 83); text-align:center; margin-top:40px; margin-bttom:40px;">아이디 찾기가 완료되었습니다.<br></p2>
                                                                    고객님의 개인정보 보호를 위해 아이디 일부를 별표(*)로 표시하겠습니다.</p3>
            </p>
 		

   			 <div id="아이디찾기" class="tabcontent">

       			 <ul class="im1">
           
            		<p style="font-size:20px; text-align:center; margin-top:40px; margin-bttom:40px;"><input type="text" id="userid" type="userid" placeholder="<%=loginUser.getUserName() %>"style="text-align:center;" disabled></p>
          
           		 	<button type="button" class="login" style="margin-top:20px; margin-bttom:20px;">로그인</button> 
            
     				<div id="id" style="margin-left:200px; margin-right:200px;">
     				
            	
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