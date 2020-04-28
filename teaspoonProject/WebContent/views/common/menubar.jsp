<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.teaspoon.member.model.vo.Member, com.teaspoon.board.model.vo.*"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>menubar</title>
<script>
	$(function(){
			//자바의 변수를 담아올떄는 반드시 ""로 감싸주어야한다.
			var message = "<%=msg%>";
			//자바에서 자바스트립트에 담을 때 null이면 "null"로 담기기떄문에 아래처럼 비교
			if(message != "null"){
			alert(message);				
			}			
			//회원가입 성공시 session의 msg에 계속 메세지가 담겨있음으로 
			//어느창을 가던 menubar.jsp가 실행되면 계속  alert메소드가 실행된다.
			//그러므로 msg를 비워주어야만 1회성으로 실행
			<%session.removeAttribute("msg");%>
	});
</script>
</head>
<body>

        <div id="header">
            <div id="header_wrap">
                <div id="header_1">
                    <a href="<%=contextPath%>/index.jsp"><img id="home-logo" src= "<%=contextPath%>/resources/img/main/logo.png"></a>
                </div>
                <div id="header_2">
                    <ul id="navi">
                        <li><a class="list store" href="<%=contextPath%>/coffee.st?currentPage=1">스토어</a>
                            <ul class="ul">
                                <li><a href="<%=contextPath%>/coffee.st?currentPage=1">커피</a></li>
                                <li><a href="<%=contextPath%>/storeBest.st">금주의 베스트</a></li>
                                <li><a href="<%=contextPath%>/item.st?currentPage=1">컵 & 아이템</a></li>
                            </ul>
                        </li>
                        <li><a class="list recommend" href="">맞춤추천</a>
                        <li><a class="list event" href="<%=contextPath%>/eventList.bo">이벤트</a>
                            <ul class="ul ">
                                <li><a href="<%=contextPath%>/eventList.bo">이벤트</a></li>
                                <li><a href="<%=contextPath%>/instagram.bo">인스타그램</a></li>
                            </ul>
                        </li>
                        <li><a class="list about" href="<%=contextPath%>/about.bo">어바웃티스푼</a>
                            <ul class="ul">
                                <li><a href="<%=contextPath%>/about.bo">브랜드스토리</a></li>
                                <li><a href="<%=contextPath%>/magazineList.bo?currentPage=1">매거진</a></li>
                            </ul>
                        </li>
                        <li><a class="list rent" href="<%=contextPath%>/rental.sp">공간대여</a>
                            <ul class="ul">
                                <li><a href="<%=contextPath%>/rental.sp">예약하기</a></li>
                                <li><a href="<%=contextPath%>/maps.sp">찾아오는길</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div id="header_3">
                    <img id="search_icon" src="<%=contextPath%>/resources/img/main/search.png">
                    <div id="search_wrap" style="display:none">
	                    <div id="search">
		                    <form id="search_item" action="searchItem.st" method="post">
		                    <input type='hidden' name='currentPage' value='1'>
		                        <div class="search_form">
		                        	<input type="text" name="keyword" class="search">
		                        	<button type="submit" class="search_btn">검색</button>
		                        </div>
		                    </form>
	                    </div>
	                </div>
                    <img id="myPage_icon" src="<%=contextPath%>/resources/img/main/mypage.png">
                    <a href="<%=contextPath %>/mycart.me" id="basket_icon"><img src="<%=contextPath%>/resources/img/main/cart.png"></a>
                    <div class="header_mypage" >
                        <ul>
                        <% if(loginUser == null){ %>
                            <li id="login_li"><button id="login">로그인</button></li>
                            <%}else{ %> 
                            <li style="padding:20px 0"><b><%= loginUser.getUserName() %></b>님  환영합니다.<br>
                            <a id="logout">로그아웃</a>
                            <a href="<%= contextPath %>/logout.me" style="padding-bottom:10px"></a></li>
                            <li><a href="<%=contextPath %>/mymain.me">마이티스푼</a></li>
                            <li>나의 배송 조회</li>
                            <li><a href="<%=contextPath%>/mypoint.me?currentPage=1">적립포인트</a></li>
                            <li>할인쿠폰</li>
                            <li><a href="<%=contextPath %>/wishList.me">위시리스트</a></li>
                            <li style="border-bottom: none;"><a href="<%=contextPath %>/myqna.me?currentPage=1">1:1문의</a></li>
                            <%} %>
                        </ul>
                    </div>
                </div>
            </div>
       </div>
        <!-- //header -->
    
    <script>
        $(function(){
            $("#login").click(function(){
            	var result = window.confirm("로그인하시겠습니까?");
            
	            if(result){
	            	location.href = "<%=contextPath%>/loginPage.me";
	            }
            });  
            
            $("#navi li").hover(function(){
                $(".ul", this).slideDown(250);
            },function(){
                $(".ul", this).slideUp(250);
            });
            
            $("#myPage_icon").click(function(){
                var p = $(this).next().next(); //해당 p요소 
                if(p.css("display") == "none"){ //css("속성명")속성명만 작성시 속성값 리턴
                    p.slideDown("fast"); 
                }else{
                	p.slideUp("slow");
                }
                
             });
            
           $("#logout").click(function(){
            	var result1 = window.confirm("로그아웃 하시겠습니까?");
            
                if(result1){
                	location.href = "<%=contextPath%>/logout.me";
                } 
           	});
           
           $("#search_icon").click(function(){
               var p = $(this).next(); //해당 p요소 
               if(p.css("display") == "none"){ //css("속성명")속성명만 작성시 속성값 리턴
                   p.slideDown("slow"); 
               }else{
               	p.slideUp("slow");
               }
            });
           
           
        });

    </script>
</body>
</html>