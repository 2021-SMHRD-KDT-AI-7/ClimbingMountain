
var dep1;
var dep2;

jQuery(function($){
	/* *********************** PC NAV ************************ */
	var $openMenu = $(".cm-top-menu");
	// PC
	var $gnb = $("#gnb");
	var $gnbList = $("#gnb > ul");
	var $gnb_dep1 = $("#gnb > ul > li");
	var $gnb_dep2 = $("#gnb > ul > li .gnb-2dep");
	var $gnbBg = $('.gnb-overlay-bg');
	var $snb = $(".snb");
	var $snb_3dep = $(".snb-3dep");
	// 모바일
	var $menuBtn = $("#header .nav-open-btn");
	var $gnbM = $("#gnbM");
	var $gnbMList = $gnbM.find("#navigation").children("li");
	var $gnbMNavIn = $('.gnb-navigation-inner');
	var $gnbMBg = $('.gnb-overlay-bg-m');
	var menuState = false;
	
	// 모바일 gnb열린 후 창 크게했을때 스크롤바 생성
	$(window).resize(function  () {
		var win_width = $(window).outerWidth(); 
		if ( menuState  ) {
			if ( win_width > 1200 ) {
				$("body").css({'height':'auto', 'overflow':'auto'});
			}
		}
		$gnbMNavIn.height(window.innerHeight-60);
	});
	$gnbMNavIn.height(window.innerHeight-60);

	gnb_each_on();

	// gnb 각각메뉴
	function gnb_each_on () {
		$gnbList.children("li").children("a").on("mouseenter focus",function  () {
			// console.log(gnb_height);
			$("#header").addClass("over");
			$("#gnbBg").addClass("open");
			$gnbList.children("li").removeClass("on").children(".gnb-2dep").removeClass("show");//.hide();
			$(this).parent("li").addClass("on").children(".gnb-2dep").addClass("show");//.children(".gnb-2dep").fadeIn(200);
			$gnbBg.stop().fadeIn();
		})
		
		$gnbList.on("mouseleave",gnb_return);
		$gnbList.find("a").last().on("focusout",gnb_return);
		
		function gnb_return () {
			if (!$gnb.find('*').is(':animated')) {
				$("#header").removeClass("over");
				$("#gnbBg").removeClass("open");
				//$gnbList.children("li").removeClass("on").children(".gnb-2dep").hide();
				$gnbList.children("li").removeClass("on").children(".gnb-2dep").removeClass("show");
				$gnbBg.stop().hide();
			}
			if ( dep1 > 0 && dep2 ) {
				$gnbList.children("li").eq(dep1-1).addClass("active");
			}
		}
	}
	
	
	// gnb 2차 메뉴에 마우스 올렸을때 대메뉴 on
	$gnb_dep2.hover(function(){
		$(this).parent("li").addClass("on");
	},function  () {
		$gnb_dep1.removeClass("on");
	});

	// 서브메뉴에서 해당메뉴 on
	if ( dep1 > 0 && dep2 > 0) {
		$gnbList.children("li").eq(dep1-1).addClass("active");
		$gnbMList.eq(dep1-1).addClass("on");
		$snb.each(function  () {
			$(this).find("li").eq(dep2-1).addClass("on");
		});
		$snb_3dep.each(function  () {
			$(this).find("li").eq(dep3-1).addClass("on");
		});
	}
	
	/* *********************** MOBILE NAV ************************ */
	$menuBtn.click(function  () {
		if ( menuState ) {
			menuClose();
			menuState = false;
			$(this).removeClass("active");
		}else {
			menuOpen();
			menuState = true;
			$(this).addClass("active");
		}
		return false;
	});

	$gnbMBg.click(function  () {
		menuClose();
		menuState = false;
		$menuBtn.removeClass("active");
	});

	/* 메뉴열기 */ 
	function menuOpen () {
		$gnbM.addClass("open");
		$gnbMBg.fadeIn();
		$(".header-lang").addClass("mobile-gnb-open");
		$("body").css({'height':$(window).height(), 'overflow':'hidden'});
		$(".logo").hide();
	}
	/* 메뉴닫기 */ 
	function menuClose () {
		$gnbM.removeClass("open");
		$gnbMBg.hide();
		$(".header-lang").removeClass("mobile-gnb-open");
		$("body").css({'height':'auto', 'overflow':'auto'});
		$(".logo").show();
	}
	
	/* GNB MOBILE 2DEPTH 클래스 붙이기  */ 
	$("#navigation > li:has('.gnb-2dep')").addClass("has-2dep");
	$("#navigation > li:has('.gnb-2dep')").each(function  () {
		$(this).children("a").append("<span class='gnb-icon close-icon'><i class='xi-angle-down'></i></span>");
	});

	/* GNB MOBILE 2DEPTH 오픈 */ 
	$("#navigation > li:has('.gnb-2dep')").children("a").click(function(event){
		/* 2dep가 열려있을때 */		
		if ( $(this).parent("li").hasClass("active") ){
			$(this).parent("li").removeClass("active");
			$(this).siblings(".gnb-2dep").slideUp(400);					
		}
		/* 2dep가 닫혀있을때 */ 
		else{	  
			$("#navigation > li").has(".gnb-2dep").each(function() {
				if ( $(this).hasClass("active") ){
					$(this).removeClass("active");
					$(this).children(".gnb-2dep").slideUp(400);
				}
			});	
			$(this).parent("li").addClass("active");
			$(this).siblings(".gnb-2dep").slideDown(400);
		}
		return false;
	});
	
	$("#navigation > li > ul > li:has('.gnb-3dep')").children("a").click(function(event){
		/* 3dep가 열려있을때 */		
		if ( $(this).parent("li").hasClass("active") ){
			$(this).parent("li").removeClass("active");
			$(this).siblings(".gnb-3dep").slideUp(400);					
		}
		/* 3dep가 닫혀있을때 */ 
		else{	  
			$("#navigation > li > ul > li").has(".gnb-3dep").each(function() {
				if ( $(this).hasClass("active") ){
					$(this).removeClass("active");
					$(this).children(".gnb-3dep").slideUp(400);
				}
			});	
			$(this).parent("li").addClass("active");
			$(this).siblings(".gnb-3dep").slideDown(400);
		}
		return false;
	});
	
	/* 해당페이지의 GNB 모바일 2depth 열기 & ON  */
	if ( dep1> 0 && dep2> 0 ) {
		$("#navigation > li").eq(dep1-1).addClass("active").children(".gnb-2dep").show().children("li").eq(dep2-1).addClass("active").children(".gnb-3dep").show().children("li").eq(dep3-1).addClass("on");
	}

	/* *********************** PC, 모바일 공통 ************************ */
	/* ------------------------
	*** 서브 상단 location (1차, 2차) 하위메뉴 ON & 열기 *** 
	------------------------ */ 
	$openMenu.find(".menu-location").each(function  () {
		// 클릭할때 펼치기
		$(this).find(".cur-location").click(function  (e) {
			e.preventDefault();
			
			$(".menu-location").find(".cur-location").not($(this)).removeClass("open");
			$(".menu-location").find(".location-menu-con").not($(this).siblings()).hide();

			$(this).toggleClass("open");
			$(this).siblings(".location-menu-con").slideToggle();

			return false;
		});
		// 2depth ON
		if ( $(this).is(".location1") ) {
			$(this).find(".location-menu-con").find("li").eq(dep1-1).addClass("on");
		}else if ( $(this).is(".location2") ) {
			$(this).find(".location-menu-con").find("li").eq(dep2-1).addClass("on");
		}else  {
			$(this).find(".location-menu-con").find("li").eq(dep3-1).addClass("on");
		}
	});
	
	$("#wrap").click(function  () {
		$(".menu-location").find(".cur-location").removeClass("open");
		$(".menu-location").find(".location-menu-con").hide();
	});

	
});
