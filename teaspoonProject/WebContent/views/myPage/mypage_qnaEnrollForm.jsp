<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="mypage qnaEnrollForm.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner {height: 170px; line-height: 170px; background:url("패턴 - 복사본.jpg") center top repeat-x;}
    </style>
</head>
<body>
<div id="wrap">
        <div id="header">
            <div class="contaniner">여기는메뉴바</div>
        </div>
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
                            <div class="user_info" style="width:95px; border-left:1px solid #bebbb6">
                                <div class="user_photo" style="margin-top:30px; padding-left:10px; float: left;">
                                    <img src="사이트이미지/user.png">
                                </div>
                            </div>
                            <div class="user_info" style="width:450px;">
                                <table class="detail_tb" cellpadding="0" cellspacing="0"  >
                                    <tr class="d1">
                                        <td width="60" name="username">홍길동</td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" >골드등급</td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="#" >회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" >500Point</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" >3장</a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" >10개</a>
                            </div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="#" class=" float"> 주문배송조회</a>
                            <a href="#" class=" float">공간대여확인</a>
                            <a href="#" class=" float">나의배송지</a>
                            <a href="#" class="active float">1:1문의</a>
                            <a href="#" class="float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>
                        <div id="mp_con1">
                            <div class="mp-qna">
                               <div class="mp-qna-title"><P>1:1문의 내역</P></div>
                               <div class="outer" align="center">
                                    <form action="" method="post">
                                        <table align="center" id="mypage_table">
                                            <tr >
                                                <th width="170">상담구분</th>
                                                <td width="900" id="opt">
                                                    <span>
                                                        <input type="radio"id="opt1"name="qna" checked>주문/결제
                                                        <label for="opt1"></label>
                                                    </span>    
                                                    <span>
                                                        <input type="radio" id="opt2"name="qna">배송
                                                        <label for="opt2"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio" id="opt3"name="qna">이벤트/쿠폰
                                                        <label for="opt3"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio"id="opt4"name="qna">환불/반품/교환
                                                        <label for="opt4"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio"id="opt5"name="qna">회원/포인트
                                                        <label for="opt5"></label>
                                                    </span>
                                                    <span>
                                                        <input type="radio"id="opt6"name="qna">사이트이용/기타
                                                        <label for="opt6"></label>
                                                    </span>
                                                 </td>   
                                            </tr>
                                            <tr>
                                                <th>제목</th>
                                                <td><input type="text"id="t" placeholder="제목을 입력해 주세요"></td>
                                            </tr>
                                        </table>
                                        <div class="mp-qna-body">
                                            <div id="textarea">
                                                <textarea name="" id="" cols="112" rows="19" required
                                                placeholder="상담내용을 입력해주세요" style="resize: none;"></textarea>
                                            </div>
                                            <div id="uploadfile">
                                                <input type="file" accept="image/*" >
                                            </div>
                                            <div id="email-check">
                                                <span><input type="checkbox">답변완료시 이메일로 알림 받기(ssukpuk@naver.com)</span>
                                            </div>
                                          
                                        </div>
                                        <div class="func">
                                            <button class="btn btn-cancel">취소</button>
                                            <button class="btn btn-submit">등록</button>
                                        </div>
                                    </form> 
                                    <br><br>
                                    <div class="ppp">
                                        <div class="ppp1">
                                            <div><img src="유의사항.png" alt="" width="160"height="170"></div>
                                            
                                        </div>     
                                        <div class="ppp2">
                                            <ul>
                                                <li>이메일, 핸드폰 번호를 변경하려면 개인정보수정 페이지에서 변경해주세요.</li>
                                                <li>한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우 삭제 후 재등록 하셔야 합니다.</li>
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
        <div id="footer">
            <div class="contaniner">footer</div>
        </div>
        <!-- //footer-->
    </div>
    <script>
     

    </script>
</body>
</html>