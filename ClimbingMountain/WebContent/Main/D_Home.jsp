<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">

<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>산 타 클로스🎅</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 모바일사이트, 반응형사이트 제작시 사용 -->
<meta name="format-detection" content="telephone=no" />
<!-- ios 자동전화걸기 방지 -->
<meta name="theme-color" content="#222">
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/layout.css">
<link rel="stylesheet" href="./css/content.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/layout_responsive.css">
<link rel="stylesheet" href="./css/content_responsive.css">
<link rel="stylesheet" href="./css/main_responsive.css">
<script src="./js/vendor/jquery-1.8.3.min.js"></script>
<script src="./js/vendor/jquery.easing.1.3.js"></script>
<script src="./js/common.js"></script>

<!-- 아이콘폰트 -->
<link href="/css/icon.css" rel="stylesheet">
<!-- <link th:href="@{https://fonts.googleapis.com/icon?family=Material+Icons}"  rel="stylesheet"> google -->
<link rel="stylesheet" href="./css/xeicon.min.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!--link rel="stylesheet" th:href="@{http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css}"> naver -->

<!-- 슬라이드 플러그인 -->
<link rel="stylesheet" type="text/css" href="./css/plugin/slick.css">
<script src="./js/plugin/slick.js"></script>

<script>
	$(function() {
		dep1 = 0, dep2 = 0;
	})
</script>
<link rel="stylesheet" type="text/css"
	href="./css/plugin/jquery.fullPage.css" />
<script type="text/javascript" src="./js/plugin/jquery.fullPage.js"></script>
<script type="text/javascript">
	function numberCounter(target_frame, target_number) {
		this.count = 0;
		this.diff = 0;
		this.target_count = parseInt(target_number);
		this.target_frame = document.getElementById(target_frame);
		this.timer = null;
		this.counter();
	};
	numberCounter.prototype.counter = function() {
		var self = this;
		this.diff = this.target_count - this.count;

		if (this.diff > 0) {
			self.count += Math.ceil(this.diff / 5);
		}

		this.target_frame.innerHTML = this.count.toString().replace(
				/\B(?=(\d{3})+(?!\d))/g, ',');

		if (this.count < this.target_count) {
			this.timer = setTimeout(function() {
				self.counter();
			}, 30);
		} else {
			clearTimeout(this.timer);
		}
	};
	function callCount(target, number) {
		return new numberCounter(target, number);
	}

	function numberCounter2(target_frame, target_number) {
		this.count = 0;
		this.diff = 0;
		this.target_count = parseInt(target_number);
		this.target_frame = document.getElementById(target_frame);
		this.timer = null;
		this.counter();
	};
	numberCounter2.prototype.counter = function() {
		var self = this;
		this.diff = this.target_count - this.count;

		if (this.diff > 0) {
			self.count += Math.ceil(this.diff / 5);
		}

		this.target_frame.innerHTML = this.count.toString();

		if (this.count < this.target_count) {
			this.timer = setTimeout(function() {
				self.counter();
			}, 30);
		} else {
			clearTimeout(this.timer);
		}
	};
	function callCount2(target, number) {
		return new numberCounter2(target, number);
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#mainContainer').fullpage({
			verticalCentered : true,
			menu : '#menu',
			navigation : true,
			responsiveWidth : 1220,
			navigationPosition : 'right',
			onLeave : function(index, nextIndex, direction) {
				if (direction === 'down') {
					if (nextIndex == 3) {
						$("#mainInformationCon").addClass("active-item");
						$(".count-num").each(function() {
							setTimeout(function() {
								// callCount("counter1-1", "31");
								callCount2("counter1-2", "1991");
								callCount("counter1-3", "1812");
								callCount2("counter1-4", "599");
							}, 400);
						});
					} else if (nextIndex == 4) {
						$("#mainBannerLinkCon").addClass("active-item");
						$('.left-banner-slide').slick("slickPlay");
					} else if (nextIndex == 2) {
						$("#mainNewsCon").addClass("active-item");
						$(".main-news-list-con > ul").slick("slickPlay");
					} else if (nextIndex == 5) {
						$("#mainRecruitCon").addClass("active-item");
					}
				}
				// 오른쪽Bar 색상변경
				if (nextIndex == 3 || nextIndex == 5) {
					$("#fp-nav").addClass("black");
				} else {
					$("#fp-nav").removeClass("black");
				}
			}
		});
	});
