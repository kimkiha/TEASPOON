<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>어바웃 | Admin</title>
   

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
            <div id="c1">
                <div class="outer">
                    <p>어바웃 등록</p>
                    <form id="insertForm" action="insert.th" method="post" enctype="multipart/form-data">
                        <table>
                            <tr>
                                <th width="100px">제목</th>
                                <td><input type="text" size="71px" name="title" required></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td><textarea name="content" cols="70" rows="5" style="resize:none" required></textarea></td>
                            </tr>
                            <tr>
                                <th>썸네일</th>
                                <td style="height: 120px;">
                                    <img id="titleImg" width="150">
                                </td>
                            </tr>
                        </table>
                        <br>
                        <div id="fileArea">
                            <input type="file" name="file1" id="file1" onchange="loadImg(this);">
                        </div>
                        <br>
                        <div class="btns">
                            <button type="button" style="width: 100px;"><a href="adminAbout.html">목록으로</a></button>
                            <button type="submit" style="width: 100px;">등록하기</button>
                        </div>
                    </form>
                </div>
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