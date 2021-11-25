jQuery(function($){
	
	$(".history-tab a").click(function(){
		$(this).parent('li').prevAll('li').find('span').css('background-color','#006400');
		$(this).parent('li').nextAll('li').find('span').css('background-color','#222');
		$(this).find('span').css('background-color','#006400');
		return false;
	});
	$(".test li").hover(function(){
		$(this).prev('li').css('width','14%');
		$(this).next('li').css('width','14%');
		$(this).css('width','44%');
	});
	$(".test li").mouseleave(function(){
		$(this).prev('li').css('width','20%');
		$(this).next('li').css('width','20%');
		$(this).css('width','20%');
	});
	equalHeights();
	function equalHeights(){
		$('.ibkbox-list-con').each(function(){
			var highestBox = 0;
			$('.ibkbox-list-box p').each(function(){
				if($(this).height() > highestBox){
					highestBox = $(this).parents('.ibkbox-list-box').height();
				}
				console.log(highestBox);
			});
			$('.ibkbox-list-box p').parents('.ibkbox-list-box').height(highestBox);
		});
	}
	$(window).resize(function (){
		$('.ibkbox-list-con').each(function(){
			var highestBox = 0;
			$('.ibkbox-list-box p').each(function(){
				if($(this).height() > highestBox){
					highestBox = $(this).height();
				}
				console.log(highestBox);
			});
			$('.ibkbox-list-box p').parents('.ibkbox-list-box').height(highestBox + 130);
		});
	});

	
	 $('.private-accordion > li > a').click(function () {
		$(this).parent('li').toggleClass('on');
		$(this).siblings('.pri-acc-box').slideToggle();
		return false;
    });
	
	//이미지 새창 띄우기
    $('.img-box').click(function () {
        var wWidth = window.innerWidth;
        if (wWidth < 800) {
            var imgPopsrc = $(this).children().attr("src");
            window.open(imgPopsrc);
        } else {
            return false;
        }
    });
	/* *********************** 사업영역 :: 개발실적 :: view more ************************ */
	$(".view-btn-box a").on("click",function  () {
		$('.hide-box').show();
		$('.view-btn-box').hide();
		return false;
	});
	
	/* *********************** 스크롤 터치시 커버 사라지게 ************************ */
	$(".stockTbl-wrapper").on("touchmove click",function  () {
		$(this).find(".stockTbl-scrollbar-cover").fadeOut(200);
	});
	
	setTimeout(function  () {
		$("#visual").addClass("active");
	});
	$(window).scroll(function(e){
		
	});
	function parallaxScroll(){
		var scrolled = ($(window).scrollTop() / ($(window).height() * 3)) +1;
		$('.visual-img-con').css('transform','scale('+(scrolled)+')  rotate(0.002deg)');
	}

	/* *********************** 3deps on ************************ */
	if ( dep3 ) {
		$(".sub-tab01-list li").eq(dep3-1).addClass("on")
	}
	$(window).scroll(function  () {
		var scrollHeight = $(window).scrollTop();
		var visualBottom =  $("#visual").offset().top + $("#visual").height();
		var headerSubMenu =  $("#headerSubMenu").height();


		if ( scrollHeight > visualBottom - headerSubMenu) {
			if (!($("#header").hasClass("sub-hidden"))) {	
				$("#header").addClass("sub-hidden");
				$("#headerSubMenu").addClass("fixed");
			}
		}else {
			if ($("#header").hasClass("sub-hidden")) {	
				$("#header").removeClass("sub-hidden");
				$("#headerSubMenu").removeClass("fixed");
			}
		}
	});
	
	var didScroll;
	var lastScrollTop = 0;
	var delta = 5;
	var navbarHeight = $('#header').outerHeight();

	$(window).scroll(function(event){
		didScroll = true;
	});

	setInterval(function() {
		if (didScroll) {
			hasScrolled();
			didScroll = false;
		}
	}, 250);

	function hasScrolled() {
		var st = $(this).scrollTop();
		
		// Make sure they scroll more than delta
		if(Math.abs(lastScrollTop - st) <= delta)
			return;
		
		// If they scrolled down and are past the navbar, add class .nav-up.
		// This is necessary so you never see what is "behind" the navbar.
		if (st > lastScrollTop && st > navbarHeight){
			// Scroll Down
			if ($("#header").hasClass("up")) {	
				$('#header').removeClass('up')
			}

		} else {
			// Scroll Up
			if(st + $(window).height() < $(document).height()) {
				if ($(".fixed-move-tab-list-wrapper").length == 0 ) {
					if (!($("#header").hasClass("up"))) {	
						$('#header').addClass('up')
					}
					if (st < 10) {
						if ($("#header").hasClass("up")) {	
							$('#header').removeClass('up')
						}
					}
				}
			}
		}
		
		lastScrollTop = st;
	}

	if ( $(".fixed-move-tab-list-wrapper").length > 0 ) {
		var $fixedMoveTab = $(".fixed-move-tab-list");
		var $moveTabItem = $fixedMoveTab.find("li");
		var menuCount= $moveTabItem.size();

		$(window).scroll(function  () {
			var scrollHeight = $(window).scrollTop();
			var fixedStartTab =  $(".fixed-move-tab-list-wrapper").offset().top - $("#headerSubMenu").height();
			var fixedStartHeight = $fixedMoveTab.height() + $("#headerSubMenu").height() - 1;

			if ( scrollHeight > fixedStartTab ) {
				if (!($fixedMoveTab.hasClass("fixed"))) {	
					$fixedMoveTab.addClass("fixed");
				}
			}else {
				if ($fixedMoveTab.hasClass("fixed")) {	
					$fixedMoveTab.removeClass("fixed");
				}
			}
			
			if ( $(".fixed-move-tab-link-list").length < 1 ) {
				var nav= new Array();
				for(var i=0;i < menuCount;i++){
					nav[i]="nav"+i;
					nav[i]=$($moveTabItem.eq(i).children("a").attr("href")).offset().top - fixedStartHeight;
				}
				 
				$moveTabItem.each(function  (idx) {
					if( scrollHeight >= nav[idx] ){
						$moveTabItem.removeClass('selected');
						$moveTabItem.eq(idx).addClass('selected');
					};
				});
			
			}
		});
		if ( $(".fixed-move-tab-link-list").length < 1 ) {	
			$moveTabItem.find("a").click(function  () {
				var fixedStartHeight = $fixedMoveTab.height() + $("#headerSubMenu").height() - 1;
				var goDiv = $($(this).attr("href")).offset().top - (fixedStartHeight-1);
				$("html, body").animate({scrollTop:goDiv},300,"swing");
				 
				return false;
			});
		}
	}
	
	if ( $(".fixed-change-tab-list-wrapper").length > 0 ) {
		var $fixedChangeTab = $(".fixed-change-tab-list");
		var $moveTabItem = $fixedChangeTab.find("li");

		var fixedStartTab =  $(".fixed-change-tab-list-wrapper").offset().top - $("#headerSubMenu").height();
	
		$(window).scroll(function  () {
			var scrollHeight = $(window).scrollTop();
			
			if ( scrollHeight > fixedStartTab ) {
				if (!($fixedChangeTab.hasClass("fixed"))) {	
					$fixedChangeTab.addClass("fixed");
				}
			}else {
				if ($fixedChangeTab.hasClass("fixed")) {	
					$fixedChangeTab.removeClass("fixed");
				}
			}

			if ( scrollHeight > $(".fixed-change-tab-list-wrapper").offset().top ) {
				$("#header").addClass("content-menu-fixed");
			}else {
				$("#header").removeClass("content-menu-fixed");
			}
			
		});
	}
	
		var $autoList = $(".auto-height-list-con .auto-height-item");	// ul > li
		var $autoListInner = $autoList.children(".inner-box");
		var heightDiv = ".inner";
		var listNum = $autoList.length;			
		var resetWidth = 480; //
			autoHeight();
			$(window).resize(function  () {
				autoHeight();
			}); 

		function  autoHeight(){
			maxHeight = 0;
			for (var i=0; i<listNum; i++) {
				var curHeight = $autoList.eq(i).find(heightDiv).innerHeight();
				if ( curHeight > maxHeight ) {
					maxHeight = curHeight;
				}
			}
			$autoListInner.height(maxHeight);
			
			if ( $(window).innerWidth() < resetWidth + 1 ){
			  $autoListInner.css('height','auto');
			}
		}

		
	var fileTarget = $('.file-custom-box .upload-hidden');
	 
	fileTarget.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
	 
		$(this).siblings('.upload-name').val(filename);
	});

	$("#subsidiaryMobile").find(".cur-location").click(function  (e) {
		e.preventDefault();
		
		$(".subsidiary-list-m-con").find(".cur-location").not($(this)).removeClass("open");
		$(".subsidiary-list-m-con").find(".location-menu-con").not($(this).siblings()).hide();

		$(this).toggleClass("open");
		$(this).siblings(".location-menu-con").slideToggle();

		return false;
	});

	if ( $("#subsidiaryMobile").length > 0 ) {
		$(window).scroll(function  () {
			var mscroll_Top = $(window).scrollTop();
			var mstartTop = $("#subsidiaryMobile").offset().top - 70;
 
			if ( mscroll_Top > mstartTop ) {
				$("#subsidiaryMobile .side-menu-inner").addClass("fixed");
			}else {
				$("#subsidiaryMobile .side-menu-inner").removeClass("fixed");
			}
		 
			
			var msubsidiaryCount=$(".subsidiary-list-m-con li").size();
			var mnav= new Array();
			for(var i=0;i < msubsidiaryCount;i++){
				mnav[i]="nav"+i;
				mnav[i]=$($(".subsidiary-list-m-con li").eq(i).find("a").attr("href")).offset().top - 50;
			}
			 
			$(".subsidiary-list-m-con li").each(function  (idx) {
				if( mscroll_Top >= mnav[idx] ){
					$('.subsidiary-list-m-con li').removeClass('on');
					$('.subsidiary-list-m-con li').eq(idx).addClass('on');
					$(".subsidiary-list-m-con > .cur-location span").text($(".subsidiary-list-m-con li").eq(idx).find("span").text());
				};
			});
		});
		$(".subsidiary-list-m-con li a").click(function  () {
			var mgoDiv = $($(this).attr("href")).offset().top - 50;
			$("html, body").animate({scrollTop:mgoDiv},300,"swing");
			$(".subsidiary-list-m-con .cur-location").removeClass("open");
			$(".subsidiary-list-m-con .location-menu-con").hide();
			 
			return false;
		});
	}
	
});

