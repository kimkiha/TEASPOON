<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 | Payment</title>
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/payment/space_payment.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">

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
                
                <br><br><div class="dy">대여 확인(1개)</div>
                    <br><hr>
                    <div class="name1">
                        <span class="top1">상품정보</span>
                        <span class="top2">수량</span>
                        <span class="top3">상품가격</span>
                        <span class="top4">적립혜택</span>
                    </div>
                    <hr>
                    <div class="name2">
                        <br><br>
                        <span class="mid1">아카이야(09:30~11:30)</span>
                        <span class="mid2">1개</span>
                        <span class="mid3">32,000원</span>
                        <span class="mid4">960p</span>
                    </div>
                    <br><br><br><br><br>
                    <hr><br>
                    <div class="name3">
                        <span class="bottom1">(+)빔프로젝트</span>
                        <span class="bottom2">1개</span>
                        <span class="bottom3">10,000원</span>
                        <span class="bottom4">300p</span>
                    </div>
                    <br><hr>
                    <br><br>
                    <div class="name4">
                        <span class="foot1">주문고객정보</span>
                        <span class="foot2">고객님의 회원정보가 기본입력 됩니다.</span>
                    </div><br>
                    <hr>
                    <br>
                    <div class="name5">
                        <span class="fname">이름</span>
                        <span class="fname1"><textarea  class="fname1" name="" id="" cols="30" rows="0"></textarea></span>
                    </div>
                    <hr></hr><br>
                    <div class="name6">
                        <span class="fphone">휴대전화</span>
                        <span class="fphone1"><textarea  class="fphone1" name="" id="" cols="30" rows="0"></textarea></span>
                    </div>
                    <hr><br>
                    <div class="name7">
                        <span class="femail">이메일</span>
                        <span class="femail1"><textarea  class="femail1" name="" id="" cols="30" rows="0"></textarea></span>
                    </div>
                    <hr><br><br>
                    <div class="name8">포인트사용</div><br>
                    <hr><br>
                    <div class="name9">
                        <span class="fpoint">티프푼포인트</span>
                        <span class="fpoint1"><textarea  class="femail1" name="" id="" cols="30" rows="0"></textarea></span>
                        <input class="payment" type="submit" value="결제하기">
                    </div>
                    <br><hr>
                
                
                </div>
            </div>
        </div>
        <!-- //content-->
        <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>

</body>
</html>