<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<p style="font-size: 30px; Line-height: 200%;">아이디찾기</p>
				<p style="font-size: 15px; color: rgb(85, 83, 83);">본인인증으로 아이디를
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
				<table style="padding-left:100px; padding-top:65px; padding-bottom:65px">
					<thead>
						<ul class=im1>
							<tr>
								<td style="font-size: 20px; width: 300px;"><li>이 메 일</li></td>
								<td style="text-align: left; width: 404px;"><input
									type="text" id="email" type="email"
									placeholder="가입시 입력한 이메일로 발송됩니다." disabled></td>
								<td style="width: 230px;"><button type="button"
										class="btn1">인증번호발송</button></td>
							</tr>
					</thead>
					<tbody>
						<tr>
							<td style="font-size: 20px;"><li>인증번호확인</li></td>
							<td><input type="number" id="verification"
								type="verification" placeholder="인증번호"></td>
							<td style="font-size: 15px; color: rgb(131, 2, 2);">* 번호가
								잘못되었습니다.</td>
						</tr>
						</ul>

					</tbody>
				</table>
			  </center>
				<button type="button" class="btnenroll">인증완료</button>
			</div>

		</div>
		<!-- //content-->
		  <%@ include file="../common/footer.jsp" %>
		<!-- //footer-->
</body>
</html>