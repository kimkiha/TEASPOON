<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_address1.css">
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
                                    <img src="">
                                </div>
                            </div>
                            <div class="user_info" style="width:450px;">
                                <table class="detail_tb" cellpadding="0" cellspacing="0"  >
                                    <tr class="d1">
                                        <td width="60" name="username"><%=loginUser.getUserName() %></td>
                                        <td style="color:#d6ae71; font-size: 15px;" name="usergrade" ><%=loginUser.getGradeName() %></td>
                                    </tr>
                                    <tr class="d2">
                                        <td colspan="2"><a href="#" >회원정보수정</a> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="detail_info2" style="border-left:1px solid #bebbb6; height:inherit;"> 
                                <p class="info_th" >적립포인트</p>
                                <a href="#" ><%=loginUser.getPointPrice() %></a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th">할인쿠폰</p>
                                <a  href="#" ><%=loginUser.getCount() %></a>
                            </div>
                            <div class="detail_info2">
                                <p class="info_th"  >위시리스트</p>
                                <a  href="#" ><%=loginUser.getPcode() %></a>
                            </div>
                        </div>
                        <div id="mypage_menu_tab">
                            <a href="#" class=" float"> 주문배송조회</a>
                            <a href="#" class=" float">공간대여확인</a>
                            <a href="#" class="active float">나의배송지</a>
                            <a href="#" class="float">1:1문의</a>
                            <a href="#" class="float">장바구니</a>
                        </div> 
                        <div class="pagename"></div>
                        <div id="mp_con1">
                           <div class="addresstitle">
                               <div class="adtitle1"><P>배송지추가</P></div>
                               <div></div>
                               <div class="adtitle2"><button onclick="add(this);"id="add">배송지추가</button></div>
                           </div>
                            </div>
                            <table id="mypage_table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th id="address">배송지명</th>
                                        <th id="name">받는분</th>
                                        <th colspan="2"id="address">주소</th>
                                        <th >휴대폰번호</th>
                                        <th >일반전화</th>
                                        <th >선택</th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <tr id="adAdd"class="add">
                                        <td><input type="text" name="" id="address-info"></td>
                                        <td><input type="text" id="name"></td>
                                        <td colspan="2"><input type="address" id="address"></td>
                                        <td><input type="phone" id="phone"></td>
                                        <td><input type="phone" id="tel"></td>
                                        <td>
                                            <di id="func">
                                                <button>확인</button>
                                                <button>취소</button>
                                            </div>
                                            
                                        </td>
                                      
                                    </tr>
                                    
                                </tbody>
                            </table>
                            <div class="non-address">
                                <p>등록된 배송지가 없습니다</p>
                            </div>
                            <div class="my-ad">
                                <div><p>*연락처등록시 - 입력해야합니다</p> </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <!-- //content-->
           <%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
    <script>
        function add(element){
			var tag = document.getElementsByClassName("add");
			for(var i=0 ; i<tag.length ; i++){
				if(element.id+"Add" == tag[i].id)
					tag[i].style.display = "block";
				else
					tag[i].style.display = "none";
			}

		}

    </script>
</body>
</html>