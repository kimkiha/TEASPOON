<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/login_css.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
         <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div class="outer">
                            <div class="login-title">
                                <img src="<%=contextPath %>/resources/img/main/logo.png" alt="" >
                            </div>
                        <div id="login">
                             <form class="login" action="<%=contextPath%>/login.me" method="post">
                            <fieldset>
                            <ul>
                             <li><input type="text" placeholder="아이디" name="userId" style="padding-left:15px"></li>
                             <li><input type="password" placeholder="비밀번호" name="userPwd"  style="padding-left:15px"></li>
                            
                             <li><button type="submit">로그인</button></li>
                            </ul> 
                            <div id="enroll">
                                <a href="<%=contextPath%>/memberEnroll.me">회원가입</a>
                                <span>|</span>
                                <a href="">아이디 찾기</a>
                                <span>|</span>
                                <a href="">비밀번호 찾기</a>
                      
                            </div>
                            </fieldset>
                        </form>
                        </div>
                      
                      
                    </div>
                    
                </div>
                 <!-- //outer-->
            </div>
            <!--//contaniner-->
        </div>
        <!-- //content-->
       
   <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <!--//wrap-->
            
    <script>
       
    </script>
</body>
</html>