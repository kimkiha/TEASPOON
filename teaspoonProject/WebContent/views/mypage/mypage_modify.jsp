<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정 | TeaSpoon</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_modify.css">
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
            <form id="modify" action="<%= contextPath %>/update.me" method="post">
            <div id="content" class="contaniner">
            
            <center style="padding:35px;">
            	<p style="margin-top:100px;"></p>
                <p style="font-size:36px; Line-height:200%; ">회원정보수정</p>
                <p style="font-size:18px;  margin-bottom:70px; color:rgb(85, 83, 83);">회원님의 회원정보를 수정하실 수 있습니다.</p>
            </center>
 
            <div id="회원정보수정" class="tabcontent" id="password">
              <center>
                <table style="padding-left:100px; padding-top:60px; padding-bottom:50px;" id="table1">
                    <thead>
                        <ul class=im1>
                        <tr>
                            <td style="font-size:20px; width: 250px; height:55px;" ><li>성 명</li></td>
                            <td style= "text-align:left;" colspan="1"><input type="text" id="userName" name="username" placeholder="<%=loginUser.getUserName() %>" disabled></td>
                             <td></td>       
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style= "font-size:20px;"><li>생 년 월 일</li></td>
                            <td style= "text-align:left;" colspan="1"><input type="number" id="birthday" type="birthday" placeholder="<%=loginUser.getBirthday() %>" disabled>
                            <td></td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>전 화 번 호</li></td>
                            <td style= "text-align:left;" colspan="1">
                                <select name="firstnumber" id="firstnumber" style="width:120px; height:55px;">
                                <option value="010" selected>010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="019">019</option>
                                </select>
                                <input type="text" id="verification" name="phonenum" type="verification" placeholder="전화번호뒷자리 8자리입력"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="font-size: 10px; text-align:left"></td>
                            <td></td>
                        </tr>   

                        <tr>
                            <td style= "font-size:20px;"><li>아 이 디</li></td>
                            <td style= "text-align:left;"><input type="text" id="userId" name="UserId" placeholder="<%=loginUser.getUserId() %>" disabled></td>
                            <td style= "font-size:15px; color:rgb(131, 2, 2); text-align:left; width:280px;"> </td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>비 밀 번 호</li></td>
                            <td style= "text-align:left;"><input type="password" id="userPwd1" name="UserPwd1" placeholder=" 비밀번호는 8~16자 영문 대소문자, 숫자, 특수문자 중 최..."></td>
                            <td style= "font-size:15px; color:rgb(131, 2, 2); text-align:left;"> </td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>비밀번호확인</li></td>
                            <td style= "text-align:left;"><input type="password" id="userPwd2" name="UserPwd2" placeholder="비밀번호 확인"></td>
                            <td style= "font-size:15px; color:rgb(131, 2, 2); text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>이 메 일</li></td>
                            <td style= "text-align:left;"><input type="text" id="email" name="Email" placeholder="이메일"></td>
                            <td></td>
                        </tr>
                    </ul>          
                    </tbody>
                </table>
              </center>
              </div>
              </form>
            <!-- 2_1. (정보입력)본인인증 및 회원가입 버튼-->
            
           
            <button type="submit" class="btnenroll3" id="Modify_1" onclick="check();">수정완료</button>
            </div>
    	
    	
    </div>
      <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
    <!-- //footer-->
    

 
     	<script> /* "수정 완료" 버튼 클릭시 -> input에 담아온 값을 Modify_final이라는 폼에 각각 hidden타입으로 저장 */
    	 function check(){
    		 var veri  = document.getElementById("verification"); 		// 전화번호
             var pwd1 = document.getElementById("userPwd1");				// 비밀번호1
             var pwd2 = document.getElementById("userPwd2");				// 비밀번호2
             var email = document.getElementById("email"); 				// 이메일
             
             // 1) 전화번호검사
             //    숫자!!로만 7글자 이상, 8글자 이하
             regExp = /^[0-9]{7,8}$/; 
             if(!regExp.test(veri.value)){
                 alert("유효한 전화번호를 입력하세요");
                 veri.value = "";
                 veri.focus();
                 return false;               
             }
           
             // 2_1) 비밀번호 검사
             //    특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
             regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
             if(!regExp.test(pwd1.value)){
                 alert("유효한 비밀번호를 입력하세요!!");
                 pwd1.value="";
                 pwd1.focus();
                 return false;
             }
 			
             // 2_2) 비밀번호 일치 확인
             // 비밀번호값과 비밀번호 확인값이 일치하는지 검사
             if(pwd1.value != pwd2.value){
                 alert("동일한 비밀번호 확인값을 입력하세요!!");
                 pwd2.value = "";
                 pwd1.focus();
                 return false;
             }
             
             // 3) 이메일 유효성검사
             //mail이 입력되었는지 확인하기
             emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
                if (!emailRegExp.test(email.value)) {
                    alert("이메일 형식이 올바르지 않습니다!");
                    form.email.value = "";
                    form.email.focus();
                    return false;
                 }

 				
 				
    		
    				
    			$("#Modify_final").submit();
    				
              	}
       	 	
    	</script>
 
    
</body>
</html>