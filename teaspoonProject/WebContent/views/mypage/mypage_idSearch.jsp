<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<!--
            <div id="아이디찾기" class="tabcontent">
                <form id="enrollmodify">
                    <fieldset style="list-style-type:disc; padding-right:100px;" id=ul>
                        <ul style="border:0.3 solid lightgrey; height:180px; width:600px"><br>
                           
                            <li>이&nbsp;&nbsp;메&nbsp;&nbsp;일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="enroll" type="email" placeholder="가입시 입력한 이메일로 발송됩니다."  style=width:300px; disabled> </li><br><br>
                            <li>비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="enroll" type="password" placeholder="비밀번호는 6~ 16자 영문 대소문자, 특수문자 중"> </li>

                            </fieldset> 
                            </form>
                         </ul>
                    </form>
                    <button type="button" class="btnenroll">인증완료</button>
                </div>
-->

			<div id="아이디찾기" class="tabcontent">
			  <center>
				<table style="padding-left:100px; padding-top:65px; padding-bottom:65px;" id="table1">
						<ul class=im1>
							<tr>
								<td style="font-size: 20px; width: 300px;"><li>이 메 일</li></td>
								<td style="text-align: left; width: 404px;">
								<input type="text" id="email" type="email"
									placeholder="가입시 입력한 이메일을 작성하세요."></td>
								<td style="width: 230px;">
								<button type="button" class="btn1" id="emailCheck">인증번호발송</button></td>
							</tr>
					
							<tr>
								<td style="font-size: 20px;"><li>인증번호확인</li></td>
								<td><input type="number" id="verification" type="verification" placeholder="인증번호"></td>
								<td style="font-size: 15px; color: rgb(131, 2, 2);"></td>
							</tr>
						</ul>
				</table>
			  </center>
				<button type="button" class="btnenroll">인증완료</button>
			</div>

		</div>
		<!-- //content-->
		  <%@ include file="../common/footer.jsp" %>
		    	<script>
	
		$(function(){
			
			// '(이메일)인증번호 발송'버튼을  클릭했을 때
			$("#emailCheck").click(function(){
				  var id = document.getElementById("email");
				  var regExp = /^[a-z][a-z\d]{3,11}$/i;
		            if(!regExp.test(id.value)){
		                alert("유효한 이메일를 입력하세요!!");
		                id.value = "";
		                id.focus();
		                return false;               
		            }
				// 이메일을 입력하는 input요소
				var email = $("#email").val();
				
				$.ajax({
					url:"emailCheck.me",
					data:{email:email},
					type:"post", 
					success:function(result){	// 1 또는 0
						
						if(result == 1){		// 사용가능한 아이디
							
							if(confirm("인증번호를 메일로 발송하였습니다.")){
							
						}else {				
							
							alert("회원 이메일이 없습니다.");
							UserId.focus();
							
						}
						
					},error:function(){
						console.log("ajax통신 실패!!");
					}
					
				
				});
				
			});
			
		});
	
	</script>
    	
    	
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		
		 <script> /* "인증번호 완료" 버튼 클릭시 -> ramdom키와 사용자입력키(identify)와 비교 */
    	 function check(){
                	
                var Identi = document.getElementById("identify");
                
                
    			var username = $("#userName").val();
    			var Birthday = $("#birthday").val();
    		
    			var firstnumber = $("#firstnumber").val();
    			var phonenum = $("#verification").val();
    			var UserId = $("#userId").val();
    			var UserPwd = $("#userPwd1").val();
    			var email = $("#email").val();
    			
    			console.log(username);
    			if(randomKey != Identi.value){
                	alert("인증에 실패하였습니다.");
                	randomKey = "";
                	Identi.focus();
                	return false;
              	}else{
              		alert("인증 성공하였습니다.");
    				//$("#defaultOpen4").removeAttr("disabled").click();
              		var genderArray = document.getElementsByName("gender");
                    
                    for(var i=0; i<genderArray.length; i++){
          
                        if(genderArray[i].checked){
                          $("#gender2").val(genderArray[i].value);
                        }
                    }
    				$("#userName2").val(username);
    				$("#birthday2").val(Birthday);
    				$("#firstnumber2").val(firstnumber);
    				$("#verification2").val(phonenum);
    				$("#userId2").val(UserId);
    				$("#userPwd12").val(UserPwd);
    				$("#email2").val(email);
    				
    				$("#enroll_final").submit(); // enroll_final이라는 hidden폼 submit
    				
    				
              		
              	
              	}
       	 	}
    	
    	
    	</script>
    	 
		
		
		
		
		
		
		
</body>
</html>