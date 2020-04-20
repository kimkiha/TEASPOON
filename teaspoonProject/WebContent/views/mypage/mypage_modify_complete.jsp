<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_modify_complete.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">

<body>
	<div id="wrap">
		<%@ include file="../common/menubar.jsp" %>
		<!-- //header -->

		<!-- product -->
		<div class="contaniner">
			<center style="padding: 35px;">
				<h4>회원정보수정</h4>
				<h6>회원님의 회원정보를 수정하실 수 있습니다.</h6>
			</center>

			<div id="정보수정" class="tabcontent">
				<form id="enrollmodify">
					<fieldset
						style="list-style-type: disc; padding: 60px; padding-right: 80px;"
						id=ul>
						<ul
							style="border: 0.3 solid lightgrey; height: 260px; width: 800px">
							<br>

							<center style="padding: 35px;">
								<img src="C:\tea spoon\티스푼 이미지\spoon.png" width="74px;"
									height="74px">
								<h1>정보수정완료!</h1>
								<h4 style="color: gray">3초뒤 메인페이지로 이동합니다.</h4>
							</center>
					</fieldset>
				</form>
				</ul>
				<br>
				</form>
			</div>

			<!-- //content-->
			<%@ include file="../common/footer.jsp" %>
			<!-- //footer-->
		</div>
</body>
</html>