<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.board.model.vo.*"%>
 <% 
 	Board b = (Board)request.getAttribute("b"); 
 	String status = b.getStatus();
 	Attachment at = (Attachment)request.getAttribute("at");
 
 String[] selected = new String[2];
 
 switch(status){
 case "Y" : selected[0] = "checked"; break;
 case "N" : selected[1] = "checked"; break;
 
 }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
   	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/admin_EnrollForm.css">
    <style>
    .outer p{font-weight: bold;}
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
</head>
<body>
    <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" >
                <div class="outer">
                    <p>공지사항 수정</p>
                    <form id="noticeUpdete" action="noticeUpdate.bo" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="bno" value="<%=b.getBoardNo() %>">
                    	<table>
                 		   	<tr>
	                  		   	<td width="120" class="tb_title">제목</td>
	                  		   	<td colspan="3" class="tb_content">
	                  		   		<input type="text" style="width:100%" name="title" required value="<%=b.getBoardTitle() %>">
	                  		   	</td>
                 		   	</tr>
                 		   	<tr>
                 		   		<td class="tb_title">대표이미지</td>
                 		   		<td width="270" class="tb_content">
                 		   		
	                 		   	<%if(at != null) {//기존에 첨부파일이 있었을 경우%>
									<%= at.getOriginName() %><br>
									<input type="hidden" name="originFileNo" value="<%=at.getFileNo() %>">
									<input type="hidden" name="originFileName" value="<%=at.getChangeName() %>"> <%-- 실제서버에 올라간 파일명 --%>
								<% } %>
								<img id="titleImg" name="upfile" width="150" height="120" required src="<%=contextPath%>/resources/img/board/<%=at.getChangeName()%>"></td>
	                 		   		<td width="150" class="tb_title">게시상태</td>
                 		   		<td class="tb_content">
                 		   			<input type="radio" name="status" required value='Y' <%= selected[0]%>> Y
                                    <input type="radio"  name="status" required value='N' <%= selected[1]%>> N
                 		   		</td>
                 		   	</tr>
               		    </table>
              		    <div class="c_div_cont">
                         		<textarea id="summernote" name="Content"><%=b.getBoardContent() %></textarea>
                         </div>
	                         
						<div id="fileArea">
							<input type="file" name="file1" id="file1" onchange="loadImg(this,1);">
						</div>
               		    
               		    
                        <div class="btns">
                            <button type="button" style="width: 100px;"  onclick="location.href='<%=contextPath%>/noticeAdminList.bo?currentPage=1'">목록으로</button>
                            <button type="submit" style="width: 100px;" >수정하기</button>
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
			.panel{margin:0}
			span.note-icon-caret{
				display:none;
			}
		</style>
    <script>
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
	
    /*
    $('#sb_btn').on('click', function(){
        $('#summernote').append('<input type="hidden" name="Content", id="Content" />');
        $('#Content').val($('.summernote').code());
        $('#magazineInsertForm').submit();
    })*/
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