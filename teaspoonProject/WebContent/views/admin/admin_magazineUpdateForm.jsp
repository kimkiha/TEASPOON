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
   
    <style>
        table * {padding: 10px; font-size: 18px;}
        table th{text-align: center;}
        .outer p{margin-top: 30px; margin-bottom: 30px; font-size: 30px; font-weight: bold;}        
        table *{padding: 5px; margin: auto;}
        table th{width: 100px;}
        table tr:first-child{border-top: 1px solid lightgray ;}
        table tr{border-bottom: 1px solid lightgray ;}
    </style>
</head>
<body>
    <%@include file="../common/admin_sidebar.jsp" %>
        <div id="contents">
            <div id="c1" >
                <div class="outer">
                    <p>매거진 수정</p>
                    <form id="insertForm" action="insert.th" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="bno" value="<%=b.getBoardNo() %>">
                    	<div class="c_div">
	                     		   	<div class="c_div_title">
		                     		   	<p>제목 : <input type="text" style="width:90%" name="title" required><%=b.getBoardTitle() %></p> 
		                    		    <p>내용</p>
	                    		    </div>
	                    		    <div class="c_div_cont">
                                		<textarea id="summernote" name="Content"></textarea>
                                	</div>
                                </div>
                        <table>
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
                        <br>
                        <div class="btns">
                            <button type="button" style="width: 100px;" ><a href="adminAbout.html">목록으로</a></button>
                            <button type="submit" style="width: 100px;" >수정하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <script>
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
			
		
	</script>
</body>
</html>