$(function(){
	/* 터치 슬라이드 비주얼 영역 */
	window.mySwipe=$('#mySwipe').Swipe({
		auto : 3000, // 배너가 3초 간격으로 이동합니다.
		continuous : true, // 반복해서 롤링됩니다.
		callback:function(index, element){
			//alert(index, element);
			/*
			 * 클래스 "active"를 포함하는 불릿 버튼을 비활성화 버튼으로 만들고, 
			 * "active" 클래스를 삭제합니다.
			 */
			$('.touch_bullet .active').attr('src',
					$('.touch_bullet .active').attr('src')
					.replace('on.png','off.png')).removeClass('active');
			
			/*
			 * 인덱스(index)에 해당하는 불릿 버튼을 활성화된 버튼으로 만들고, 
			 * "active" 클래스를 생성합니다.
			 */
			$('.touch_bullet img').eq(index).attr('src',
					$('.touch_bullet img').eq(index).attr('src')
					.replace('off.png','on.png')).addClass('active');	
		}
	}).data('Swipe');////////////////////////
	
	// 이전 버튼을 누를 때마다...
	/* 비주얼 이전, 다음 버튼 */
	$('.touch_left_btn a').on('click',function(){
		mySwipe.prev(); // 이전 배너로 이동합니다.
		return false; // 링크를 차단합니다.
	});
	// 다음 버튼을 누를 때마다...
	$('.touch_right_btn a').on('click',function(){
		mySwipe.next(); // 다음 배너로 이동합니다.
		return false; // 링크를 차단합니다.
	});
	/////////////////////////////////////
	
	/* 알림판 롤링 버튼 배너 */
	// 첫 번째 배너를 제외하고 숨김
	$('#roll_banner_wrap dd').not(':first').hide();
	
	// 첫 번째 버튼의 <a>를 저장
	var onBtn=$('#roll_banner_wrap dt a:first');
	//1~4 버튼을 클릭할때...
	$('#roll_banner_wrap dt a').on('click',function(){
		// 노출되어있는 배너를 숨김
		$('#roll_banner_wrap dd:visible').hide();
		
		//onBtn에 하위 요소 <img>에 "src"속성을 비활성화된 이미지 경로바꿈
		$('img',onBtn).attr('src',
				$('img',onBtn).attr('src')
				.replace('over.gif','out.gif'));
		
		// 1~4번 버튼 중 클릭한 버튼 <a>요소에 인덱스 값을 구해옴
		var num = $("#roll_banner_wrap dt a").index(this);
		// 클릭한 버튼에 인덱스 값과 일치하는 <dd>요소만 나타냄
		$('#roll_banner_wrap dd').eq(num).show();
		
		//클릭한 <a>에 하위 <img>에 "src"속성을 활성화된 버튼 이미지 경로로 바꿈
		$('img',this).attr('src',$('img',this).attr('src')
				.replace('out.gif','over.gif'));
		onBtn=$(this);
		return false;		
	});
	
	var btnNum=0;
	//1~4버튼이 순서대로 강제 클릭 이벤트가 발생되는 함수
	function autoPlay(){
		btnNum++;
		if(btnNum==4)
			btnNum=0;
		
		// 1~4버튼이 btnNum 값에 따라 순서대로 선택되고 강제로 클릭됨.
		$('#roll_banner_wrap dt a').eq(btnNum).trigger('click');
		
		auto1 = setTimeout(autoPlay, 4000);
	}//end autoPlay( )
	
	// 최초 로딩시 3초 이후에 function autoPlay(){ ... }를 실행
	var auto1 = setTimeout(autoPlay, 3000);
	
	//스톱에서 클릭 이벤트가 발생되면...
	$('.stopBtn').on('click',function(){
		//auto1에 할당된 setTimeout()을 제거
		clearTimeout(auto1);
		
		// 스톱 버튼에 "src"속성을 활성화된 버튼이미지로 바꿈.
		$('img',this).attr('src',
				$("img", this).attr("src")
				.replace("off.gif","on.gif"));
		
		// 재생 버튼에 "src"속성을 비활성화된 버튼 이미지로 바꿈.
		$(".playBtn img").attr(
				"src",
				$(".playBtn img").attr("src")
				.replace("on.gif","off.gif"));
		
		return false;
	});
	
	$('.playBtn').on('click',function(){
		// auto1에 할당된 seTimeout을 제거
		clearTimeout(auto1); 
		
		// 1초마다 autoPlay 함수를 실행
		auto1 = setTimeout(autoPlay, 1000);
		
		// 재생 버튼에 "src"속성을 활성화된 버튼 이미지로 바꿈
		$('img', this).attr('src',
						$('img', this).attr('src')
						.replace('off.gif','on.gif'));
		
		// 스톱 버튼에 "src"속성을 비활성화된 버튼이미지로 바꿈
		$('.stopBtn img').attr('src',
					$('.stopBtn img').attr('src')
					.replace('on.gif','off.gif'));
		
		return false; // <a> 링크를 차단
	});
	///////////////////////////////////////	
	
	/* 탭메뉴 */
	// 초기에 활성화된 첫 번째 탭 버튼 <a>만 변수 onTab에 할당
	var onTab = $('#tabmenu dt a:first');
	$('#tabmenu dt a').on('mouseover focus',function(){
		// 현재 보이는 게시물 목록을 숨김
		$("#tabmenu dd:visible").hide(); 
		// 클릭한 <a>에 부모	요소인 <dt>에 다음 요소만 노출시킴
		$(this).parent().next().show();
		//onTab에 할당된 요소의 하위 <img>에 "src" 속성을 비활성화 버튼이미지로 바꿈
		$("img", onTab).attr("src",
			     $("img", onTab).attr("src")
			    .replace("over.gif","out.gif"));
		// 클릭한 <a>에 하위 버튼 이미지를 활성화된 이미지로 바꿈
		$("img", this).attr("src",$("img", this).attr("src")
		          .replace("out.gif","over.gif"));
		 // 클릭할 때 마다 클릭한 요소에 <a>가 onTab에 할당.
		onTab = $(this); 
		
		return false; // 링크를 차단.		
	});
	//////////////////////////////////////////
	/* 더보기 */	
	$('#tabmenu dd p').on('click',function(){	
		var chkP=$('#tabmenu dd p').index(this);
		if(chkP==0)
			window.open('first.html');
		else if(chkP==1)
			window.open('second.html');
		else if(chkP==2)
			window.open('third.html');
	});
	////////////////////////////////////////
	
	/* 베스트북 슬라이더 */
	var mySlider = $("#best_bg ul").bxSlider({
		mode : "horizontal",
		speed : 500,
		pager : false,
		moveSlides : 1,
		slideWidth : 125,
		minSlides : 5,
		maxSlides : 5,
		slideMargin : 30,
		auto : true,
		autoHover : true,
		controls : false
	});
	
	$(".prev_btn").on("click", function() {
		mySlider.goToPrevSlide();
		return false;
	});

	$(".next_btn").on("click", function() {
		mySlider.goToNextSlide();
		return false;
	});
 ///////////////////////////////////////////////////
	/* 팝업 연동 */
	if($.cookie('pop')!='no')
		$('#pop_wrap').show();
	
	$('#pop_wrap').css('cursor', 'move').draggable();
	
	$('#pop_wrap area:eq(0)').on('click', function() {
		$('#pop_wrap').fadeOut('fast');
		return false;
	});
	
	$('#pop_wrap area:eq(1)').on('click',function(){
		$.cookie('pop','no',{expires:1});
		$('#pop_wrap').fadeOut('fast');
		return false;
	});
	
});

















