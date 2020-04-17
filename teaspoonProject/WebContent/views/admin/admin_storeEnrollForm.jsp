<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품</title>

<style>
.outer p {
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: bold;
}

table * {
	padding: 5px;
	margin: auto;
	text-align: center;
	font-size: 18px;
}

table th {
	width: 100px;
	text-align: center;
}

table tr:first-child {
	border-top: 1px solid lightgray;
}

table tr {
	border-bottom: 1px solid lightgray;
}
</style>
</head>
<body>
	<%@include file="../common/admin_sidebar.jsp"%>
	<div id="contents">
		<div id="c1" style="margin-top: 20px;">
			<div class="outer">
				<p>상품 등록</p>

				<form id="insertForm" action="insert.th" method="post"
					enctype="multipart/form-data">
					<table>
						<tr>
							<th>상품번호</th>
							<th>상품명</th>
							<th>판매가(원)</th>
							<th>상품옵션</th>
							<th>재고</th>
							<th>검색키워드</th>

						</tr>
						<tr>
							<td><input type="text" size="7px" readonly
								placeholder="자동등록"></td>
							<td><input type="text" size="7px"></td>
							<td><input type="text" size="7px"></td>
							<td><input type="text" size="7px"></td>
							<td><input type="text" size="7px"></td>
							<td>
								<select name="keyword">
								<option value="부드러운">부드러운</option>
								<option value="달콤한">달콤한</option>
								<option value="초콜릭같은">초콜릿같은</option>
								<option value="과일향">과일향</option>
								<option value="뻇지">뺏지</option>
								<option value="튼튼한">튼튼한</option>
								<option value="동글동글한">동글동글한</option>
							</td>

						</tr>
						<tr>
							<td>노출여부</td>
							<td><input type="radio" name="status" value="Y">Y</td>
							<td><input type="radio" name="status" value="N">N</td>
						</tr>
						<tr>
							<th>대표이미지</th>
							<td colspan="7" style="height: 120px;"><img id="titleImg"
								width="150px"></td>
						</tr>
						<tr>
							<th>상세이미지</th>
							<td colspan="2" style="height: 120px;"><img id="contentImg1"
								width="150px"></td>
							<td colspan="2" style="height: 120px;"><img id="contentImg2"
								width="150px"></td>
							<td colspan="2" style="height: 120px;"><img id="contentImg3"
								width="150px"></td>
						</tr>

					</table>
					<br>
					<div id="fileArea">
						<input type="file" name="file1" id="file1"
							onchange="loadImg(this,1);"> <input type="file"
							name="file2" id="file2" onchange="loadImg(this,2);"> <input
							type="file" name="file3" id="file3" onchange="loadImg(this,3);">
						<input type="file" name="file4" id="file4"
							onchange="loadImg(this,4);">
					</div>
					<br>
					<div class="btns">
						<button type="submit" style="width: 100px;">등록하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<script>
		//이미지태그 클릭으로 파일 첨부할것임으로 깔끔하게 보이기위해 숨긴다.
		$(function() {
			$("#fileArea").hide();
		});

		//이미지 태그 클릭시 파일 첨부 버튼이 눌리게한다.
		$(function() {
			$("#titleImg").click(function() {

				//파일첨부 클릭이미지를 실행시킨다.	
				$("#file1").click();

			});
		});

		$("#contentImg1").click(function() {
			$("#file2").click();
		});

		$("#contentImg2").click(function() {
			$("#file3").click();
		});

		$("#contentImg3").click(function() {
			$("#file4").click();
		});

		function loadImg(inputFile, num) {
			// inputFile : 현재 변화가 생긴 input type="file" 요소
			// num : 몇번째 input 요소인지 확인 후 해당 영역에 미리보기 하려고 받는 숫자값

			// [참고] https://developer.mozilla.org/ko/docs/Web/API/FileReader

			//file이 존재할 경우 --> inputFile요소의 files속성인 배열의 0번 인덱스에  파일이 담김
			if (inputFile.files.length == 1) {
				// 파일을 읽어들일 FileReader 객체생성
				var reader = new FileReader();

				//파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
				reader.readAsDataURL(inputFile.files[0]);

				//파일 읽기가 완료 되었을때 실행할 메소드
				// e : 현재 이벤트가 발생한 이벤트객체
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#titleImg").attr("src", e.target.result);
						break;
					case 2:
						$("#contentImg1").attr("src", e.target.result);
						break;
					case 3:
						$("#contentImg2").attr("src", e.target.result);
						break;
					case 4:
						$("#contentImg3").attr("src", e.target.result);
						break;

					}
				};

			}

		}
	</script>
</body>
</html>