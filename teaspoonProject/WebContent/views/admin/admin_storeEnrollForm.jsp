<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품등록 | Admin</title>

<style>
.outer p {
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: bold;
}

table *{
	padding: 3px;
	font-size: 18px;
}

table th{
	width: 70px;
	text-align:left;
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

				<form id="productInsertForm" action="insert.st" method="post"
					enctype="multipart/form-data">
					<table>
						<tr>
							<th>PCODE</th>
							<th>PNAME</th>
							<th>SUP_PRICE</th>
							<th>PRICE</th>
							<th>STOCK</th>
							<th>KEYWORD</th>
						</tr>
						<tr>
							<td><input type="text" size="7px" name="pcode" placeholder="자동생성" readonly></td>
							<td><input type="text" size="7px" name="pname" required></td>
							<td><input type="text" size="7px" name="supPrice" required></td>
							<td><input type="text" size="7px" name="price" required></td>
							<td><input type="text" size="7px" name="stock" required></td>
							<td><input type="text" size="12px" name="keyword" required></td>
						</tr>
						<tr>
							<th>상품종류</th>
							<td>
								<input type="radio" name="kind" value="C" required>C
								<input type="radio" name="kind" value="I" required>I
							</td>
						</tr>
						<tr>
							<th style="width:70px;">대표이미지</th>
							<td>
								<img id="titleImg" width="150" height="120" required>
							</td>
					
							<th style="width:70px;">상세이미지</th>
							<td>
								<img id="contentImg1" width="150" height="120">
							</td>
							<td>
								<img id="contentImg2" width="150" height="120">
							</td>
							<td>
								<img id="contentImg3" width="150" height="120">
							</td>
						</tr>
						<tr>
							<th>상품상세</th>
							<td colspan="5">
								<textarea name="pcontent" cols=75 rows=4 style="resize:none;" required></textarea>
							<td>
							
						</tr>

					</table>
					<br>
					<div id="fileArea">
						<input type="file" name="file1" id="file1" onchange="loadImg(this,1);">
						<input type="file" name="file2" id="file2" onchange="loadImg(this,2);"> 
						<input type="file" name="file3" id="file3" onchange="loadImg(this,3);">
						<input type="file" name="file4" id="file4" onchange="loadImg(this,4);">
					</div>
				
					<div class="btns">
						<button type="submit" style="width: 100px;">등록하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#titleImg").click(function(){
				$("#file1").click();
			});
			$("#contentImg1").click(function(){
				$("#file2").click();
			});
			$("#contentImg2").click(function(){
				$("#file3").click();
			});
			$("#contentImg3").click(function(){
				$("#file4").click();
			});
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
					case 1: $("#titleImg").attr("src", e.target.result); break;
					case 2: $("#contentImg1").attr("src", e.target.result); break;
					case 3: $("#contentImg2").attr("src", e.target.result); break;
					case 4: $("#contentImg3").attr("src", e.target.result); break;

					}
				};

			}

		}
	</script>
</body>
</html>