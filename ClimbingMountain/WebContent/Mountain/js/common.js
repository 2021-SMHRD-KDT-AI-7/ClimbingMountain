
jQuery(function($){
	
	// 임의의 영역을 만들어 스크롤바 크기 측정
	function getScrollBarWidth(){
		if($(document).height() > $(window).height()){
			$('body').append('<div id="fakescrollbar" style="width:50px;height:50px;overflow:hidden;position:absolute;top:-200px;left:-200px;"></div>');
			fakeScrollBar = $('#fakescrollbar');
			fakeScrollBar.append('<div style="height:100px;">&nbsp;</div>');
			var w1 = fakeScrollBar.find('div').innerWidth();
			fakeScrollBar.css('overflow-y', 'scroll');
			var w2 = $('#fakescrollbar').find('div').html('html is required to init new width.').innerWidth();
			fakeScrollBar.remove();
			return (w1-w2);
		}
		return 0;
	}

	/* *********************** 헤더 FIXED ************************ */
	$(window).scroll(function  () {
		var scrollHeight = $(window).scrollTop();
		var startTop = $("#header").height();
		if ( scrollHeight > startTop ) {
			$("#header").addClass("fixed");
		}else {
			$("#header").removeClass("fixed");
		}
	});
	
	$(".sitemap-open-btn, .footer-sitemap-open").click(function  () {
		$("#sitemapContent").removeClass("close").addClass("open");
		$(".sitemap-wrapper").addClass("menu-open");
		$(".sitemap-open-btn, .sitemap-close-btn").addClass("active");
		if ( $("#mainContainer").length > 0 ) {
			$.fn.fullpage.setAllowScrolling(false);
			$.fn.fullpage.setKeyboardScrolling(false);
		}
	});
	$(".sitemap-close-btn").click(function  () {
		$("#sitemapContent").removeClass("open").addClass("close");
		$(".sitemap-wrapper").removeClass("menu-open");
		$(".sitemap-open-btn, .sitemap-close-btn").removeClass("active");
		if ( $("#mainContainer").length > 0 ) {
			$.fn.fullpage.setAllowScrolling(true);
			$.fn.fullpage.setKeyboardScrolling(true);
		}
	});
	/* *********************** 상단 언어 목록 ************************ */
	$(".cm-header-language").each(function  () {
        var $langBox = $(this);
        var $langBtn = $(this).children(".cm-lang-open-btn");
        var $langList = $(this).children("ul");
        $langBtn.click(function  () {
            $langList.slideToggle(300);
            $langBox.toggleClass("open");
            return false;
        });
        $(this).mouseleave(function  () {
            $langList.slideUp(300);
            $langBox.removeClass("open");
        });
    })

	/* *********************** 탭 공통 ************************ */
	$(".cm-tab-container").each(function  () {
		var $cmTabList = $(this).children(".cm-tab-list");
		var $cmTabListli = $cmTabList.find("li");
		var $cmConWrapper = $(this).children(".cm-tab-content-wrapper");
		var $cmContent = $cmConWrapper.children(".cm-tab-con");
		
		
		// 탭 영역 숨기고 on 클래스가 있는 영역만 보이게
		var $selectCon = $cmTabList.find("li.on").find("a").attr("href");
		$cmContent.hide();
		$($selectCon).show();

		$cmTabListli.children("a").click(function  () {
			if ( !$(this).parent().hasClass("on")) {
				var visibleCon = $(this).attr("href");
				$cmTabListli.removeClass("on");
				$(this).parent("li").addClass("on");
				$cmContent.hide();
				$(visibleCon).fadeIn();
			}
			return false;
		});
	});

	/* *********************** 스크롤 터치시 커버 사라지게 ************************ */
	$(".custom-scrollbar-wrapper").on("touchmove click",function  () {
		$(this).find(".custom-scrollbar-cover").fadeOut(200);
	});
	
	
});
