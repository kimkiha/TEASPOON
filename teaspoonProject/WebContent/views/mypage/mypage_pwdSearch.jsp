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
                <p style="font-size:15px; color:rgb(85, 83, 83);">본인가입 이메일로 비밀번호를 찾을 수 있습니다.</p>
            </center>
 
            <div id="비밀번호찾기" class="tabcontent" id="password">
              <center>
              <form action="pwdSend.me" method="post">           
                <table style="padding-top:60px; padding-bottom:30px; padding-right:60px; margin-bottom:200px;" id="table1">
                    <thead>
                        <td class=im1>
                         <tr>
                            <td style=width:130px;></td>
                            <td style= "font-size:20px; width:160px; text-align:left;"><li>아 이 디</li></td>
                            <td style= "width:500px; text-align:left"><input type="text" id="userId" name="userId" placeholder="아이디(4 ~ 12자 영문 대,소문자"></td>
                            <td ><button type="button" class="btn1" id="idCheck" style="margin-left:15px;">아이디확인</button></td>
                            
                         </tr>
                    </thead>
                    <tbody id="tbody">
                        <tr>
                            <td></td>
                            <td style= "font-size:20px; text-align:left;" colspan="1"></td>
                            <td style= "text-align:left; font-size:15px;">* 검색하신 아이디 가입시 작성한 이메일로 비밀번호 전송</td>
                            <td><input type="submit" class="btn1" id="email_send" value="비밀번호발송" style="margin-left:15px;" disabled></td>
                        </tr>  
                    </ul>             
                    </tbody>
                </table>
                 </form>
              </center>
          
            
            </div>
        </div>
		</div>


      <!-- //content-->
      <%@ include file="../common/footer.jsp" %>
      
     
    <script> // 아이디 유효성검사 + 회원아이디확인(중복확인으로)
	
		$(function(){
			
			// 중복확인 클릭했을 때
			$("#idCheck").click(function(){
				
				// 아이디 입력하는 input요소
				var userId = $("#userId").val();
				
				$.ajax({
					url:"idCheck.me",
					data:{userId:userId},
					type:"post", 
					success:function(result){	// 1 또는 0
						
						
						if(result != 0){		// 사용가능한 아이디
							
						confirm("회원아이디가 조회되었습니다.")
						$("#email_send").removeAttr("disabled");	
						}else {					// 사용불가능한 아이디
							
							alert("회원정보가 없는 아이디입니다.");
							UserId.focus();
							
						}
						
					},error:function(){
						console.log("ajax 실패!!");
					}
					
				
				});
				
			});
			
		});
	
	</script>
	     <script>
      	 /* (이메일) 아이디 발송 버튼 클릭시  (두번째버튼)*/ 
      	 
      	 $("#email_send").click(function(){

           $.ajax({
        	   url:"pwdSend.me",
        	   data:{Email:email.value},
        	   success:function(data){
        		   alert("비밀번호가 발송되었습니다.");
        		   console.log(data);
        		   randomKey = data;
        	   },error:function(){
        		   alert("이메일발송실패");
        	   }
           })    
       
      	 });
    </script> 
	
//		<script> // "비밀번호전송" 버튼 클릭시  (마지막버튼)
//			
//    	 function check(){
//              alert("비밀번호를 이메일로 발송하였습니다.");
//       }
//       	 	
//    	</script>

//<script>
//
//$(function(){
//	
//	// 비밀번호전송
//	$("#email_send").click(function(){
//		 alert("비밀번호를 이메일로 발송하였습니다.");
//		})
//	
//		
//	});
//
//</script>
      
 	

      	
    	
	  
      

</body>
</html>