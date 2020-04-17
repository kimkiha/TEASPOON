<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/login_css.css">
</head>
<body>
<div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
        <div id="content">
            <!-- product -->
            <div id="content1">
                <div class="contaniner">
                    <div class="outer">
                        <h1>Log in</h1>
                        <div class="tab">
                            <div class="btn">
                                <button class="tablinks" onclick="openCity(event, 'login')">로그인</button>
                            </div>
                            <div class="btn">
                                <button class="tablinks" onclick="openCity(event, 'login nonmember')">비회원로그인</button>
                            </div>
                        </div>
                        
                        <div id="login" class="tabcontent">
                        <form class="login" action="<%=contextPath%>/login.me" method="post">
                            <fieldset>
                            <ul>
                             <li><input type="text" placeholder="아이디" name="userId"></li>
                             <li><input type="password" placeholder="비밀번호" name="userPwd"></li>
                            
                             <li><button type="submit">로그인</button></li>
                            </ul> 
                            <div>
                                <a href="">회원가입</a>
                                <a href="">아이디 찾기</a>
                                <a href="">비밀번호 찾기</a>
                      
                            </div>
                            </fieldset>
                        </form>
                        </div>
                        <!--회원-->
                        <div id="login nonmember" class="tabcontent" style="display:none" >
                        
                          <form class="login">
                            <fieldset>
                            <ul>
                             <li><input type="text"placeholder="주문번호" title="주문번호"></li>
                             <li><input type="password"placeholder="주문자연락처" title="주문자연락처"></li>
                            
                             <li><button>로그인</button></li>
                            </ul> 
                            <div>
                                <a href="">회원가입</a>
                                <a href="">아이디 찾기</a>
                                <a href="">비밀번호 찾기</a>
                      
                            </div>
                            </fieldset>
                        </form>
                        </div>
                        <!-- //비회원-->
                      </div>
                      <!-- //login-->
                </div>
                 <!-- //outer-->
            </div>
            <!--//contaniner-->
        </div>
        <!-- //content-->
        <div id="footer">
            <div class="contaniner">footer</div>
        </div>
        <!-- //footer-->
    </div>
    <!--//wrap-->
            
    <script>
        function openCity(evt, login) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(login).style.display = "block";
          evt.currentTarget.className += " active";
        }
    </script>
</body>
</html>