<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매거진 | Admin</title>
    <style>
        table * {padding: 10px; font-size: 18px;}
        table th{text-align: center;}
        .outer p{margin-top: 30px; margin-bottom: 30px; font-size: 30px; font-weight: bold;}        
        table *{padding: 5px; margin: auto;}
        table th{width: 100px;}
        table tr:first-child{border-top: 1px solid lightgray ;}
        table tr{border-bottom: 1px solid lightgray ;}
        .tb_title{background:#efefef; font-weight:700; text-align:center}
        .tb_content{padding-left:10px}
    </style>
    <!-- 
	<script src="https://cdn.ckeditor.com/ckeditor5/18.0.0/decoupled-document/ckeditor.js"></script>
	 -->
	  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/admin_EnrollForm.css">
</head>
<body>
     <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1">
                <div class="outer">
                    <p>매거진 등록</p>
                    <form id="magazineInsertForm" action="magazineInsert.bo" method="post" enctype="multipart/form-data">
                		<table>
                 		   	<tr>
	                  		   	<td width="120" class="tb_title">제목</td>
	                  		   	<td class="tb_content"><input type="text" style="width:100%" name="title" required></td>
                 		   	</tr>
                 		   	<tr>
                 		   		<td class="tb_title">대표이미지</td>
                 		   		<td class="tb_content"><img id="titleImg" width="150" height="120" required></td>
                 		   		
                 		   	</tr>
               		    </table>
              		    <div class="c_div_cont">
                         		<textarea id="summernote" name="Content"></textarea>
                         </div>
	                         
						<div id="fileArea">
							<input type="file" name="file1" id="file1" onchange="loadImg(this,1);">
						</div>
                         
                                
                                <!--  <textarea name="content" cols="70" rows="5" style="resize:none" required></textarea></td>
                           		-->
                           		<!--
                           		                           		  <div id="toolbar-container" style="float:left; width:705px; padding:0"></div>
								  <div id="editor" name="contents" style="float:left; width:705px; height:100%; margin-top:10px; border:1px solid lightgray; font-size:18px">
								   
								  </div>
								  <script>
								    DecoupledEditor
								    .create( document.querySelector( '#editor' ) )
								    .then( editor => {
								        const toolbarContainer = document.querySelector( '#toolbar-container' );
								
								        toolbarContainer.appendChild( editor.ui.view.toolbar.element );
								    } )
								    .catch( error => {
								        console.error( error );
								    } );
								   </script>
								     -->
                            <!-- 
                            <tr>
                                <th>썸네일</th>
                                <td style="height: 120px;">
                                    <img id="titleImg" width="150">
                                </td>
                            </tr>
                             -->
                        <!--
                        <br>
                        <div id="fileArea">
                            <input type="file" name="file1" id="file1" onchange="loadImg(this);">
                        </div>
                        <br>-->
                        <div class="btns" style="margin-top:20px">
                            <button type="button" style="width: 100px;"><a href="<%=contextPath%>/magazineAdminList.bo">목록으로</a></button>
                            <button type="submit" id="sb_btn" style="width: 100px;">등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	    <link href="<%=contextPath%>/resources/css/admin/admin_common.css" rel="stylesheet">
	   
		<style>
		button{width:auto;}
		.dropdown-toggle{width:auto}
		.c_div_cont{float:left; text-align:left;  border-bottom:1px solid lightgray; padding-bottom:10px}
		 h1,
		.h1,
		 h2,
		.h2,
		 h3,
		.h3 {
		  margin-top: 0;
		  margin-bottom: 0;
		 }
			/* 
			[class*=" note-icon"]:before, [class^=note-icon]:before{
				font-size:10px;
			} 
			*/
			#insertForm button{
				width:auto;
			}
			span.note-icon-caret{
				display:none;
			}
		</style>
    <script>
    $(function(){

        $('span').removeClass('note-icon-caret');
    });
    
    $(document).ready(function() {
        // 1. 단순히 에디터 폼만 보이게 하는거
        //$("#summernote").summernote();
        
        // 2. 추가적인 속성들 부여 가능
        // 간단하게 사이즈 조정(width, height) / 미리보기 값(placeholder)
        $('#summernote').summernote({
           //placeholder:" ",
           //tabsize: 2,
            height: 150,
            width:800/* ,
            toolbar: [
                // [groupName, [list of button]]
                ['Font Style', ['fontname']],
                ['style', ['bold', 'italic', 'underline']],
                ['font', ['strikethrough']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['paragraph']],
                ['height', ['height']],
                ['Insert', ['picture']]
             ] */
            
        });
     });
	

    /* $('#sb_btn').on('click', function(){
        $('#summernote').append('<input type="hidden" name="Content", id="Content" />');
        $('#Content').val($('.summernote').code());
        $('#magazineInsertForm').submit();
    }) */

		/*
		function loadImg(inputFile){
			// inputFile : 현재 변화가 생긴 input type="file" 요소
			
			// [참고] https://developer.mozilla.org/ko/docs/Web/API/FileReader
			
			//file이 존재할 경우 --> inputFile요소의 files속성인 배열의 0번 인덱스에  파일이 담김
			if(inputFile.files.length == 1){
				// 파일을 읽어들일 FileReader 객체생성
				var reader = new FileReader();
				
				//파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
				reader.readAsDataURL(inputFile.files[0]);
				
				//파일 읽기가 완료 되었을때 실행할 메소드
				// e : 현재 이벤트가 발생한 이벤트객체
				reader.onload = function(e){
					$("#titleImg").attr("src", e.target.result);
					}
				};
					
			};
			*/
			
			$(function(){
				$("#fileArea").hide();
				
				$("#titleImg").click(function(){
					$("#file1").click();
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

						}
					};

				}

			}
	</script>
</body>
</html>