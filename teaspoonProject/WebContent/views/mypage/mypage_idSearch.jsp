<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String randomKey = (String)request.getAttribute("randomKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 | TeaSpoon</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_idSearch.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/menubar.jsp" %>
		<!-- //header -->

		<!-- product -->
		<div id="content" class="contaniner">

			<center style="padding: 35px;">
				<p style="margin-top:100px;"></p>
				<p style="font-size: 36px; Line-height: 200%;">아이디찾기</p>
				<p style="font-size: 18px; color: rgb(85, 83, 83);">본인인증으로 아이디를
					찾을 수 있습니다.</p>
			</center>

			<div id="아이디찾기" class="tabcontent" id="id">
			  <center>
			  <form action="idSend.me" method="post">  
				<table style="padding-left:100px; padding-top:65px; padding-bottom:65px; margin-bottom:30px;" id="table1">
						<ul class=im1>
							<tr>
								<td style="font-size: 20px; width: 300px;"><li>이 메 일</li></td>
								<td style="text-align: left; width: 404px;">
								<input type="text" id="email" name="email" type="email" placeholder="가입시 입력한 이메일을 작성하세요."></td>
								<td style="width: 230px;">
								<!-- <input type="button" class="btn1" id="emailCheck" onclick="check_1();">이메일확인</button></td> -->
								<button type="button" class="btn1" id="emailCheck">회원이메일 확인</button></td>
							</tr>
					
							<tr>
								<td style="font-size: 20px;"></td>
								<td style= "text-align:left; font-size:15px;">* 회원가입시 작성한 이메일로 아이디 전송</td>
								<td style="font-size: 15px; color: rgb(131, 2, 2);">
								<!--  <button type="button" class="btn1" id="numCheck" disabled>아이디발송</button></td> -->
								<!-- "인증번호발송" 버튼은 기본값은 비활성화 -->
							</tr>
						</ul>
				</table>
			  </center>
			  	
					<input type="submit" class="btnenroll" id="numCheck" value="아이디발송" >
			
				</form>
			</div>
			</div>
		</div>
		</form>
		
	 <%@ include file="../common/footer.jsp" %>
		    	
		    	
	<script>
	
    	// '이메일확인'버튼을  클릭했을 때 (첫번째 버튼)
		// 1) 이메일 유효성검사 후 
		// 2) DB에서 이메일 중복확인
	
		$(function(){
			
			$("#emailCheck").click(function(){
				//function check_1(){
					
				// 이메일을 입력하는 input요소
				var email = $("#email").val();
				//var email = $("#idsearchForm input[name=email]");
				
				console.log(email);
				
				  var em = document.getElementById("email");
				  var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		            if(!emailRegExp.test(em.value)){
		                alert("유효한 이메일를 입력하세요!!");
		                form.em.value = "";
		                form.em.focus();
		                return false;               
		            }
				
			
				// 1. 이메일 중복검사(중복있을경우 성공)	
				$.ajax({
					url:"emailCheck.me",
					data:{email:email},
					type:"post", 
					success:function(result){	// 1 또는 0
						
						if(result != 0){		// DB에 조회된 이메일
							
							if(confirm("이메일이 조회되었습니다.")){
								
								// 아이디 더이상 수정이 불가하게끔
								$("#email").attr("readonly", "true");	// 이메일이 조회되면
								/// 인증번호 발송 버튼이 활성화 되어야함!!!
								$("#numCheck").removeAttr("disabled"); 
					
							}else{
								$("#email").forcus();
								
							}
							
						}else {					// DB에 조회되지않는 이메일
							
							alert("회원 이메일이 존재하지 않습니다."); 
							email.focus();
								
							
							}
					
						},error:function(){
							console.log("ajax통신 실패!!");
						}
				
				});
				
			});
			
		});
	
	</script>
    
     <script>
      	 /* (이메일) 아이디 발송 버튼 클릭시  (두번째버튼)*/ 
      	 
      	 $("#numCheck").click(function(){

           $.ajax({
        	   url:"idSend.me",
        	   data:{Email:email.value},
        	   success:function(data){
        		   alert("아이디가 발송되었습니다.");
        		   console.log(data);
        		   randomKey = data;
        	   },error:function(){
        		   alert("이메일발송실패");
        	   }
           })    
       
      	 });
    </script>
    	
	<script> // "인증번호 완료" 버튼 클릭시  (마지막버튼)
			//-> ramdom키(email.e에 있는)와 사용자입력키(identify)와 비교 
    	 function check(){
    		 
                var Identi = document.getElementById("identify");
    			
    			if(randomKey != Identi.value){
                	alert("인증에 실패하였습니다.");
                	randomKey = "";
                	Identi.focus();
                	return false;
              	}else{
              		alert("인증 성공하였습니다.");
    				// $("#enroll_final").click(); // enroll_final이라는 hidden폼 submit
    				//location.href ="<%= contextPath%>/idcomplete.me"; //페이지이동
    				

    				
              	}
       	 	}
    	
    	
    	</script>
    	 
		
		
		
		
		
		
		
</body>
</html>