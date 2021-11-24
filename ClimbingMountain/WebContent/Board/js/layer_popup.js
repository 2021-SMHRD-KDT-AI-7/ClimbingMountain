
function layerLoad(sGetName){
	var $modalWrap = $("#"+ sGetName);
	if ($('#mainContainer').length > 0) {
		$.fn.fullpage.setAllowScrolling(false);
		$.fn.fullpage.setKeyboardScrolling(false);
	}else {
		$("html").css({
			"margin-right":"17px",
			"overflow-y":"hidden"
		});
	}
	$modalWrap.fadeIn();
}
$(window).on("load",function(){
	$(".modal-close-btn,.agree-box a").click(function(){
		$(this).parents('.modal-fixed-pop-wrapper').css("display","none");
		if ($('#mainContainer').length > 0) {
			$.fn.fullpage.setAllowScrolling(true);
			$.fn.fullpage.setKeyboardScrolling(true);
		}else {
			$("html").css({
				"margin-right":"0",
				"overflow-y":"auto"
			});
		}
		return false;
	});
});