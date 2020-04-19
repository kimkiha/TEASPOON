<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_modify.css">
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
                <p style="font-size:36px; Line-height:200%; margin-top:100px;">회원정보수정</p>
                <p style="font-size:18px;  margin-bottom:70px; color:rgb(85, 83, 83);">회원님의 회원정보를 수정하실 수 있습니다.</p>
            </center>
 
            <div id="회원정보수정" class="tabcontent" id="password">
                <table>
                    <thead>
                        <ul class=im1>
                        <tr>
                            <td style="font-size:20px; width: 250px;" ><li>성 명</li></td>
                            <td style= "text-align:left; width:550px align:center"><input type="text" id="username" placeholder="이름(실명으로 입력해주세요)." disabled></td>
                            <td style= "font-size:16px; width: 200px;"></td>           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style= "font-size:20px;"><li>생 년 월 일</li></td>
                            <td style= "text-align:left;" colspan="1"><input type="number" id="birthday" type="birthday" placeholder="생년월일8자리(ex)19940610" disabled>
                            <td><button type="button" class="btn_gender" id="btn_gender">남자</button> <button type="button" class="btn_gender" id="btn_gender">여자</button></td></td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>전 화 번 호</li></td>
                            <td style= "text-align:left;" colspan="1">
                                <select id="firstnumber" style="width:120px; height:55px;">
                                <option value="010" selected>010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="019">019</option>
                                </select>
                                <input type="number" id="number1" type="number1" placeholder="111-2222"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="font-size: 10px; text-align:left"> * 아이디 미입력시 휴대폰번호로 가입되며<br> 
                                가입완료후 변경 불가합니다.</td>
                            <td></td>
                        </tr>   

                        <tr>
                            <td style= "font-size:20px;"><li>아 이 디</li></td>
                            <td style= "text-align:left;"><input type="text" id="userid" placeholder="아이디(4 ~ 12자 영문 대,소문자" disabled></td>
                            <td style= "font-size:15px; color:rgb(131, 2, 2); text-align:left; width:280px;">  * 중복된아이디</td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>비 밀 번 호</li></td>
                            <td style= "text-align:left;"><input type="number" id="password"  placeholder=" 비밀번호는 6~16자 영문 대소문자, 숫자, 특수문자 중 최..."></td>
                            <td style= "font-size:15px; color:rgb(131, 2, 2); text-align:left;">  * 정확히 입력해주세요.</td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>비밀번호확인</li></td>
                            <td style= "text-align:left;"><input type="number" id="password" placeholder="비밀번호 확인"></td>
                            <td style= "font-size:15px; color:rgb(131, 2, 2); text-align:left;">  * 비밀번호가 다릅니다.</td>
                        </tr>
                        <tr>
                            <td style= "font-size:20px;"><li>이 메 일</li></td>
                            <td style= "text-align:left;"><input type="text" id="email" placeholder="이메일"></td>
                            <td></td>
                        </tr>
                    </ul>          
                        
                    </tbody>
                </table>
            <!-- 2_1. (정보입력)본인인증 및 회원가입 버튼-->
            <button type="button" class="btn_1" id="btn_1">수정완료</button>
            </div>
    
    </div>
      <!-- //content-->
       <%@ include file="../common/footer.jsp" %>
    <!-- //footer-->
</body>
</html>