<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간대여 | TeaSpoon</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/space/space_rental.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/space_rental.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<style>
 #content1 {width:100%; height:1500px; background: #ffffff; }
</style>
</head>
<body>
  <div id="wrap">
        <%@ include file="../common/menubar.jsp" %>
  
        <!-- //header -->
        <div id="banner" style="margin-top:150px">
            <div class="contaniner">기하의 베너존</div>
        </div>
        <!-- //banner -->
        <div id="content">
            <!-- reserv -->
            <div id="content1">
                <div class="contaniner">
                    
                    <!-- 헤더부분 div -->
                    <div class="head-container">티모르(TIMOR)</div>

                    <!-- 예약 슬라이드 div -->
                    <div class="slideshow-container">
                        <!-- 1번사진 -->
                        <div class="mySlides fade">
                          <div class="numbertext">1 / 3</div>
                          <img src="http://placehold.it/300x100" style="width:100%">
                          <div class="text">Caption Text</div>
                        </div>
                        <!-- 2번사진 -->
                        <div class="mySlides fade">
                          <div class="numbertext">2 / 3</div>
                          <img src="http://placehold.it/300x100" style="width:100%">
                          <div class="text">Caption Two</div>
                        </div>
                        <!-- 3번사진 -->
                        <div class="mySlides fade">
                          <div class="numbertext">3 / 3</div>
                          <img src="http://placehold.it/300x100" style="width:100%">
                          <div class="text">Caption Three</div>
                        </div>
                        
                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>
                        
                        </div>
                        <br>
                        <!-- 사진 넘어가는 동그라미 -->
                        <div style="text-align:center">
                          <span class="dots" onclick="currentSlide(1)"></span> 
                          <span class="dots" onclick="currentSlide(2)"></span> 
                          <span class="dots" onclick="currentSlide(3)"></span> 
                        </div> 

                        <!-- 푸터부분 div -->
                        <span>
                            <div class="foot-container">
                                <img src="<%=request.getContextPath() %>/resources/img/space/imo1.png">1인 - 30인 / 면적 - 23㎡ / 컨퍼런스 룸 / 초고속 WIFI  /  공용공간 및 라운지 / 커피와 허브차
                                <div>
                                  <p><label class="btn" for="modal-1">예약하기</label></p>
                                </div>    
                            </div>
                        </span>
                        
                        <input class="modal-state" id="modal-1" type="checkbox" />
                        
                        <div class="modal">
                            <label class="modal__bg" for="modal-1"></label>
                            <div class="modal__inner">
                            <label class="modal__close" for="modal-1"></label>
                            <!-- 안에부분 -->
                            <p><label class="btn1">아카이야</label></p>  <br>
                            <h4>파격적 세련된 인싸들의 공간</h4>
                              <!-- 사진 div 들어가는 공간 --><br>
                              
                              <div class="slideshow-containers">

                                <div class="mySlidet fades" >
                                  <div class="numbertexts">1 / 3</div>
                                  <img src="http://placehold.it/300x100" style="width:100%">
                                  <div class="texts">Caption One</div>
                                </div>
                                
                                <div class="mySlidet fades">
                                  <div class="numbertexts">2 / 3</div>
                                  <img src="http://placehold.it/300x100" style="width:100%">
                                  <div class="texts">Caption Two</div>
                                </div>
                                
                                <div class="mySlidet fades">
                                  <div class="numbertexts">3 / 3</div>
                                  <img src="http://placehold.it/300x100" style="width:100%">
                                  <div class="texts">Caption Three</div>
                                </div>
                                
                                </div>
                                <br>
                                
                                <div style="text-align:center">
                                  <span class="dott"></span> 
                                  <span class="dott"></span> 
                                  <span class="dott"></span> 
                                </div>
                            <br><br>
                            <h5><요금 및 예약 가능 여부 확인></h5>
                            
                            <br>
                           <form id="enrollForm" action="<%= contextPath %>/rentalPayment.sp" method="post"> 
                            <div class="choice"> 
                                <div class="choice1">날짜 선택</div>
                                <div class="choice2">대여 시간</div>
                                <div class="choice3">등급 할인</div>   
                            </div>
                            <span>  
                              <div>
                                <input type="date"  class="date" name="reservDate" id="dateofbirth">
                                
                                <select class="box1" name="reservTime">
                                  <option value="09:30">아카이야 09:30~11:30</option>
                                  <option value="13:00">아카이야 13:00~15:00</option>
                                  <option value="16:30">아카이야 16:30~18:30</option>
                                  <option selected>시간선택</option>          
                                </select>
                                
                                <select class="box2" name="visitNum">
                                  <option value="10">10인 이하</option>
                                  <option value="20">20인 이하</option>
                                  <option value="30">30인 이하</option>
                                  <option selected>인원수</option>
                                </select> 

                                <select class="box3" name="grdeCode">
                                  <option value="vip">VIP 할인</option>
                                  <option selected>없음</option>
                                </select>
                              </div>
                            </span>
                            
                            <br><br>
                            <!-- 대여 정보-->
                            <div class="sb01"><p class="ftm">대여 정보</p><p id="spreadBtn02" class="btn01">세부사항⇲</p></div> 
                            <ul id="hiddenList01" class="example01" style="display: none;">
                               <li class="aka">아카이야 정보 <br><br>
                               	<p>이 공간은 예약시간 초과로부터 분단위 추가요금이 발생합니다.<br></p>
                               	<p>즐거운 모임과 회의 진행을 위해 음식 반입 허용합니다. <br><p>
                               		(매장 내 요리조리 불가), (접시,포크등 대여불가)
                               	</li>
                                
                            </ul>
                            <div class="sb02"><p class="ftm">대여 편의용품</p><p id="spreadBtn03" class="btn02">세부사항⇲</p></div> 
                            <ul id="hiddenList02" class="example02" style="display: none;">
                              <div class="bpf"> 
                                <input type="checkbox" name="good" value="빔프로젝트">빔프로젝트
                                <input type="checkbox" name="good" value="노트북">노트북
                                <input type="checkbox" name="good" value="스마트포인트">스마트포인트
                                <input type="checkbox" name="good" value="앰프">앰프
                              </div>
                            </ul>


                            <br>
                            
                            <div>
                              <div class="perpose"><div class="pert">공간 사용 목적</div></div>
                              <input name="reservReason" class="perposet" id="userText" type="text" placeholder="*필수 입력사항 ex)회의 관련 목적">
                            </div>
                            <br>
                            
                            <input class="cbtn" type="button" value="취소하기" onClick="history.go(0)"> 
                            <input class="ybtn" type="submit" value="예약하기">
                            
                          </form>  
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