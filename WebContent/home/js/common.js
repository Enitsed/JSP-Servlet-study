$(function() {
	/* 로그인 버튼 */
	$(".login_wrap>a").on("click", function() {
		$('#login_f').animate({
			top : "20px"
		}, 500);
		return false;
	});// ///////////////

	/* 로그인 닫기 */
	$(".login_wrap .login_close_btn, input[alt='로그인버튼']").on("click",
			function() {
				$('#login_f').animate({
					top : "-500px"
				}, 500);
				return false;
			});// ///////////////

	/* 아이디, 비밀번호에서 포커스를 받으면 */
	$('#user_id, #user_pw').on("focus", function() {
		$(this).prev().css({
			left : "-3000px"
		});
	});

	/* 아이디, 비밀번호가 포커스를 잃으면 */
	$('#user_id, #user_pw').on('blur', function() {
		if ($(this).val() == "")
			$(this).prev().css({
				"left" : "2px"
			});
	});/////////////////////
	
	/* 인쇄 버튼 */
	$(".print_btn").on("click", function() {
		window.print();
		return false;
	});///////////////////	
	
	
	
	/* GNB 메뉴 */
	var beforeEl;	
	/*$('#gnb>li:eq(1)>a>img').attr('src',
			$('#gnb>li:eq(1)>a>img').attr('src')
			    .replace('out.gif','over.gif'));
	
	$('#gnb>li:eq(1)>a').next().stop().slideDown('normal');
	beforeEl=$('#gnb>li:eq(1)>a');*/
	
	$('#gnb>li>a').on('mouseover focus',function(){
		if(beforeEl){
			$('img',beforeEl).attr('src',
					$('img',beforeEl).attr('src')
					.replace('over.gif','out.gif'));
			
		   $(beforeEl).next().stop().slideUp('fast');			
		}                       
		
		$('img',this).attr('src',
				$('img',this).attr('src')
				.replace('out.gif','over.gif'));
		
	   $(this).next().stop().slideDown('normal');
	   beforeEl=$(this);
	});
	
	
	$("#gnb").on('mouseleave',function(){
		$("#gnb ul:visible").slideUp("fast");
		if (beforeEl)
			beforeEl.children("img").attr("src",
			 beforeEl.children("img").attr("src")
			 .replace("over.gif", "out.gif"));
	});/////////////////////
	
	/* 전체메뉴 */
	$('#total_btn a').on('click',function(){
		$('#total_menu').slideDown('normal');
		$('img',this).attr('src',$('img',this).attr('src')
				     .replace('out.gif','over.gif'));
		return false;
	});///////////////////////////////
	
	/* 전체 메뉴 닫기 버튼 */
	$('#total_close a').on('click',function(){
		$('#total_menu').slideUp('fast');
		$('#total_btn a img').attr('src',
				$('#total_btn a img').attr('src')
			    .replace('out.gif','over.gif'));		
	});//////////////////////////////
	
	/* 날짜 표기 */
	var t = new Date();
	var y = t.getFullYear();
	var m = t.getMonth();
	var d = t.getDate();

	$('#date_wrap .year').text(y);
	$('#date_wrap .month').text(m + 1);
	$('#date_wrap .date').text(d);
	////////////////////////////////////////////////
	
	/*관련 사이트 이동*/
	$('form[name=rel_f]').on('submit',function(){
		var url=$('select',this).val();		
		window.open(url);
		return false;
	});////////////////////////////////
	
	/*퀵 메뉴*/
	 var defaultTop=parseInt($('#quick_menu').css("top"));
	 $(document).on('scroll',function(){
		 var scv=$(document).scrollTop();
		 $('#quick_menu').stop()
	      .animate({top:scv+defaultTop},1000);
	 });
	
	
});