</script>
<script type="text/javascript" src="./js/nav.js"></script>
<script type="text/javascript" src="./js/main.js"></script>
<script type="text/javascript" src="./js/layer_popup.js"></script>



</head>

<body>
	<script>
		$
				.getJSON(
						'https://api.openweathermap.org/data/2.5/onecall?lat=35.1547&lon=126.9156&lang=kr&appid=84dffcc7856b59e1c244b26b05fc8a19&units=metric',
						function(result) {
							//시간 데이터 만들기

							for (var i = 0; i < result.daily.length; i++) {

								function convertTime(t) { // 시 분 초로 변환하자
									var ot = new Date(t * 1000);
									// ot 형식 : Fri Nov 26 2021 11:47:22 GMT+0900 (한국 표준시)
									var dt = ot.getDate();
									var ev = ot.getDay();
									if (ev == 1) {
										ev = '월요일'
									} else if (ev == 2) {
										ev = '화요일'
									} else if (ev == 3) {
										ev = '수요일'
									} else if (ev == 4) {
										ev = '목요일'
									} else if (ev == 5) {
										ev = '금요일'
									} else if (ev == 6) {
										ev = '토요일'
									} else if (ev == 0) {
										ev = '일요일'
									}
									return dt + '일  ' + ev
								}

								var ct = result.daily[i].dt; //가져오는 시간 (유닉스 타임스탬프)
								var currentTime = convertTime(ct)
								var min_temp = parseInt(result.daily[i].temp.min); //최저온도
								var max_temp = parseInt(result.daily[i].temp.max); //최고온도
								var w_img = '<img src="http://openweathermap.org/img/wn/' + result.daily[i].weather[0].icon + '@2x.png"alt='+ result.daily[i].weather[0].description +'>' // 날씨 이미지
								var w_des = result.daily[i].weather[0].description; // 날씨 정보
								var clouds = result.daily[i].clouds; //흐림도 (%)
								var pop = result.daily[i].pop; //강수확률
								var rain = result.daily[i].rain; //(가능할 경우) 강수량,mm
								var snow = result.daily[i].rain; //(가능할 경우) 적설량,mm
								var undefined = '0';

								if (rain == null) {
									rain = undefined;
									snow = undefined;
								}

								var tableHtml = '<tr>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ currentTime
										+ '</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ min_temp
										+ '℃</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ max_temp
										+ '℃</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ w_img
										+ '</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ w_des
										+ '</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ clouds
										+ '%</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ pop * 100
										+ '%</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ rain
										+ 'mm</td>'
										+ '<td style="font-size:x-large;width:200px;text-align:center;border-bottom:inset">'
										+ snow + 'mm</td>' + '</tr>' + '<hr>';

								$('tbody').append(tableHtml);
								console.log(result.daily.length);
							}

						});
	</script>
	<!-- accessibility -->
	<div class="cm-accessibility">
		<a href="#mainContainer">본문바로가기</a>
	</div>
	<!-- //accessibility -->

	<!-- code -->
	<div id="wrap" class="index-wrapper">
		<!-- container -->
		<div id="mainContainer">
			<!-- 1페이지 스타트 -->
			<section id="mainVisual" class="section active">
				<div class="ms-preloader"></div>
				<header id="header">
					<div class="gnb-overlay-bg open"></div>
					<div id="headerInnerWrap">
						<!-- ****************** 헤더상단 ********************** -->
						<div id="headerInner" class="clearfix">
							<h1 class="logo">
								<a href="D_Home.jsp" title="메인"><img
									src="./images/header_logo.png" alt="IBK 시스템" class="pc-logo"
									width="160px" height="90px" /></a>
							</h1>
							<div class="header-util-box">
								<%
									if (info == null) {
								%>
								<a href="../Login/Login.jsp" class="contact-tx">로그인</a> <a
									href="../Join/Join.jsp" class="contact-tx">회원가입</a>
								<%
									} else {
								%>
								<a href="LogoutServiceCon.do" class="contact-tx">로그아웃</a>
								<%
									}
								%>
							</div>
							<!-- ****************** GNB ********************** -->

							<!-- GNB PC ( ### 메뉴 4개이하 ### ) -->
							<nav id="gnb" class="total-menu">
								<h2 class="blind">주메뉴</h2>
								<div id="gnbBg"></div>
								<ul class="clearfix area">
									<li class="gnb2"><a href="../Mountain/M_info.jsp">산정보</a>
										<div class="gnb-2dep">
											<article class="gnb-2dep-inner area clearfix">
												<div class="gnb-2dep-menu-list">
													<ul class="clearfix">
														<li><a href="../Mountain/M_info.jsp"> <span
																style="font-weight: bold;">종합정보</span> <em
																class="gnb-icon"><i class="xi-angle-right-min"></i></em>
														</a></li>
													</ul>
												</div>
												<div class="gnb-2dep-menu-txt">
													<div class="gnb-2dep-menu-info">
														<p>
															<span style="color: #006400;">Climbing</span> <span
																style="color: red;">Mountain</span>
														</p>
														<div class="gnb-2dep-menu-img"></div>
													</div>
												</div>
											</article>
										</div></li>
									<li class="gnb1"><a href="../Board/list.jsp">게시판</a>
										<div class="gnb-2dep">
											<article class="gnb-2dep-inner area clearfix">
												<div class="gnb-2dep-menu-list list-3">
													<ul class="clearfix">
														<li><a href="../Board/list.jsp"> <span
																style="font-weight: bold;">모두의 게시판</span> <em
																class="gnb-icon"><i class="xi-angle-right-min"></i></em>
														</a></li>
														<li>
															<%
																if (info == null) {
															%> <a href="../Login/Login.jsp"> <span
																style="font-weight: bold;">다이어리</span> <em
																class="gnb-icon"><i class="xi-angle-right-min"></i></em>
														</a> <%
 	} else {
 %> <a href="../Board/diary_list.jsp"> <span style="font-weight: bold;">다이어리</span>
																<em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
														</a> <%
 	}
 %>
														</li>
													</ul>
												</div>
												<div class="gnb-2dep-menu-txt">
													<div class="gnb-2dep-menu-info">
														<p>
															<span style="color: #006400;">Bo</span><span
																style="color: red;">ard</span>
														</p>
														<div class="gnb-2dep-menu-img"></div>
													</div>
												</div>
											</article>
										</div></li>
								</ul>
							</nav>
							<!-- 사이트맵 버튼 ( 기본 라인 三 ) -->
							<!-- <button class="sitemap-line-btn sitemap-open-btn" title="사이트맵 열기"> -->
							<!-- <span class="line line1"></span><span class="line line2"></span><span class="line line3"></span> -->
							<!-- </button> -->
						</div>
				</header>


				<div class="main-visual-con">
					<div class="main-visual-item" data-title="무등산" data-en-title="M.M1">
						<div class="main-visual-pc-img"
							style="background: #fff url(images/Main_pic_01.jpg) no-repeat 60% 50%;"></div>
						<div class="main-visual-txt-con">
							<div class="main-visual-txt-inner area-box">
								<strong class="main-visual-txt1 title-line"><span>무등산.
										광주의 자태.<br>산의 아름다움에 대하여.
								</span></strong>
								<p class="main-visual-txt2 title-line">
									<span>'끝없는 자연과 인간의 교감'</span>
								</p>
							</div>
						</div>
					</div>
					<div class="main-visual-item" data-title="무등산2"
						data-en-title="M.M2">
						<div class="main-visual-pc-img"
							style="background: #fff url(images/Main_pic_02.jpg) no-repeat 50% 50%;"></div>
						<div class="main-visual-txt-con">
							<div class="main-visual-txt-inner area-box">
								<strong class="main-visual-txt1 title-line"> <span>눈내린
										무등산.겨울의 美.<br> <span style="color: #006400;">산</span> <span
										style="color: red;">타</span> 클로스와 함께.
								</span></strong>
							</div>
						</div>
					</div>
					<div class="main-visual-item" data-title="한국의 산1"
						data-en-title="K.M1">
						<div class="main-visual-pc-img"
							style="background: #fff url(images/Main_pic_04.jpg) no-repeat 70% 50%;"></div>
						<div class="main-visual-txt-con">
							<div class="main-visual-txt-inner area-box">
								<strong class="main-visual-txt1 title-line"><span>단풍.<br>붉은
										고귀함.<br>자연을 느끼는 자유.
								</span></strong>
							</div>
						</div>
					</div>
					<div class="main-visual-item" data-title="한국의 산2"
						data-en-title="K.M2">
						<div class="main-visual-pc-img"
							style="background: #fff url(images/Main_pic_05.jpg) no-repeat 60% 50%;"></div>
						<div class="main-visual-txt-con">
							<div class="main-visual-txt-inner area-box">
								<strong class="main-visual-txt1 title-line"><span>대한민국
										등산 명소.</span></strong>
								<p class="main-visual-txt2 title-line">
									<span><span style="color: #006400;">산</span> <span
										style="color: red;">타</span> 클로스에서 아름다움을 만끽하세요.</span>
								</p>
							</div>
						</div>
					</div>
				</div>

				<aside class="main-visual-controls">
					<span class="tx-control">Introduction</span>
					<div class="arrow-controls">
						<button class="prev-visual-btn" title="Prev">
							<i class="xi-angle-left"></i>
						</button>
						<span class="paging-controls"> <span class="cur">1</span> <em>/</em>
							<span class="total"></span>
						</span>
						<button class="next-visual-btn" title="Next">
							<i class="xi-angle-right"></i>
						</button>
					</div>

					<div class="stop-pause-controls">
						<button class="pause-visual-btn"></button>
						<button class="play-visual-btn">
							<i class="xi-play"></i>
						</button>
					</div>
				</aside>
			</section>
			<!-- 까지 1페이지 -->

			<!-- 2페이지 시작 -->
			<section id="mainNewsCon" class="section"
				style="background: url('./images/Main_bgp2.jpg') 50% 50% no-repeat; background-size: cover;">
				<div class="main-news-wrapper">
					<aside class="main-news-tit-box">
						<h3 class="main-news-tit main-txt-up">
							<span
								style="text-shadow: -1px 0 #000, 0 6px #000, 2px 0 #000, 0 0px #000">광주
								/ 전남 13대명산</span>
						</h3>
						<p class="main-news-sub-txt main-txt-up"
							style="letter-spacing: 4px; font-size: 26px;">
							<span>등산은 자연과 함께하는 호흡과 같습니다. 여러분의<span
								style="color: #b7e4c7;">"등삶"</span>이 항상 <span
								style="color: #006400;">산</span> <span style="color: red;">타</span>
								클로스와 함께 행복하길.
							</span>
						</p>
					</aside>
					<article class="main-news-list-con">
						<ul class="clearfix">
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=42">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Back_am_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!--<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">백암산</strong>
											</div>
										</div>
									</div>
							</a></li>

							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=39">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Bang_Jang_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!--<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">방장산</strong>
											</div>
										</div>
									</div>
							</a></li>

							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=84">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Chu_wol_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">추월산</strong>
											</div>
										</div>
									</div>
							</a></li>
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=6">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Gang_chun_Mounatin.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">강천산</strong>
											</div>
										</div>
									</div>
							</a></li>

							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=35">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Mudeung_Mounatin.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">무등산</strong>
											</div>
										</div>
									</div>
							</a></li>

							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=74">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Jo_gye_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">조계산</strong>
											</div>
										</div>
									</div>
							</a></li>

							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=77">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Ji_ri_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">지리산</strong>
											</div>
										</div>
									</div>
							</a></li>
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=43">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Back_un_Mounatin.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">백운산</strong>
											</div>
										</div>
									</div>
							</a></li>
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=16">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Git_dae_bong.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">홍도 깃대봉</strong>
											</div>
										</div>
									</div>
							</a></li>
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=67">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Wol_chul_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">월출산</strong>
											</div>
										</div>
									</div>
							</a></li>
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=28">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Du_ryun_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">두륜산</strong>
											</div>
										</div>
									</div>
							</a></li>
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=79">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Cheon_gwan_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">천관산</strong>
											</div>
										</div>
									</div>
							</a></li>
							<li class="no-thumb"><a
								href="../Mountain/M_info.jsp?mountain_seq=92">
									<div class="main-news-inner">
										<div class="main-news-bg"
											style="background: url(./images/Pal_young_Mountain.jpg) no-repeat 50% 50%">
										</div>
										<!-- 									<span class="news-thumb-con over-img"><img src="/data/bbsData/" alt="" /></span> -->
										<div class="news-info-box">
											<div class="news-info-box-inner">
												<strong class="news-tit">팔영산</strong>
											</div>
										</div>
									</div>
							</a></li>
						</ul>
					</article>
					<aside class="main-news-controls">
						<span class="tx-control">Mountain View</span>
						<div class="arrow-controls">
							<button class="prev-news-btn" title="Prev">
								<i class="xi-angle-left"></i>
							</button>
							<span class="paging-controls"> <span class="cur">1</span>
								<em>/</em> <span class="total"></span>
							</span>
							<button class="next-news-btn" title="Next">
								<i class="xi-angle-right"></i>
							</button>
						</div>

						<div class="stop-pause-controls">
							<button class="pause-news-btn"></button>
							<button class="play-news-btn">
								<i class="xi-play"></i>
							</button>
						</div>
					</aside>
				</div>
			</section>
			<!-- 까지 2페이지 -->

			<!-- <!-- 부터 날씨정보 섹션 3페이지 일단 기능보류로 주석처리-->
			<section id="mainInformationCon" class="section"
				style="background: url('./images/sky_mountain.jpg') 50% 50% no-repeat; background-size: cover;">

				<article class="main-info-wrapper">
					<aside class="main-info-tit-box">
						<h3 class="main-info-tit main-txt-up">
							<span style="margin-top: 5px;">광주 날씨 <i class="xi-sun-o"></i></span>
						</h3>
					</aside>

					<article class="main-info-list-con">
						<ul class="clearfix" style="margin-top: -100px;">

							<table>
								<thead>
									<tr>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">시간</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">최저온도</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">최고온도</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">날씨이미지</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">날씨정보</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">흐림도</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">강수확률</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">강수량</td>
										<td
											style="text-align: center; font-size: x-large; border-bottom: solid; padding-bottom: 20px">적설량</td>
									</tr>
								</thead>

								<tbody>
								</tbody>

							</table>
						</ul>
					</article>

					<!-- 기상청 api용 script -->
					<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"
						integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
						crossorigin="anonymous"> -->
				</article>
			</section>

			<section id="mainFooterCon" class="section fp-auto-height">
				<footer id="footer">
					<div id="footerInner" class="clearfix">
						<!-- 푸터 상단 -->
						<article id="footerTop">
							<!-- 푸터 하단 왼쪽 -->
							<article class="footer-left-con">
								<a href="D_Home.jsp">
									<div class="footer-logo">
										<img src="./images/logo_font.png" width="320px" height="160px">
									</div>
								</a>
							</article>
							<!-- 푸터 하단 중앙 -->
							<article class="footer-center-con">

								<div class="footer-address-list">
									<dl>
										<dd>광주/전남 명산 정보를 한눈에 볼 수 있도록 정리해주는 웹 프로젝트</dd>
									</dl>
									<br>
									<dl>
										<dt>조장 :</dt>
										<dd style="color: black;">류태욱</dd>
										<dt>역할/조원 :</dt>
										<dd style="color: black; letter-spacing: 2px;">
											Backend : 정현수, 곽승옥, 최혜준 <span style="color: white;"> /
											</span> Front : 류태욱, 정찬준
										</dd>
									</dl>
									<br>
								</div>
								<div class="footer-copyright">
									스마트인재개발원_인공지능7차_1차프로젝트(<span style="color: red;">드</span><span
										style="color: blue;">가</span><span style="color: gold;">자</span>)
								</div>
							</article>
						</article>
					</div>
				</footer>
			</section>
		</div>

	</div>
	<!-- //code -->
</body>

</html>