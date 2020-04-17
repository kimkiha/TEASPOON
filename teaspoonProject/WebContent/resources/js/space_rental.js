   // 사진 스크립트 부분 js
var slideIndex = 1;
//inner스크립트
var slideIndexx = 0;

window.onload = function(){
	showSlides(slideIndex);	
	showSlide();
}
    
function plusSlides(n) {
	showSlides(slideIndex += n);
}
    
function currentSlide(n) {
	showSlides(slideIndex = n);
}
    
function showSlides(n) {
	var i;
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dots");
		if (n > slides.length) {slideIndex = 1}    
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
			
			slides[i].style.display = "none";  
		}
		for (i = 0; i < dots.length; i++) {
			
			dots[i].className = dots[i].className.replace("active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " " +
				"active";
	}
    
//상세내용 스트립트
    
$(document).ready(function(	

	){ $("#spreadBtn02").click(function(

	){ if($("#hiddenList01").is(":visible")
    
	){ $("#hiddenList01").slideUp(); 
    
	}else{ $("#hiddenList01").slideDown(

	); } 
	}); });

// 상세내용 스트립트2
$(document).ready(function(){ 
	
	$("#spreadBtn03").click(function(){ 
		if($("#hiddenList02").is(":visible")){ 
			$("#hiddenList02").slideUp(); 
	    
		}else{ 
			$("#hiddenList02").slideDown(); 
		} 
	}); 
});



    function showSlide() {
	    var i;
	    var slide = document.getElementsByClassName("mySlidet");
	    var dott = document.getElementsByClassName("dott");
	    for (i = 0; i < slide.length; i++) {
	       slide[i].style.display = "none";  
	    }
	    
    	slideIndexx++;
    	if (slideIndexx > slide.length) {slideIndexx = 1}    
    	for (i = 0; i < dott.length; i++) {
    		
    		dott[i].className = dott[i].className.replace(" actives", "");
    	}

    	slide[slideIndexx-1].style.display = "block";  
    	dott[slideIndexx-1].className += " actives";
    	setTimeout(showSlide, 2000); // 사진바뀌는 속도 2초
    }