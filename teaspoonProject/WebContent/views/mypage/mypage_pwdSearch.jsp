<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기 | TeaSpoon</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_pwdSearch.css">
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
            
            <center style="padding:35px;">
            	<p style="margin-top:100px;"></p>
                <p style="font-size:30px; Line-height:200%;">비밀번호찾기</p>
                <p style="font-size:15px; color:rgb(85, 83, 83);">본인인증으로 아이디를 찾을 수 있습니다.</p>
            </center>
 
            <div id="비밀번호찾기" class="tabcontent" id="password">
              <center>
                <table style="padding-top:60px; padding-bottom:30px; padding-right:60px" id="table1">
                    <thead>
                        <td class=im1>
                         <tr>
                            <td style=width:130px;></td>
                            <td style= "font-size:20px; width:160px; text-align:left;"><li>아 이 디</li></td>
                            <td style= "width:400px; text-align:left"><input type="text" id="userId" placeholder="아이디(4 ~ 12자 영문 대,소문자"></td>
                            <td ><button type="button" class="btn1" id="idCheck" style="margin-left:15px;">아이디확인</button></td>
                            
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td style= "font-size:20px; text-align:left;"><li>이 메 일</li></td>
                            <td style= "text-align:left;"><input type="text" id="email" placeholder="이메일"></td>
                            <td><button type="submit" class="btn1" id="email_send" style="margin-left:15px;">인증번호발송</button></td>
                        </tr>  
                        <tr>
                            <td></td>
                            <td style= "font-size:20px; text-align:left;"><li>인증번호확인</li></td>
                            <td style= "text-align:left;"><input type="text" id="identify" placeholder="인증번호 확인"></td>
                            <td></td>
                        </tr>       
                    </ul>             
                    </tbody>
                </table>
              </center>
            <!-- 2_1. (정보입력)본인인증 및 회원가입 버튼-->
            <input type="button" class="password_search" id="password_search" value="비밀번호찾기" onclick="check();"></button>
            </div>
        </div>
		</div>


      <!-- //content-->
      <%@ include file="../common/footer.jsp" %>
      
     
    <script> // 아이디 유효성검사 + 회원아이디확인(중복확인으로)
	
		$(function(){
			
			// 중복확인 클릭했을 때
			$("#idCheck").click(function(){
				  var id = document.getElementById("userId");
				  var regExp = /^[a-z][a-z\d]{3,11}$/i;
		            if(!regExp.test(id.value)){
		                alert("유효한 아이디를 입력하세요!!");
		                id.value = "";
		                id.focus();
		                return false;               
		            }
				// 아이디 입력하는 input요소
				var userId = $("#userId").val();
				
				$.ajax({
					url:"idCheck.me",
					data:{userId:userId},
					type:"post", 
					success:function(result){	// 1 또는 0
						
						if(result != 0){		// 사용가능한 아이디
							
							if(confirm("회원아이디가 조회되었습니다.")){
								
								// 아이디 더이상 수정이 불가하게끔
								$("#userId").attr("readonly", "true");
								// 회원가입버튼 활성화
								$("#seconde_agree_btn").removeAttr("disabled");
								
							}else{
								$("#userId").forcus();
								
							}
							
						}else {					// 사용불가능한 아이디
							
							alert("회원정보가 없는 아이디입니다.");
							UserId.focus();
							
						}
						
					},error:function(){
						console.log("ajax통신 실패!!");
					}
					
				
				});
				
			});
			
		});
	
	</script>      
      
 	<script>

      	 /* (이메일) 인증번호 발송 버튼 클릭시 */
      	 $("#email_send").click(function(){
      		var email = document.getElementById("email"); // 이메일
      		
            // 6) 이메일 유효성검사
            //mail이 입력되었는지 확인하기
             var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
               if (!emailRegExp.test(email.value)) {
                   alert("이메일 형식이 올바르지 않습니다!");
                   form.email.value = "";
                   form.email.focus();
                   return false;
                }
               
           $.ajax({
        	   url:"email.e",
        	   data:{Email:email.value},
        	   success:function(data){
        		   alert("인증번호가 발송되었습니다.");
        		   console.log(data);
        		   randomKey = data;
        	   },error:function(){
        		   alert("이메일발송실패");
        	   }
           })    
       
      	 });
    	</script>
    	
	<script> // "비밀번호확인" 버튼 클릭시  (마지막버튼)
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
    				
    				// 여기서 서블릿으로 걸고 -> 서블릿에서 포워딩 방식으로...????
    				
              	}
       	 	}
    	
    	
    	</script>     
      

</body>
</html>