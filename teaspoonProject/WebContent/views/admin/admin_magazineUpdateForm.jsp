<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.teaspoon.board.model.vo.*"%>
 <% 
 	Board b = (Board)request.getAttribute("b"); 
 	String status = b.getStatus();
 
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
    <title>매거진</title>
   	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/admin_EnrollForm.css">
    <style>
    .outer p{font-weight: bold;}
    </style>
</head>
<body>
    <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" >
                <div class="outer">
                    <p>매거진 수정</p>
                    <form id="insertForm" action="magazineUpdate.bo" method="post" >
                    <input type="hidden" name="bno" value="<%=b.getBoardNo() %>">
                    	<div class="c_div">
	                     		   	<div class="c_div_title">
		                     		   	<p>제목 : <input type="text" style="width:93%; font-weight:500; font-color:gray" name="title" value="<%=b.getBoardTitle() %> "></p> 
		                     		</div>
	                    		    <div class="c_div_title" >
	                    		    	<p>게시상태 : <input type="radio" name="status" required value='Y' <%= selected[0]%>> Y
                                    	<input type="radio"  name="status" required value='N' <%= selected[1]%>> N
                                    	</p>
	                    		    </div>
		                     		<div class="c_div_title">
		                    		    <p>내용</p> 
	                    		    </div>
	                    		    <div class="c_div_cont">
                                		<textarea id="summernote" name="Content"><%=b.getBoardContent() %></textarea>
                                	</div>
                                </div>
                           <!--
                            <tr>
                                <th width="100px"></th>
                                <td><input type="text" size="71px" name="title" required></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td><input type="radio" name="status" required value='Y' <%= selected[0]%>> Y
                                    <input type="radio"  name="status" required value='N' <%= selected[1]%>> N
                                </td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td><textarea name="content" cols="70" rows="5" style="resize:none" required></textarea></td>
                            </tr>
                        </table>
                        <br>
                        <div id="fileArea">
                            <input type="file" name="file1" id="file1" onchange="loadImg(this);">
                        </div>
                        <br>  -->
                        <div class="btns">
                            <button type="button" style="width: 100px;"  onclick="location.href='<%=contextPath%>/magazineList.bo?currentPage=1'">목록으로</button>
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
		.c_div{text-align:left;}
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
            height: 300,
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
	

    $('#sb_btn').on('click', function(){
        $('#summernote').append('<input type="hidden" name="Content", id="Content" />');
        $('#Content').val($('.summernote').code());
        $('#magazineInsertForm').submit();
    })
    /*
		//이미지태그 클릭으로 파일 첨부할것임으로 깔끔하게 보이기위해 숨긴다.
		$(function(){
			$("#fileArea").hide();
		});
	
		//이미지 태그 클릭시 파일 첨부 버튼이 눌리게한다.
		$(function(){
			$("#titleImg").click(function(){
				
				//파일첨부 클릭이미지를 실행시킨다.	
				$("#file1").click();
				
			});
		});
		
	
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
	</script>
</body>
</html>