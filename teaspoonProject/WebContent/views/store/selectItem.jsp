<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Advice | TeaSpoon</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/store/selectItem.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/reset1.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet"
	href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
#banner {
	height: 170px;
	line-height: 170px;
	background: url("패턴 - 복사본.jpg") center top repeat-x;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/menubar.jsp"%>
		<!-- //header -->
		<div id="banner">
		
			<div class="contaniner">
				<div style="height:30px;"></div>
				<div>
					<p id="head_title">맞춤추천</p>

				</div>
				<div>
					<img id="head_img" src="<%=contextPath %>/resources/img/store/storetop_coffee.jpg" width="1200"
						height="270">
				</div>
			</div>
		</div>
		<!-- //banner -->
		<div id="content">
			<!-- select -->
			<div class="select-wrap">
				<div class="select-start">
					<div class="select-start1">
						<button id="btn1">시작하기</button>
					</div>
				</div>
				<!-- select item-->
				<div class="subscription" id="div1">
					<div class="subscription-section">
						<div class="select-list">
							<div class="select-item">
								<div class="select-img" border="1">
									<img src="<%=contextPath %>/resources/img/store/product5_1.jpg"
										width="250" height="200">
								</div>
								<div class="select-title" border="1">
									<div>
										<p>원두</p>
									</div>
								</div>
								<div class="select-text" border="1">
									<div>
										매일로스팅해서<br> 신선한로스팅커피
									</div>
								</div>
								<div class="select-btnwrap" border="1">
									<button onclick="showDiv(this);" id="blend">선택</button>
								</div>
							</div>
							<div class="select-item">
								<div class="select-img" border="1">
									<img
										src="<%=contextPath %>/resources/img/store/product8_1.jpg"
										width="250" height="200">
								</div>
								<div class="select-title" border="1">
									<div>
										<p>드립백</p>
									</div>
								</div>
								<div class="select-text" border="1">
									<div>
										뜨거운 물만 있으면<br> 되는 간편한 드립커피
									</div>
								</div>
								<div class="select-btnwrap" border="1">
									<button onclick="showDiv(this);" id="dripbag">선택</button>
								</div>
							</div>
							<div class="select-item">
								<div class="select-img" border="1">
									<img
										src="<%=contextPath %>/resources/img/store/product2_1.jpg"
										width="250" height="200">
								</div>
								<div class="select-title" border="1">
									<div>
										<p>콜드브루</p>
									</div>
								</div>
								<div class="select-text" border="1">
									<div>
										냉장고에서 꺼내<br> 차갑게 따라마시는 커피원액
									</div>
								</div>
								<div class="select-btnwrap" border="1">
									<button onclick="showDiv(this);" id="coldbrew">선택</button>
								</div>
							</div>

						</div>
						<div class="l"></div>
						<!-- 1-1번 select  blend -->

						<div id="blendBox" class="box select2-wrap" border="1">
							<div class="select2-title " id="blendsignature">어떤맛을
								좋아하세요?</div>
							<div class="select-list2">
								<div class="select-item2">
									<div class="select-img" border="1">
										<img src="<%=contextPath %>/resources/img/store/product4_1.jpg" 
										width="250" height="200">
									</div>
									<div class="select-title2" border="1">
										<div>
											<p>티스푼 오리지날</p>
										</div>
										<div>
											<span>추천 싱글오리진</span>
										</div>
									</div>
									<div class="select-text2" border="1">
										<div>
											세계 각지에서 찾은 보석같은<br> 싱글오리진.
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button onclick="bean(this)" id="orignal">선택</button>
									</div>
								</div>
								<div class="select-item2">
									<div class="select-img" border="1">
										<img src="<%=contextPath %>/resources/img/store/product13_1.jpg" width="250" height="200">
									</div>
									<div class="select-title2" border="1">
										<div>
											<p>블랙수트</p>
										</div>
										<div>
											<span>시그니처 블렌드</span>
										</div>
									</div>
									<div class="select-text2" border="1">
										<div>
											견과류의 고소한 맛과 .다크초콜릿<br> 처럼 묵직한 시그니처 블렌드. <br>

										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button onclick="bean(this)" id="blacksuit">선택</button>
									</div>
								</div>
								<div class="select-item2">
									<div class="select-img" border="1">
										<img src="<%=contextPath %>/resources/img/store/product12_1.jpg" width="250" height="200">
									</div>
									<div class="select-title2" border="1">
										<div>
											<p>벨벳화이트</p>
										</div>
										<div>
											<span>시그니처 블렌드</span>
										</div>
									</div>
									<div class="select-text2" border="1">
										<div>
											자몽같은 과일향이 풍부합니다. <br> 홍차처럼 깔끔한 시그니처 블렌드.<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button onclick="bean(this)" id="velvetwhite">선택</button>
									</div>
								</div>

							</div>

						</div>
						<!--                 2_2  dripbag -->
						<div class="box select2-wrap " id="dripbagBox" width="1200"
							height="550" border="1"">
							<div class="select2-title " id="drip">어떤맛을 좋아하세요?</div>
							<div class="select-list2">
								<div class="select-item2">
									<div class="select-img" border="1">
										<img src="<%=contextPath %>/resources/img/store/nutty.jpg" width="250" height="200">
									</div>
									<div class="select-title2" border="1">
										<div>
											<p>Nutty</p>
										</div>
										<div>
											<span>시그니처 블렌드</span>
										</div>
									</div>
									<div class="select-text2" border="1">
										<div>
											견과류의 고소한 맛이<br> 입안 가득 퍼집니다<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button onclick="bag(this);" id=nutty>선택</button>
									</div>
								</div>
								<div class="select-item2">
									<div class="select-img" border="1">
										<img
											src="<%=contextPath %>/resources/img/store/fruty.jpg"
											width="250" height="200">
									</div>
									<div class="select-title2" border="1">
										<div>
											<p>Furity</p>
										</div>
										<div>
											<span>시그니처 블렌드</span>
										</div>
									</div>
									<div class="select-text2" id="#dr" border="1">
										<div>
											오렌지와 자몽같은 과일향이<br> 풍부한 커피입니다.
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button onclick="bag(this);" id="furity">선택</button>
									</div>
								</div>
								<div class="select-item2">
									<div class="select-img" border="1">
										<img src="<%=contextPath %>/resources/img/store/nuttynpruty.jpg" width="250" height="200">
									</div>
									<div class="select-title2" border="1">
										<div>
											<p>Nutty & Fruity</p>
										</div>
										<div>
											<span>시그니처 블렌드 2가지</span>
										</div>
									</div>
									<div class="select-text2" border="1">
										<div>
											고소하고 묵직한 맛 & 과일처럼<br> 화사한 맛을 가진 커피입니다.
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button onclick="bag(this);" id="nf">선택</button>
									</div>
								</div>

							</div>

						</div>
						<!-- 2-2 end 결제 페이지-->

						<!-- 3-1 price select blendcoffee  -->
						<div class="coffee select3-wrap " id="orignalCoffee">
							<div class="select3-title " id="orignalprice">얼마만큼씩 보내드릴까요?
							</div>
							<div class="select-list3">
								<div class="select-item3">
									<div class="select-img" border="1">
										<img src="2.맞춤추천/이달의 티스푼.png" width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>200g</p>
										</div>
									</div>
									<div class="select-text3">
										<div>
											<p class="t">15000원</p>
										</div>
										<div>
											<p>
												<s>정가 16,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>

								<div class="select-item3">
									<div class="select-img" border="1">
										<img src="2.맞춤추천/정기-원두.jpg" width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>400g</p>
										</div>
									</div>
									<div class="select-text3" border="1">
										<div>
											<p class="t">25,500원</p>
										</div>
										<div>
											<p>
												<s>정가 27,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>
							</div>
						</div>
						<!--  blacksuit price -->
						<div class="coffee select3-wrap " id="blacksuitCoffee">
							<div class="select3-title " id="blacksuitprice">얼마만큼씩
								보내드릴까요?</div>
							<div class="select-list3">
								<div class="select-item3">
									<div class="select-img" border="1">
										<img src="2.맞춤추천/블랙수트.png" width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>200g</p>
										</div>
									</div>
									<div class="select-text3">
										<div>
											<p class="t">15000원</p>
										</div>
										<div>
											<p>
												<s>정가 16,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>

								<div class="select-item3">
									<div class="select-img" border="1">
										<img src="2.맞춤추천/정기-400g.png" width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>400g</p>
										</div>
									</div>
									<div class="select-text3" border="1">
										<div>
											<p class="t">25,500원</p>
										</div>
										<div>
											<p>
												<s>정가 27,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>
							</div>
						</div>
						<!-- velvetwhite coffee -->
						<div class="coffee select3-wrap " id="velvetwhiteCoffee">
							<div class="select3-title " id="velvetwhiteprice">얼마만큼씩
								보내드릴까요?</div>
							<div class="select-list3">
								<div class="select-item3">
									<div class="select-img" border="1">
										<img src="2.맞춤추천/벨벳화이트.png" width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>200g</p>
										</div>
									</div>
									<div class="select-text3">
										<div>
											<p class="t">15000원</p>
										</div>
										<div>
											<p>
												<s>정가 16,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>

								<div class="select-item3">
									<div class="select-img" border="1">
										<img src="2.맞춤추천/정기-원두.jpg" width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>400g</p>
										</div>
									</div>
									<div class="select-text3" border="1">
										<div>
											<p class="t">25,500원</p>
										</div>
										<div>
											<p>
												<s>정가 27,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 2-2-1 price select dripbag -->
						<div class="select3-wrap bag" id="nuttyBag" border="1">
							<div class="select3-title " id="nuttyprice">얼마만큼씩 보내드릴까요?</div>
							<div class="select-list3">
								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="C:\4_FrontEnd\작업은 여기서 해보자\selectItem\2.맞춤추천\티백상자.png"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>1 Box|8개입</p>
										</div>
									</div>
									<div class="select-text3">
										<div>
											<p class="t">11,500원</p>
										</div>
										<div>
											<p>
												<s>정가 12,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>

								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="C:\4_FrontEnd\작업은 여기서 해보자\selectItem\2.맞춤추천\티백상자 2개짜리.png"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>2 Box|16개입</p>
										</div>
									</div>
									<div class="select-text3" border="1">
										<div>
											<p class="t">22,500원</p>
										</div>
										<div>
											<p>
												<s>정가 24,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 2-2-2 price select dripbag -->
						<div class="select3-wrap bag" id="furityBag" border="1">
							<div class="select3-title " id=furityprice>얼마만큼씩 보내드릴까요?</div>
							<div class="select-list3">
								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="C:\4_FrontEnd\작업은 여기서 해보자\selectItem\2.맞춤추천\티백상자.png"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>1 Box|8개입</p>
										</div>
									</div>
									<div class="select-text3">
										<div>
											<p class="t">11,500원</p>
										</div>
										<div>
											<p>
												<s>정가 12,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>

								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="C:\4_FrontEnd\작업은 여기서 해보자\selectItem\2.맞춤추천\티백상자 2개짜리.png"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>2 Box|16개입</p>
										</div>
									</div>
									<div class="select-text3" border="1">
										<div>
											<p class="t">22,500원</p>
										</div>
										<div>
											<p>
												<s>정가 24,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 2-2-3 price select dripbag -->
						<div class="select3-wrap bag" id="nfBag" border="1">
							<div class="select3-title" id="nfprice">얼마만큼씩 보내드릴까요?</div>
							<div class="select-list3">
								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="C:\4_FrontEnd\작업은 여기서 해보자\selectItem\2.맞춤추천\티백상자.png"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>1 Box|8개입</p>
										</div>
									</div>
									<div class="select-text3">
										<div>
											<p class="t">11,500원</p>
										</div>
										<div>
											<p>
												<s>정가 12,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>

								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="C:\4_FrontEnd\작업은 여기서 해보자\selectItem\2.맞춤추천\티백상자 2개짜리.png"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>2 Box|16개입</p>
										</div>
									</div>
									<div class="select-text3" border="1">
										<div>
											<p class="t">22,500원</p>
										</div>
										<div>
											<p>
												<s>정가 24,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 3-3 price selectcoldbrew-->
						<div class="box select3-wrap " id="coldbrewBox" border="1">
							<div class="select3-title " id="coldbrewprice">얼마만큼씩
								보내드릴까요?</div>
							<div class="select-list3">
								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="C:\4_FrontEnd\작업은 여기서 해보자\selectItem\2.맞춤추천\정기-콜브.jpg"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>500ml</p>
										</div>
									</div>
									<div class="select-text3">
										<div>
											<p class="t">14000원</p>
										</div>
										<div>
											<p>
												<s>정가 15,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>

								<div class="select-item3">
									<div class="select-img" border="1">
										<img
											src="<%=contextPath %>/resources/img/store/product2_2.jpg.jsp"
											width="250" height="200">
									</div>
									<div class="select-title3" border="1">

										<div>
											<p>1000ml</p>
										</div>
									</div>
									<div class="select-text3" border="1">
										<div>
											<p class="t">26,500원</p>
										</div>
										<div>
											<p>
												<s>정가 28,000원</s>
											</p>
											<br>
										</div>
									</div>
									<div class="select-btnwrap" border="1">
										<button>선택</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 3-3 end-->
					</div>
				</div>

			</div>



		</div>

		<!-- //content-->

		<!-- //footer-->

	</div>
	<%@ include file="../common/footer.jsp"%>
	<script>
    /* display */
        function showDiv(element){
        	var bag = document.getElementsByClassName("bag");
        	for(var i=0; i<bag.length; i++){
        		bag[i].style.display = "none";
        	}
        	
        	var coffee = document.getElementsByClassName("coffee");
        	for(var i=0; i<coffee.length; i++){
        		coffee[i].style.display = "none";
        	}
    	
			var tag = document.getElementsByClassName("box");
			for(var i=0 ; i<tag.length ; i++){
				if(element.id+"Box" == tag[i].id)
					tag[i].style.display = "block";
				else
					tag[i].style.display = "none";
			}

		}
        function bean(element){
        	var bag = document.getElementsByClassName("bag");
        	for(var i=0; i<bag.length; i++){
        		bag[i].style.display = "none";
        	}
        	
			var tag = document.getElementsByClassName("coffee");
			for(var i=0 ; i<tag.length ; i++){
				if(element.id+"Coffee" == tag[i].id)
					tag[i].style.display = "block";
				else
					tag[i].style.display = "none";
			}
		}
        function bag(element){
        	var coffee = document.getElementsByClassName("coffee");
        	for(var i=0; i<coffee.length; i++){
        		coffee[i].style.display = "none";
        	}
        	
			var tag = document.getElementsByClassName("bag");
			for(var i=0 ; i<tag.length ; i++){
				if(element.id+"Bag" == tag[i].id)
					tag[i].style.display = "block";
				else
					tag[i].style.display = "none";
			}
		}    
    
    /*scroll move*/
    /* 처음 원두 드립백 콜드브루 */ 
    $(document).ready(function(){
    $('#btn1').click(function(){
        var offset = $('#div1').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    $(document).ready(function(){
    $('#blend').click(function(){
        var offset = $('#blendsignature').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    $(document).ready(function(){
    $('#dripbag').click(function(){
        var offset = $('#drip').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    /*콜드브루 */
    $(document).ready(function(){
    $('#coldbrew').click(function(){
        var offset = $('#coldbrewprice').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    /* 원두 3종*/
    $(document).ready(function(){
    $('#orignal').click(function(){
        var offset = $('#orignalprice').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    $(document).ready(function(){
    $('#blacksuit').click(function(){
        var offset = $('#blacksuitprice').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    $(document).ready(function(){
    $('#velvetwhite').click(function(){
        var offset = $('#velvetwhiteprice').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    /* 드립백 3종 */
    $(document).ready(function(){
    $('#nutty').click(function(){
        var offset = $('#nuttyprice').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    $(document).ready(function(){
    $('#furity').click(function(){
        var offset = $('#furityprice').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    $(document).ready(function(){
    $('#nf').click(function(){
        var offset = $('#nfprice').offset(); 
        $('html,body').animate({scrollTop : offset.top}, 1000);
    });
    });
    






    </script>
</body>
</html>