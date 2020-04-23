<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.store.model.vo.*, com.teaspoon.board.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_wish.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#banner {
	height: 170px;
	line-height: 170px;
	background: url("패턴 - 복사본.jpg") center top repeat-x;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/menubar.jsp" %>
		
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
								<img src="사이트이미지/user.png">
							</div>
						</div>
						<div class="user_info" style="width: 450px;">
							<table class="detail_tb" cellpadding="0" cellspacing="0">
								<tr class="d1">
									<td width="60" name="username">홍길동</td>
									<td style="color: #d6ae71; font-size: 15px;" name="usergrade">골드등급</td>
								</tr>
								<tr class="d2">
									<td colspan="2"><a href="#">회원정보수정</a></td>
								</tr>
							</table>
						</div>
						<div class="detail_info2"
							style="border-left: 1px solid #bebbb6; height: inherit;">
							<p class="info_th">적립포인트</p>
							<a href="#">500Point</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">할인쿠폰</p>
							<a href="#">3장</a>
						</div>
						<div class="detail_info2">
							<p class="info_th">위시리스트</p>
							<a href="#">10개</a>
						</div>
					</div>
					<div id="mypage_menu_tab">
						<a href="#" class="active float"> 주문배송조회</a> <a href="#"
							class="float">공간대여확인</a> <a href="#" class="float">나의배송지</a> <a
							href="#" class="float">1:1문의</a> <a href="#" class="float">장바구니</a>
					</div>
					<div class="pagename"></div>
					<div id="mp_con1">
						<p>위시리스트</p>
						<table id="mypage_table" cellspacing="0">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll"
										id="th_checkAll" onclick="checkAll();">전체선택</th>
									<th colspan="2">상품명</th>
									
									<th>상품가격</th>

									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="7" height="150">위시리스트에 선택된 상품이 없습니다</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkRow"
										value="${content.IDX}"></td>
									<td style="text-align: left;"><img src="사이트이미지/메인/1.jpg"
										width="130px" height="130px"></td>
									<td style="text-align: left;" class="t-title">녹차 스프레드</td>
									<td></td>
									<td><p>18,000원</p></td>
									<td class="btn-group-cart">
										<button>장바구니</button>
										<br>
									<br>
										<button>바로구매</button>
									</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="checkRow"
										value="${content.IDX}"></td>
									<td style="text-align: left;"><img src="사이트이미지/메인/1.jpg"
										width="130px" height="130px"></td>
									<td style="text-align: left;" class="t-title">녹차 스프레드</td>
									<td></td>
									<td><p>18,000원</p></td>
									<td class="btn-group-cart">
										<button>장바구니</button>
										<br>
									<br>
										<button>바로구매</button>
									</td>
								</tr>



							</tbody>

						</table>
						<div class="t-func">
							<div class="t-func1">
								<button onclick="deleteAction();">선택삭제</button>
							</div>
							<div class="t-func3">
								<span>위시리스트에 보관된 상품은 30일뒤에 삭제됩니다</span>
							</div>
						</div>

						<div class="func">
							<div class="func-group">
								<button type="submit">선택상품 주문</button>
								<button type="submit" id="btn-func">전체상품 주문</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //content-->
		 <%@ include file="../common/footer.jsp" %>
		<!-- //footer-->
	</div>
	<script>
        /* 전체 선택 삭제 */
        function checkAll(){
            if( $("#th_checkAll").is(':checked') ){
                $("input[name=checkRow]").prop("checked", true);
            }else{
                $("input[name=checkRow]").prop("checked", false);
            }
        }
      /* 체크 삭제*/
        function deleteAction(){
        var checkRow = "";
        $( "input[name='checkRow']:checked" ).each (function (){
            checkRow = checkRow + $(this).val()+"," ;
        });
        checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
        
        if(checkRow == ''){
            alert("삭제할 대상을 선택하세요.");
            return false;
        }
        console.log("### checkRow => {}"+checkRow);
        
        if(confirm("정보를 삭제 하시겠습니까?")){
            
       //삭제처리 후 다시 불러올 리스트 url      
            var url = document.location.href;
            var page = $("#page").val();
            var saleType = $("#saleType").val();
            var schtype = $("#schtype").val();
            var schval = $("#schval").val();
            location.href="${rc.contextPath}/test_proc.do?idx="+checkRow+"&goUrl="+url+"&page="+page+"&saleType="+saleType+"schtype="+schtype+"schval="+schval;      
        }
        }



    </script>
</body>
</html>