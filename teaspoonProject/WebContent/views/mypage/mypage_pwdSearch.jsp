<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_pwdSearch.css">
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
                <p style="font-size:30px; Line-height:200%;">비밀번호찾기</p>
                <p style="font-size:15px; color:rgb(85, 83, 83);">본인인증으로 아이디를 찾을 수 있습니다.</p>
            </center>
 
            <div id="비밀번호찾기" class="tabcontent" id="password">
              <center>
                <table style="padding-top:60px; padding-bottom:30px; padding-right:60px">
                    <thead>
                        <td class=im1>
                         <tr>
                            <td style=width:200px;></td>
                            <td style= "font-size:20px; width:160px; text-align:left;"><li>아 이 디</li></td>
                            <td style= "width:400px; text-align:left"><input type="text" id="userid" placeholder="아이디(4 ~ 12자 영문 대,소문자"></td>
                            <td ></td>
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td style="text-align:left;"><li>성 명</li></th>
                            <td style= "text-align:left;"><input type="text" id="username" placeholder="이름(실명으로 입력해주세요)."></td>
                            <td style= "font-size:16px; width: 200px;"></td>           
                        </tr>
                        <tr>
                            <td></td>
                            <td style= "font-size:20px; text-align:left;"><li>생 년 월 일</li></td>
                            <td style= "text-align:left;" colspan="1"><input type="number" id="birthday" type="birthday" placeholder="생년월일8자리(ex)19940610">
                            <td></td>
                        </tr>    
                        <tr>
                            <td></td>
                            <td style= "font-size:20px; text-align:left;"><li>이 메 일</li></td>
                            <td style= "text-align:left;"><input type="text" id="email" placeholder="이메일"></td>
                            <td><button type="button" class="btn1" onclick="verification_code();" style="margin-left:15px;">인증번호발송</button></td>
                        </tr>  
                        <tr>
                            <td></td>
                            <td style= "font-size:20px; text-align:left;"><li>인증번호확인</li></td>
                            <td style= "text-align:left;"><input type="number" id="password" placeholder="비밀번호 확인"></td>
                            <td></td>
                        </tr>       
                    </ul>             
                    </tbody>
                </table>
              </center>
            <!-- 2_1. (정보입력)본인인증 및 회원가입 버튼-->
            <button type="button" class="password_search" id="password_search">비밀번호찾기</button>
            </div>
        </div>

        <script>
            state=0;
            function verification_code() {
               if(state==0){
                    state=1;
                    window.confirm("인증번호를 발송했습니다.");
               } 
            }
        </script>


      <!-- //content-->
      <%@ include file="../common/footer.jsp" %>
    <!-- //footer-->
</div>
</body>
</html>