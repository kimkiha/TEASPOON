<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="reset.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_qnaDetail.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
	<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        #banner {height: 170px; line-height: 170px; background:url("패턴 - 복사본.jpg") center top repeat-x;}
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
                                                        <label for="opt1"> <input type="radio"id="opt1"name="qna" checked>주문/결제
                                                        </label>
                                                    </span>    
                                                    <span>
                                                        <label for="opt2">
                                                        <input type="radio" id="opt2"name="qna">배송
                                                        </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt3">
                                                        <input type="radio" id="opt3"name="qna">이벤트/쿠폰
                                                        </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt4">
                                                        <input type="radio"id="opt4"name="qna">환불/반품/교환
                                                        </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt5">
                                                        <input type="radio"id="opt5"name="qna">회원/포인트
                                                       </label>
                                                    </span>
                                                    <span>
                                                        <label for="opt6">
                                                        <input type="radio"id="opt6"name="qna">사이트이용/기타
                                                        </label>
                                                    </span>
                                                 </td>   
                                            </tr>
                                            <tr>
                                                <th>제목</th>
                                                <td> 고객님이 입력한 글제목이 올 자리입니다</td>
                                            </tr>
                                        </table>
                                        <div class="mp-qna-body">
                                            <div id="textarea">
                                                그들은 관현악이며, 구하기 길지 보배를 그들에게 그들의 운다. 있음으로써 싶이 하는 시들어 물방아 얼음 산야에 쓸쓸하랴? 가는 우리는 이상의 같이, 꽃이 하여도 불러 그들의 되려니와, 운다. 살았으며, 끝에 소담스러운 것이다. 우리의 이 유소년에게서 위하여, 생생하며, 하여도 사랑의 봄바람이다. 피가 있음으로써 두손을 인류의 거선의 이상의 이상이 안고, 황금시대다. 웅대한 얼마나 끝에 그들에게 역사를 돋고, 못할 이것이다. 길을 설레는 그것은 붙잡아 위하여서. 놀이 할지니, 끓는 꽃 낙원을 위하여 피어나는 약동하다.

                                                무엇을 트고, 불어 속에서 우리 낙원을 듣는다. 새 싹이 커다란 봄바람이다. 발휘하기 너의 사라지지 힘있다. 위하여 힘차게 눈이 그와 있을 그들의 위하여, 우리 아니다. 천하를 피어나는 방지하는 그림자는 수 우리 밥을 만물은 것이다. 할지니, 일월과 그들의 풍부하게 뼈 넣는 철환하였는가? 위하여 같으며, 풀밭에 인류의 청춘의 별과 사막이다. 그것은 인도하겠다는 뼈 있으랴? 방황하여도, 뼈 동산에는 투명하되 심장의 보배를 이상, 부패뿐이다.
                                                
                                                귀는 것이다.보라, 가것은 우리 사막이다. 석가는 방황하였으며, 우리 있는가? 웅대한 오직 풀이 봄바람을 때까지 소리다.이것은 산야에 그들은 사막이다. 길지 밥을 인간이 부패뿐이다. 품었기 인간의 그들은 싸인 더운지라 약동하다. 못할 듣기만 전인 피어나기 같이, 그들에게 갑 속에 운다. 듣기만 위하여 능히 관현악이며, 싸인 풀밭에 그러므로 소리다.이것은 사막이다. 찾아 이상은 이상의 열락의 새 굳세게 있다. 소금이라 우리의 끓는 두기 끓는 그들은 스며들어 것이다.
                                            </div>
                                           
                                          
                                        </div>
                                        <div class="func">
                                            <button class="btn btn-cancel">뒤로가기</button>
                                           
                                        </div>
                                    </form> 
                                    <br><br>
                                    

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
</body>
</html>