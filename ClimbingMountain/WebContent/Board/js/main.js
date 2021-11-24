

jQuery(function($){
	
	// fadeIn
	$(".ms-preloader").animate({"opacity":"0"},1000,"easeInOutCubic",function  () {
		$(".ms-preloader").css("visibility", "hidden");
	});

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

	if ( $("#mainVisual.full-height").length > 0 ) {
		mainVisualHeight();
		function mainVisualHeight () {
			scrollWidth = getScrollBarWidth();
			var win_width = $(window).outerWidth() + scrollWidth;
			var visual_height = $(window).height();
			if ( win_width < 1221 ) {
				$(".main-visual-con").height(visual_height);
			}else {
				$(".main-visual-con").css("height","100%");
			}
		}
		$(window).on('resize', mainVisualHeight);
	}
	
	$(".main-visual-con").each(function  () {
		var $visualSlide = $(this);
		var $visualSlideItem = $(this).find(".main-visual-item");
		var visualNum = $visualSlideItem.length;
		var $visualControls = $(".main-visual-controls");
	
		$visualControls.find('.paging-controls .total').text(visualNum);

		$visualSlide.on('init', function(event, slick) {
			$visualSlideItem.eq(0).addClass("active-item");
			$(".main-visual-con .slick-dots").find("li").eq(0).addClass("active-item");
		});
		$visualSlide.on('beforeChange', function(event, slick, currentSlide, nextSlide) {	
			$visualSlideItem.removeClass("active-item");
			$visualSlideItem.eq(nextSlide).addClass("active-item");
			$(".main-visual-con li").removeClass("active-item");
			$(this).find(".slick-dots").find("li").eq(nextSlide).addClass("active-item"); 
			$visualControls.find('.paging-controls .cur').text(nextSlide+1);
		})

		$visualSlide.slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: true,
			fade: true,
			dots:true,
			autoplay: true,
			speed:1000,
			infinite:true,
			autoplaySpeed: 3000,
			easing: 'easeInOutQuint',
			pauseOnHover:false,
			zIndex:1,
			prevArrow: '.main-visual-controls .prev-visual-btn',
			nextArrow: '.main-visual-controls .next-visual-btn',
			customPaging : function(slider, i) {
				var title = $(slider.$slides[i]).data('title');
				var en_title = $(slider.$slides[i]).data('en-title');
				return '<a><p class="loading-bar-paging-tit"><strong>'+title+'</strong><span>'+en_title+'</span></p><span class="loading-bar-line"></span></a>';
			},
		});
		$visualControls.find('.pause-visual-btn').click(function  () {
			$visualSlide.slick("slickPause");
			$(this).hide().siblings().show();
		});
		$visualControls.find('.play-visual-btn').click(function  () {
			$visualSlide.slick("slickPlay");
			$(this).hide().siblings().show();
		});
	});
	
	
	/* *********************** slide ************************ */
	$('.left-banner-slide').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: false,
		dots:true,
		dotsClass : "slick-dots",
		autoplay: false,
		speed:800,
		infinite:true,
		autoplaySpeed: 3000,
		easing: 'easeInOutQuint',
		pauseOnHover:false,
		responsive: [
					{
					  breakpoint: 801,
					  settings: {
						autoplay: true
					  }
					}
				  ]
	});
	
	$('.menu-list-ir').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: false,
		dots:false,
		autoplay: false,
		speed:800,
		infinite:true,
		autoplaySpeed: 3000,
		easing: 'easeInOutQuint',
		pauseOnHover:false,
		responsive: [
					{
					  breakpoint: 801,
					  settings: {
						autoplay: true
					  }
					}
				  ]
	});

	$(".main-news-list-con > ul").each(function  () {
		var $newsSlide = $(this);
		var newsNum = $newsSlide.find("li").length;
		var $pagingControls = $(".main-news-controls");
		$pagingControls.find('.paging-controls .total').text(newsNum);
		$newsSlide.slick({
			slidesToShow: 4,
			slidesToScroll: 1,
			arrows: true,
			fade: false,
			dots:false,
			autoplay: false,
			speed:800,
			infinite:true,
			autoplaySpeed: 3000,
			easing: 'easeInOutQuint',
			pauseOnHover:false,
			variableWidth:true,
			prevArrow: '.main-news-controls .prev-news-btn',
			nextArrow: '.main-news-controls .next-news-btn',
			responsive: [
						{
						  breakpoint: 801,
						  settings: {
							autoplay: true
						  }
						}
					  ]
		});
		$newsSlide.on('beforeChange', function(event, slick, currentSlide, nextSlide) {
			$pagingControls.find('.paging-controls .cur').text(nextSlide + 1);
		})
		$pagingControls.find('.pause-news-btn').click(function  () {
			$newsSlide.slick("slickPause");
			$(this).hide().siblings().show();
		});
		$pagingControls.find('.play-news-btn').click(function  () {
			$newsSlide.slick("slickPlay");
			$(this).hide().siblings().show();
		});
	});

});