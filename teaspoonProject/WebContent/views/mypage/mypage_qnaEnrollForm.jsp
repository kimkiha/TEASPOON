<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="reset.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/mypage/mypage_qnaEnrollForm.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap"
	rel="stylesheet">
	<script type="text/javascript"src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#banner {
	margin-top: 115px;
	height: 170px;
	line-height: 170px;
	background:
		url("<%=request.getContextPath()%>/resources/img/mypage/pattern.jpg")
		center top repeat-x;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/menubar.jsp"%>
		<!-- //header -->
		<div id="banner">
			<div class="contaniner title">마이페이지</div>
		</div>
		<!-- //banner -->
		<div id="content">
			<!-- mypage -->
			<div class="contaniner">
				<div id="mypage">
					<div id="mypage_info">
						<div class="user_info"
							style="width: 95px; border-left: 1px solid #bebbb6">
							<div class="user_photo"
								style="margin-top: 30px; padding-left: 10px; float: left;">
								<img src="<%=contextPath%>/resources/img/admin/user.png">
							</div>
						</div>
						<div class="user_info" style="width: 450px;">
							<table class="detail_tb" cellpadding="0" cellspacing="0">
								<tr class="d1">
									<td width="60" name="username"><%=loginUser.getUserName() %></td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade"><%=loginUser.getGradeName() %></td>
								</tr>
								<tr class="d2">
									<td colspan="2"><a
										href="<%=contextPath %>/memberModifyForm.me">회원정보수정</a></td>
								</tr>
							</table>
						</div>
						<div class="detail_info2"
							style="border-left: 1px solid #bebbb6; height: inherit;">
							<p class="info_th">적립포인트</p>
							<a href="<%=contextPath%>/mypoint.me?currentPage=1"><%=loginUser.getPoint()%>Point</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">할인쿠폰</p>
							<a href="#"><%=loginUser.getCouponCount()%>장</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">위시리스트</p>
							<a href="<%=contextPath%>/wishList.me"><%=loginUser.getWishCount()%>개</a>
						</div>
					</div>
					<div id="mypage_menu_tab">
						<a href="#" class=" float"> 주문배송조회</a> <a href="#" class=" float">공간대여확인</a>
						<a href="<%=contextPath %>/myAdress.me" class=" float">나의배송지</a> <a
							href="<%=contextPath %>/myqna.me?currentPage=1"
							class="active float">1:1문의</a> <a
							href="<%=contextPath %>/mycart.me" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<div class="mp-qna">
							<div class="mp-qna-title">
								<P>1:1문의 내역</P>
							</div>
							<div class="outer" align="center">
								<form action="<%=contextPath %>/myQnaInsert.me" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="userNo"
										value="<%=loginUser.getUserNo() %>">
									<table align="center" id="mypage_table">
										<tr>
											<th width="170">상담구분</th>
											<td width="900" id="opt" name="mtmType"><span> <input
													type="radio" id="opt1" name="mtmType" value="10" checked>주문/결제
													<label for="opt1"></label>
											</span> <span> <input type="radio" id="opt2" name="mtmType"
													value="20">배송 <label for="opt2"></label>
											</span> <span> <input type="radio" id="opt3" name="mtmType"
													value="30">이벤트/쿠폰 <label for="opt3"></label>
											</span> <span> <input type="radio" id="opt4" name="mtmType"
													value="40">환불/반품/교환 <label for="opt4"></label>
											</span> <span> <input type="radio" id="opt5" name="mtmType"
													value="50">회원/포인트 <label for="opt5"></label>
											</span> <span> <input type="radio" id="opt6" name="mtmType"
													value="60">사이트이용/기타 <label for="opt6"></label>
											</span></td>
										</tr>
										<tr>
											<th>제목</th>
											<td><input type="text" id="t" name="mtmTitle"
												placeholder="제목을 입력해 주세요"></td>
										</tr>
									</table>
									<div class="mp-qna-body">
										<div id="textarea">
											<textarea name="mtmContent" id="" cols="112" rows="19"
												required placeholder="상담내용을 입력해주세요" style="resize: none;"></textarea>
										</div>
										<div id="uploadfile">
											<input type="file" accept="image/*" name="thumbnail_upfiles">
										</div>


									</div>
									<div class="func">
										<button class="btn btn-cancel" type="reset">취소</button>
										<button class="btn btn-submit" type="submit">등록</button>
									</div>
								</form>
								<br>
								<br>
								<div class="ppp">
									<div class="ppp1">
										<div>
											<img src="유의사항.png" alt="" width="160" height="170">
										</div>

									</div>
									<div class="ppp2">
										<ul>
											<li>이메일, 핸드폰 번호를 변경하려면 개인정보수정 페이지에서 변경해주세요.</li>
											<li>한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우 삭제 후 재등록 하셔야
												합니다.</li>
											<li>알림 받기를 설정하시면 1:1 상담 답변완료시 고객님의 메일로도 확인하실 수 있습니다.</li>
											<li>고객상담센터 답변가능시간 : 오전 9시 ~ 오후 6시(토/일/공휴일 제외)</li>
										</ul>
									</div>

								</div>

							</div>

						</div>



					</div>
				</div>
			</div>
		</div>

		<!-- //content-->
		<%@ include file="../common/footer.jsp"%>
		<!-- //footer-->
	</div>
	<script>
     

    </script>
</body>
</html>