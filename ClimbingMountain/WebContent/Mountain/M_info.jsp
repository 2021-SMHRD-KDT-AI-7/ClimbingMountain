<%@page import="Model.Mountain100_3_img_DTO"%>
<%@page import="Model.Mountain100_3_img_DAO"%>
<%@page import="Model.Course_3_img_DTO"%>
<%@page import="Model.Course_3_img_DAO"%>
<%@page import="Model.Course_2_DTO"%>
<%@page import="Model.Course_1_DTO"%>
<%@page import="Model.Course_2_DAO"%>
<%@page import="Model.Course_1_DAO"%>
<%@page import="Model.Mountain100_2_DTO"%>
<%@page import="Model.Mountain100_2_DAO"%>
<%@page import="Model.Mountain100_1_DAO"%>
<%@page import="Model.Mountain100_1_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">




<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");

int mountain_seq = 0;
if (request.getParameter("mountain_seq") != null) {
	mountain_seq = Integer.parseInt(request.getParameter("mountain_seq"));
} else {
	mountain_seq = 35;
}

// 산 정보 dao 선언
Mountain100_1_DAO mountain100_1_dao = new Mountain100_1_DAO();
Mountain100_2_DAO mountain100_2_dao = new Mountain100_2_DAO();

Mountain100_3_img_DAO mountain100_3_img_dao = new Mountain100_3_img_DAO();

// 등산로 정보 dao 선언
Course_1_DAO course_1_dao = new Course_1_DAO();
Course_2_DAO course_2_dao = new Course_2_DAO();

Course_3_img_DAO course_3_img_dao = new Course_3_img_DAO();

// 산 정보 dto 선언	
Mountain100_1_DTO mountain100_1_dto = mountain100_1_dao.selectOneMountaion100(mountain_seq);
Mountain100_2_DTO mountain100_2_dto = mountain100_2_dao.selectOneMountaion100(mountain_seq);

Mountain100_3_img_DTO mountain100_3_img_dto = mountain100_3_img_dao.selectMountain_img(mountain_seq);
// 산정보 저장된 리스트	
ArrayList<Mountain100_1_DTO> mountain13_list = mountain100_1_dao.selectuseMountain100_1();

// 등산로 정보 저장된 리스트	
ArrayList<Course_1_DTO> course_1_list = course_1_dao.selectallCourse(mountain_seq);
ArrayList<Course_2_DTO> course_2_list = course_2_dao.selectallCourse(mountain_seq);
%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>산 타 클로스_산정보🎅</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 모바일사이트, 반응형사이트 제작시 사용 -->
<meta name="format-detection" content="telephone=no" />
<!-- ios 자동전화걸기 방지 -->
<meta name="theme-color" content="#222">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="./css/b_test.css">
<link rel="stylesheet" href="./css/Mapstyle.css">
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/layout.css">
<link rel="stylesheet" href="./css/content.css">
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./css/layout_responsive.css">
<link rel="stylesheet" href="./css/content_responsive.css">
<link rel="stylesheet" href="./css/main_responsive.css" />
<script src="./js/vendor/jquery-1.8.3.min.js"></script>
<script src="./js/vendor/jquery.easing.1.3.js"></script>
<script src="./js/common.js"></script>
<script src="./js/scrollreveal.js"></script>
<!--<script th:src="@{/js/scroll.js}"></script>-->
<script src="./js/layer_popup.js"></script>

<!-- 아이콘폰트 -->
<link href="./css/icon.css" rel="stylesheet">
<link
	th:href="@{https://fonts.googleapis.com/icon?family=Material+Icons}"
	rel="stylesheet">
google
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="./css/xeicon.min.css">
<!-- naver -->

<!-- 슬라이드 플러그인 -->
<link rel="stylesheet" type="text/css" href="./css/plugin/slick.css">
<script src="./js/plugin/slick.js"></script>
<script type="text/javascript" src="./js/nav.js"></script>
<script type="text/javascript" src="./js/sub.js"></script>
<script type="text/javascript" src="./js/common/common.js"></script>
<!--[if lt IE 9]>
	<script src="@{/js/vendor/html5shiv.js"></script>
	<script src="@{/js/vendor/respond.min.js"></script>
	<link rel="stylesheet" href="@{/css/ie8.css">
<![endif]-->

<style> /* 지도 확대, 축소 컨트롤 div 입니다 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 650px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}
</style>



<style> /* 지도타입 컨트롤 div 입니다 */
.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}
</style>



<style> /* 카테고리별 장소 검색하기 div 입니다 */
#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background: url('./places_category.png') no-repeat;
}

#category li .parking {
	background-position: -10px 0;
}

#category li .culture {
	background-position: -10px -36px;
}

#category li .sightseeing {
	background-position: -10px -72px;
}

#category li .accommodation {
	background-position: -10px -108px;
}

#category li .restaurant {
	background-position: -10px -144px;
}

#category li .cafe {
	background-position: -10px -180px;
}

#category li .hospital {
	background-position: -10px -216px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>



<style> /* 지형보기 버튼(슬라이더) */
/* 슬라이더 외부를 감싸는 라벨에 대한 스타일 */
.map_switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

/* HTML 기본 체크박스 숨기기 */
.map_switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

/* 슬라이더 - 실제로 토글될 부분 */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* 슬라이더를 동그랗게 보여주기 위한 부분 */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>



<style> /* 행정동 주소정보 */
.map_add_title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	right: 10px;
	top: 600px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>



<style> /* 커스텀 오버레이(간략 안내판) */
.infowrap {
	position: absolute;
	left: -73px;
	bottom: -90px;
	width: 432px;
	height: 158px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.infowrap * {
	padding: 0;
	margin: 0;
}

.infowrap .map_info {
	width: 429px;
	height: 140px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.infowrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.map_info .co_title {
	padding: 5px 0 0 10px;
	height: 30px;
	color: #fff;
	background-color: #4d5f7c;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: normal;
}

.map_info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background: url('./overlay_close.png');
}

.map_info .close:hover {
	cursor: pointer;
}

.map_info .co_body {
	position: relative;
	overflow: hidden;
}

.map_info .map_desc {
	position: relative;
	left: 40px;
	margin: 4px 0 0 90px;
	height: 190px;
	white-space: normal;
	width: 290px;
}

.map_desc .name {
	font-weight: bold;
	color: #fff;
	background-color: #7e7e7e;
	margin: 0px;
	padding: 0px 4px;
	border-radius: 10px;
}

.map_desc .con {
	
}

.map_info .co_img img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 110px;
	height: 85px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.map_info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 6px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.map_info .link {
	color: #5085BB;
}
</style>



<style> /* 등산로 보기 버튼 */
.myButton {
	box-shadow: 5px 5px 5px 2px #9fb4f2;
	background: linear-gradient(to bottom, #7892c2 5%, #4d5f7c 100%);
	background-color: #4d5f7c;
	border-radius: 10px;
	border: 1px solid #4e6096;
	display: block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 18px;
	padding: 8px 0px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #283966;
}

.myButton:hover {
	background: linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color: #476e9e;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>









<style>
#M_N {
	font-size: xxx-large;
	font-weight: 700;
	text-align: right;
	color: #006400;
}

#M_L {
	font-size: x-large;
	margin-top: 25px;
	color: black;
	text-indent: -5px;
}

#M_H {
	font-size: large;
	margin-top: 10px;
	color: black;
	text-indent: 10px;
}

#R_S {
	font-size: large;
	margin-top: 10px;
	text-indent: 10px;
	color: black;
}

#M_T {
	font-size: xx-large;
	text-align: center;
	color: red;
	margin-top: 35px;
}

#C_D {
	font-size: xxx-large;
	text-align: right;
	color: black;
	margin-top: 50px;
}

#M_C_T {
	font-size: xx-large;
	color: black;
	margin-top: 25px;
}

#M_C {
	font-size: large;
	word-spacing: 2px;
	line-height: 25px;
	color: black;
}

#M_S_T {
	font-size: xx-large;
	color: black;
	margin-top: 25px;
}

#M_S {
	font-size: large;
	word-spacing: 2px;
	line-height: 26px;
	color: black;
}

#M_I_T {
	font-size: xx-large;
	color: black;
	margin-top: 25px;
}

#M_I {
	font-size: large;
	word-spacing: 3px;
	line-height: 26px;
	color: black;
}

#C_I_I {
	font-size: xxx-large;
	text-align: right;
	-webkit-text-emphasis-style: triangle;
	color: #006400;
	margin-top: 40px;
	margin-right: 40px;
}

#C_CN {
	font-size: xxx-large;
	text-indent: 20px;
	color: red;
	margin-bottom: 30px;
}

#C_I {
	margin-block: 50px;
	margin-left: 60px;
	width: 90%;
}

#C_I2 {
	padding: 10px;
	width: 14%;
}

#C_E {
	font-size: large;
	word-spacing: 4px;
	color: black;
	line-height: 30px;
}

#C_CN2 {
	font-size: medium;
	color: black;
	position: absolute;
	margin-left: -176px;
	margin-top: -8px;
}

#T_I {
	font-size: xxx-large;
	color: red;
	text-align: right;
}

#T_C {
	font-size: xxx-large;
	text-align: center;
	color: #006400;
	margin-top: 50px;
}

.T_CC {
	font-size: x-large;
	color: black;
}

.T_CCC {
	font-size: medium;
	line-height: 30px;
	color: #000000;
}

.T_R {
	font-size: large;
	line-height: 30px;
	font-weight: 600;
	color: black;
}

.line_info {
	display: block;
	height: 5px;
	border: 0;
	border-top: 3px solid #006400;
	margin: 2em 0;
	padding: 0;
}

.line-traffic {
	display: block;
	height: 2px;
	border: 0;
	border-top: 1px solid #000000;
	margin: 1em 0;
}

.line_course {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid #000000;
	margin: 2em 0;
}

#gso {
	position: relative;
	width: 100%;
	height: 1000px;
}
}
</style>

</head>

<!-- accessibility -->
<div class="cm-accessibility">
	<a href="#container">본문바로가기</a>
</div>
<!-- //accessibility -->

<!-- code -->
<div id="wrap" class="sub-wrapper">
	<!-- GNB -->
	<!-- header -->
	<header id="header">
		<div class="gnb-overlay-bg open"></div>
		<div id="headerInnerWrap">
			<!-- ****************** 헤더상단 ********************** -->
			<div id="headerInner" class="clearfix">
				<h1 class="logo">
					<a href="../Main/D_Home.jsp" title="메인"><img
						src="./img/logo.png" alt="산 타 클로스_로고" class="pc-logo"
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
			</div>

			<!-- ****************** GNB ********************** -->
			<!-- GNB PC ( ### 메뉴 4개이하 ### ) -->
			<nav id="gnb" class="total-menu">
				<h2 class="blind">주메뉴</h2>
				<div id="gnbBg"></div>
				<ul class="clearfix area">
					<li class="gnb2"><a href="M_info.jsp"
						style="text-shadow: 3px 3px 3px #666;">산정보</a>
						<div class="gnb-2dep">
							<article class="gnb-2dep-inner area clearfix">
								<div class="gnb-2dep-menu-list">
									<ul class="clearfix">
										<li><a href="M_info.jsp"> <span
												style="font-weight: bold;">종합정보</span> <em class="gnb-icon"><i
													class="xi-angle-right-min"></i></em>
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
					<li class="gnb1"><a href="../Board/list.jsp"
						style="text-shadow: 3px 3px 3px #666;">게시판</a>
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
												style="font-weight: bold;">다이어리</span> <em class="gnb-icon"><i
													class="xi-angle-right-min"></i></em>
										</a> <%
 	} else {
 %> <a href="../Board/diary_list.jsp"> <span
												style="font-weight: bold;">다이어리</span> <em class="gnb-icon"><i
													class="xi-angle-right-min"></i></em>
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
		</div>



	</header>
	<!-- //header -->
	<!-- 컨텐츠 -->

	<!-- 헤더아래 산 사진이랑 이름나오는곳 (Ajax)써야할듯 -->
	<div id="container">

		<!-- 여기가 배경들어가고 이름나오는곳 -->
		<section id="visual" class="sub-visual-company">
			<div class="visual-img-con"
				style="background: #fff url(./img/M_info_bg.jpg) no-repeat 50% 18%; text-shadow: 3px 3px 3px #666;">
			</div>
			<!-- 여기에 산 사진으로 배경 나오게 한다 -->
			<div class="area visual-txt-con">
				<div class="table-cell-layout">
					<div class="visual-txt-container">
						<h2 class="visual-tit trans400"><%=mountain100_1_dto.getMountain_name()%></h2>
					</div>
				</div>
			</div>
		</section>
		<!-- 배경 들어가고 이름 나오는곳 끝 -->

		<!-- 헤더 서브메뉴  -->
		<aside id="headerSubMenu">
			<div class="side-menu-inner">
				<div class="cm-top-menu clearfix">
					<a href="../Main/D_Home.jsp" class="location-to-home-btn"
						title="메인으로"><i class="xi-home-o"></i></a>



					<!-- 서브메뉴 첫번쨰 -->
					<div class="menu-location location1">


						<a href="#기본 산메뉴" class="cur-location"> <span>산 목록</span> <em
							class="arrow"><i class="xi-caret-down-min"></i></em>
						</a>

						<ul class="location-menu-con">

							<%
								for (int i = 0; i < mountain13_list.size(); i++) {
							%>

							<li><a
								href="M_info.jsp?mountain_seq=<%=mountain13_list.get(i).getMountain_seq()%>">
									<%=mountain13_list.get(i).getMountain_name()%> <em
									class="gnb-icon"><i class="xi-angle-right-min"></i></em>
							</a></li>
							<%
								}
							%>


							<!--  <li><a href="#백암산">백암산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#방장산">방장산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#추월산">추월산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#강천산">강천산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#무등산">무등산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#조계산">조계산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#지리산">지리산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#백운산">백운산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#깃대봉">깃대봉<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#월출산">월출산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#두륜산">두륜산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#천관산">천관산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                            <li><a href="#팔영산">팔영산<em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</aside>


		<!-- 산 종합정보 페이지 -->
		<div id="middleArea" style="background-color: #fefae0;">
			<!-- content -->
			<section id="content" class="area">
				<h1 class="Info-title">Information</h1>
				<section id="philosophyContent">
					<article class="philosophy-container">
						<section class="philosophy-wrapper cm-tab-container">
							<div class="cm-tab-list">
								<ul class="history-tab">
									<li class="on"><a href="#historyCon01">산에 대하여<span></span></a></li>
									<li><a href="#historyCon02">등산로 정보<span></span></a></li>
									<li><a href="#historyCon03">교통 정보<span></span></a></li>
									<li><a href="#historyCon04">지도 보기<span></span></a></li>
								</ul>
							</div>


							<article class="history-tab-container cm-tab-content-wrapper">
								<!-- 산 정보(산에 대하여) -->
								<div class="history-tab-con cm-tab-con" id="historyCon01">
									<article class="history-list-box">
										<div class="Mountain-info-pic">
											<img src="<%=mountain100_3_img_dto.getMountain_img()%>"
												alt="">

										</div>
										<div class="Mountain-info-text">

											<p id=M_N>
												<i class="xi-signal"></i>
												<%=mountain100_1_dto.getMountain_name()%>
												<i class="xi-signal xi-rotate-90"></i>
											<p>
											<p id=M_L>
												<i class="xi-gps"></i> 산 위치 :
												<%=mountain100_1_dto.getMountain_location()%></p>
											<p id=M_H>
												산 높이 :
												<%=mountain100_1_dto.getMountain_height()%>m
											</p>
											<p id=R_S>
												추천 계절 :
												<%=mountain100_1_dto.getMountain_season()%></p>

											<p id=M_T>
												<i class="xi-time-o"></i> 등산 시간 =
												<%=mountain100_1_dto.getMountain_time()%></p>
											<p id=C_D>
												<i class="xi-run"></i> 등산 난이도 :
												<%=mountain100_1_dto.getDifficulty()%></p>


											<br>
											<p id=M_C_T>-특징-</p>
											<br>
											<p id=M_C><%=mountain100_2_dto.getReason()%></p>
											<hr class=line_info>
											<br>
											<p id=M_S_T>-개관-</p>
											<br>
											<p id=M_S><%=mountain100_2_dto.getServey()%></p>
											<hr class=line_info>
											<br>
											<p id=M_I_T>-정보-</p>
											<br>
											<p id=M_I><%=mountain100_2_dto.getInformation()%></p>
											<hr class=line_info>
										</div>
									</article>
								</div>

								<!-- 산 정보(등산로 정보) -->
								<div class="history-tab-con cm-tab-con" id="historyCon02">
									<article class="history-list-box">
										<div class="Mountain-route">
											<h1 id=C_I_I>등산로 정보</h1>

											<%
												for (int i = 0; i < course_1_list.size(); i++) {
											%>
											<p id=C_CN>
												<i class="xi-walk"></i>
												<%=course_1_list.get(i).getCourse_name()%></p>
											<hr class=line_course>
											<img id=C_I class='course_exp_img'
												src='<%=course_1_list.get(i).getCourse_exp_img()%>'>

											<p id=C_E><%=course_1_list.get(i).getCourse_exp()%></p>

											<hr class=line_course>
											<%
												int course_seq = course_1_list.get(i).getCourse_seq();
											ArrayList<Course_3_img_DTO> course_3_img_list = course_3_img_dao.selectCourse(course_seq);
											for (int j = 0; j < course_3_img_list.size(); j++) {
											%>
											<img id=C_I2 class='course_3_img'
												src='<%=course_3_img_list.get(j).getCourse_img()%>'> <span
												id=C_CN2><%=course_3_img_list.get(j).getCourse_name()%></span>
											<%
												}
											%>
											<hr class=line_course>
											<%
												}
											%>

										</div>

									</article>
								</div>

								<!-- 산 정보(교통 정보) -->
								<div class="history-tab-con cm-tab-con" id="historyCon03">
									<article class="history-list-box">
										<div class="Traffic-info">
											<h1 id=T_I>
												<i class="xi-location-arrow"></i> 교통 정보
											</h1>
											<%
												for (int i = 0; i < course_2_list.size(); i++) {
											%>
											<h1 id=T_C>
												=
												<%=course_2_list.get(i).getCourse_name()%>
												=
											</h1>
											<br>
											<%
												String[] car = course_2_list.get(i).getCar().split("◈");
											%>
											<p class=T_CC>
												<i class="xi-car"></i> 차
											</p>
											<br>
											<%
												for (int c = 0; c < car.length; c++) {
												if (c % 2 == 1) {
											%>
											<p class=T_R><%=car[c]%></p>
											<%
												} else {
											%>
											<p class=T_CCC><%=car[c]%></p>
											<%
												}
											%>
											<%
												}
											%>
											<hr class=line-traffic>
											<br>
											<%
												String[] bus = course_2_list.get(i).getBus().split("◈");
											%>
											<p class=T_CC>
												<i class="xi-bus"></i> 버스
											</p>
											<br>
											<%
												for (int c = 0; c < bus.length; c++) {
												if (c % 2 == 1) {
											%>
											<p class=T_R><%=car[c]%></p>
											<%
												} else {
											%>
											<p class=T_CCC><%=car[c]%></p>
											<%
												}
											%>
											<%
												}
											%>
											<hr class=line-traffic>
											<br>
											<%
												String[] train = course_2_list.get(i).getTrain().split("◈");
											%>
											<p class=T_CC>
												<i class="xi-train"></i> 기차
											</p>
											<br>
											<%
												for (int c = 0; c < train.length; c++) {
												if (c % 2 == 1) {
											%>
											<p class=T_R><%=car[c]%></p>
											<%
												} else {
											%>
											<p class=T_CCC><%=car[c]%></p>
											<%
												}
											%>
											<%
												}
											%>
											<hr class=line-traffic>
											<%
												}
											%>

											<!-- 코스별 교통정보 출력인데  그냥 출력하면 개행 할 때 검색할 용도로 쓴 특수 기호 있어서 split로 특수기호 기준으로
                                            	개행 주고 배열에 들어가서 배열길이만큼 반복문 돌려서 출력 -->
										</div>
									</article>
								</div>


								<!-- 산 정보(지도 보기) -->
								<div class="history-tab-con cm-tab-con" id="historyCon04">
									<article class="history-list-box">
										<div class="Mountain-map">

											<!-- 현수님 지도 코드 시작점  -->
											<!DOCTYPE html>
											<html>
<head>
<meta charset="utf-8">
<title>전남 국립공원 등산로</title>
<script src="jquery-3.6.0.min.js"></script>


<style> /* 지도 확대, 축소 컨트롤 div 입니다 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 650px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}
</style>



<style> /* 지도타입 컨트롤 div 입니다 */
.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}
</style>



<style> /* 카테고리별 장소 검색하기 div 입니다 */
#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background: url('./places_category.png') no-repeat;
}

#category li .parking {
	background-position: -10px 0;
}

#category li .culture {
	background-position: -10px -36px;
}

#category li .sightseeing {
	background-position: -10px -72px;
}

#category li .accommodation {
	background-position: -10px -108px;
}

#category li .restaurant {
	background-position: -10px -144px;
}

#category li .cafe {
	background-position: -10px -180px;
}

#category li .hospital {
	background-position: -10px -216px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>



<style> /* 지형보기 버튼(슬라이더) */
/* 슬라이더 외부를 감싸는 라벨에 대한 스타일 */
.map_switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

/* HTML 기본 체크박스 숨기기 */
.map_switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

/* 슬라이더 - 실제로 토글될 부분 */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* 슬라이더를 동그랗게 보여주기 위한 부분 */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>



<style> /* 행정동 주소정보 */
.map_add_title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	right: 10px;
	top: 90%;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>



<style> /* 커스텀 오버레이(간략 안내판) */
.infowrap {
	position: absolute;
	left: -73px;
	bottom: -90px;
	width: 432px;
	height: 158px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.infowrap * {
	padding: 0;
	margin: 0;
}

.infowrap .map_info {
	width: 429px;
	height: 140px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.infowrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.map_info .co_title {
	padding: 5px 0 0 10px;
	height: 30px;
	color: #fff;
	background-color: #4d5f7c;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: normal;
}

.map_info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background: url('./overlay_close.png');
}

.map_info .close:hover {
	cursor: pointer;
}

.map_info .co_body {
	position: relative;
	overflow: hidden;
}

.map_info .map_desc {
	position: relative;
	left: 40px;
	margin: 4px 0 0 90px;
	height: 190px;
	white-space: normal;
	width: 290px;
}

.map_desc .name {
	font-weight: bold;
	color: #fff;
	background-color: #7e7e7e;
	margin: 0px;
	padding: 0px 4px;
	border-radius: 10px;
}

.map_desc .con {
	
}

.map_info .co_img img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 110px;
	height: 85px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.map_info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 6px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.map_info .link {
	color: #5085BB;
}
</style>



<style> /* 등산로 보기 버튼 */
.myButton {
	box-shadow: 5px 5px 5px 2px #9fb4f2;
	background: linear-gradient(to bottom, #7892c2 5%, #4d5f7c 100%);
	background-color: #4d5f7c;
	border-radius: 10px;
	border: 1px solid #4e6096;
	display: block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 18px;
	padding: 8px 0px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #283966;
}

.myButton:hover {
	background: linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color: #476e9e;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>

</head>



<body>

	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 650px;"></div>


		<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
		<div class="custom_zoomcontrol radius_border">
			<span onclick="zoomIn()"><img
				src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
				alt="확대"></span> <span onclick="zoomOut()"><img
				src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
				alt="축소"></span>
		</div>



		<!-- 지도타입 컨트롤 div 입니다 -->
		<div class="custom_typecontrol radius_border">
			<span id="btnRoadmap" class="selected_btn"
				onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
				class="btn" onclick="setMapType('skyview')">스카이뷰</span>
		</div>



		<!-- 카테고리별 장소 검색하기 -->
		<!-- cultural_facilities, Tourist_attraction, accommodation -->
		<ul id="category">
			<li id="OL7" data-order="0"><span class="category_bg parking"></span>
				주유소</li>
			<li id="CT1" data-order="1"><span class="category_bg culture"></span>
				문화</li>
			<li id="AT4" data-order="2"><span
				class="category_bg sightseeing"></span> 관광</li>
			<li id="AD5" data-order="3"><span
				class="category_bg accommodation"></span> 숙박</li>
			<li id="FD6" data-order="4"><span class="category_bg restaurant"></span>
				음식점</li>
			<li id="CE7" data-order="5"><span class="category_bg cafe"></span>
				카페</li>
			<li id="HP8" data-order="6"><span class="category_bg hospital"></span>
				병원</li>
		</ul>



		<div>
			<!-- 등산로 보기 버튼, 지형보기 버튼,   -->
			<button id="trail_btn"
				style="text-shadow: 0px 1px 0px #283966; position: absolute; top: 80px; bottom: 0px; left: 10px; right: 0px; overflow: hidden; width: 135px; height: 45px; margin: 0; padding: 0; z-index: 1; font-size: 18px; font-family: 'Malgun Gothic', '맑은 고딕', sans-serif; font-weight: bold; color: black; background: #4d5f7c; border-radius: 1em; padding: 0;"
				onclick="setBounds(),openOverlay();">
				<a class="myButton">등산로 보기</a>
			</button>

			<!-- 지형 토글 버튼 -->
			<label class="map_switch"
				style="position: absolute; z-index: 2; top: 10px; right: 150px;">
				<input type="checkbox" id="chkTerrain"
				onclick="setOverlayMapTypeId()" /> <span class="slider round"></span>
			</label>

			<!-- '지형' 이라는 text -->
			<div
				style="position: absolute; z-index: 1; top: 10px; right: 158px; color: white; width: 70px; border-radius: 20px; padding: 9px 15px; font-size: 12px; background-color: #4d5f7c;">지형
			</div>

			<form name="frm1">
				<!-- 깃발 토글 버튼  -->
				<label class="map_switch"
					style="position: absolute; z-index: 2; top: 10px; right: 270px;">

					<!-- '깃발' 이라는 text -->
					<div
						style="position: absolute; z-index: 0; top: 0px; right: 8px; color: white; width: 70px; border-radius: 20px; padding: 9px 15px; font-size: 12px; background-color: #4d5f7c;">깃발
					</div> <input type="checkbox" id="STmarker" onclick="setST_Markers()" />
					<span class="slider round"></span>
				</label>
			</form>


			<!-- 행정동 주소 정보 -->
			<div class="hAddr">
				<span class="map_add_title">지도중심기준 행정동 주소정보</span> <span
					id="centerAddr"></span>
			</div>
			<div
			style="background-color: #fefae0; text-align: center; padding: 40px;">
			<button class="btn_m1" value="새인봉" style="font-size:18px">새인봉 - 입석대 코스</button>
			<button class="btn_m1" value="늦재" style="font-size:18px">늦재 - 옛길코스</button>
			<button class="btn_m1" value="당산나무" style="font-size:18px">당산나무 코스</button>
			<button class="btn_m1" value="시무지기폭포" style="font-size:18px">시무지기폭포 코스</button>
			<button class="btn_m1" value="너릿재" style="font-size:18px">너릿재-옛길코스</button>
			<button class="btn_m1" value="안양산" style="font-size:18px">안양산-북산 코스</button>
			<button class="btn_m1" value="도원마을" style="font-size:18px">도원마을-규봉코스</button>
			<button class="btn_m1" value="교리" style="font-size:18px">교리~만연산코스</button>
			<br>
		</div>
	

			<!-- <span style="font-size:"><i class="xi-maker-drop"></i> 월출산</span><br>
			<button class="btn_m2" value="구름다리">구름다리</button>
			<button class="btn_m2" value="종주코스">종주코스,바람폭포경유</button>
			<button class="btn_m2" value="경포대지구">경포대지구~천황코스</button>
			<button class="btn_m2" value="천황지구">경포대지구~천황코스</button>
			<button class="btn_m2" value="도갑지구">도갑지구~경포대지구</button>
			<button class="btn_m2" value="산성대주차장">산성대주차장 ~ 광암터삼거리</button>
			<br>
			
			<span><i class="xi-maker-drop"></i> 지리산</span><br>
			<button class="btn_m3" value="구룡계곡코스">구룡계곡코스</button>
			<button class="btn_m3" value="삼신봉코스">삼신봉코스</button>
			<button class="btn_m3" value="뱀사골계곡코스">뱀사골계곡코스</button>
			<button class="btn_m3" value="정령치">정령치- 바래봉코스</button>
			<button class="btn_m3" value="만복대코스">만복대코스</button>
			<button class="btn_m3" value="화엄계곡코스">화엄계곡코스</button>
			<button class="btn_m3" value="피아골코스">피아골코스</button>
			<button class="btn_m3" value="반야봉코스">반야봉코스</button>
			<button class="btn_m3" value="불일폭포코스">불일폭포코스</button>
			<button class="btn_m3" value="중산리1">중산리(장터목)코스</button>
			<button class="btn_m3" value="중산리2">중산리(칼바위)코스</button>
			<button class="btn_m3" value="백무동">백무동~중산리코스</button>
			<button class="btn_m3" value="백무동코스">백무동코스</button>
			<button class="btn_m3" value="거림코스">거림코스</button>
			<button class="btn_m3" value="유평">유평(대원사)코스</button>
			<button class="btn_m3" value="노고단코스">노고단코스</button> -->

			<script>
	var current = "새인봉"
		$('.btn_m1').on('click', function(){
			current = $(this).attr('value');
			console.log("버튼 누른 후 : "+current);
			makeMap1();
			makeMap2_mu();
			makeMap3();
		});
		$('.btn_m2').on('click', function(){
			current = $(this).attr('value');
			console.log("버튼 누른 후 : "+current);
			makeMap1();
			makeMap2_wol();
			makeMap3();
		});
		$('.btn_m3').on('click', function(){
			current = $(this).attr('value');
			console.log("버튼 누른 후 : "+current);
			makeMap1();
			makeMap2_ji();
			makeMap3();
		});
	</script>

			<!-- json 통신 -->
			<script type="text/javascript">
		var mt_data
		var trail_list_m_obj = {};
		$.ajax({
			url: "trail_json.html",
			type: "post",
			success: function (data){
					mt_data = JSON.parse(data);
					for(var k of Object.keys(mt_data)){
						//console.log("산이름 :"+k);
						trail_list_m_obj[k] = {};
						for(var j of Object.keys(mt_data[k])){
							//console.log("코스이름 : "+j)
							trail_list_m_obj[k][j] = new Array();
							//console.log(k+" 의"+j+" 길이 : "+mt_data[k][j].length);
							for(var i=0; i<mt_data[k][j].length;i++){
								//console.log("데이터 : "+mt_data[k][j][i]);
								trail_list_m_obj[k][j].push(mt_data[k][j][i]);
							};
						};
						
						//trail_list_m_obj[k] = trail_list_obj[j];
					};
					
					//console.log("최종 " +trail_list_m_obj.무등산.새인봉);
					console.log("trail_list_m_obj 완료");
					//console.log("dd: "+trail_list_m_obj.무등산[current]);
			},
			error: function() {
				alert("실패!");
			}
		});
		

	</script>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=570ba83ef799797bed963963c7518be2&libraries=clusterer&libraries=services"></script>
			<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.317068711991006,126.86217720529942), // 지도의 중심좌표
        level: 5, // 지도의 확대 레벨
        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
    }; 

	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 경로의 집합(등산로) 출력, 배열 변수 선언
	var polyline = new Array();
	var trail_list_kakao_obj = {};
	var trail_list_kakao = new Array();
	var trail_color = new Array();
	
	// 색상 지정
	trail_color[0]="#FF0000";
	trail_color[1]="#FF9900";
	trail_color[2]="#FFFF00";
	trail_color[3]="#00FF00";
	trail_color[4]="#00FFFF";
	trail_color[5]="#0000FF";
	trail_color[6]="#FF00FF";
	trail_color[7]="#664B00";
	trail_color[8]="#290066";
	trail_color[9]="#660033";
	
	// k = 산이름
	// j = 코스이름
	// i = 위도, 경도
	// 등산로 개별 반복문 시작
	for(var i=0; i<trail_list_m_obj['무등산'][current].length; i++){
		trail_list_kakao[i]=[];
		
		if(i>=10){
			trail_color[i]="#"+Math.round(Math.random() * 0xffffff).toString(16);		
		}
			
		// 각 등산로에 좌표 입력
		for(var j=0; j<trail_list_m_obj['무등산'][current][i].length; j++){
			임시=new kakao.maps.LatLng(trail_list_m_obj['무등산'][current][i][j][0], trail_list_m_obj['무등산'][current][i][j][1]);
			trail_list_kakao[i].push(임시);
		}
	
		// 지도에 표시할 선을 생성합니다
	    polyline[i] = new kakao.maps.Polyline({
	    path: trail_list_kakao[i], // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: trail_color[i], // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
			});
		
	 	// 지도에 선을 표시합니다 
	    polyline[i].setMap(map);
	
	}
	
	
	
	
	
	// 좌표가 2차원 배열일 경우 지도 범위 재설정하는 코드
	var bounds = new kakao.maps.LatLngBounds();  
	
	for(var i=0; i<trail_list_m_obj['무등산'][current].length; i++){
		trail_list_kakao[i]=[];
			
			// 각 등산로에 좌표 입력
			for(var j=0; j<trail_list_m_obj['무등산'][current][i].length; j++){
			    // LatLngBounds 객체에 좌표를 추가합니다
			    bounds.extend(new kakao.maps.LatLng(trail_list_m_obj['무등산'][current][i][j][0], trail_list_m_obj['무등산'][current][i][j][1]));
			}
	}
	// 버튼을 사용할 경우 marker들을 기준으로 지도의 범위를 재설정한다.
	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.panTo(bounds);;
	}
	// 시작시 marker들을 기준으로 지도의 범위를 재설정한다.
	map.panTo(bounds);
	
	
	
	
	
	// 지형지도를 생성합니다.
	var mapTypes = {
		    terrain : kakao.maps.MapTypeId.TERRAIN,  
	};
	
	function setOverlayMapTypeId() {
		var chkTerrain = document.getElementById('chkTerrain');
		    
	    // 지도 타입을 제거합니다
	    for (var type in mapTypes) {
	        map.removeOverlayMapTypeId(mapTypes[type]);    
	    }
	    
	    // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
	    if (chkTerrain.checked) {
	        map.addOverlayMapTypeId(mapTypes.terrain);    
	    }
	} 
	
	
	
	
	
	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'btn';
	    } else {
	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'btn';
	    }
	}
	
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}
	
	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	
	
	
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	
	    
	    
	 // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places(map); 

    // 지도에 idle 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', searchPlaces);

    // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
    contentNode.className = 'placeinfo_wrap';

    // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
    // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
    addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
    addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

    // 커스텀 오버레이 컨텐츠를 설정합니다
    placeOverlay.setContent(contentNode);  

    // 각 카테고리에 클릭 이벤트를 등록합니다
    addCategoryClickEvent();

    // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
    function addEventHandle(target, type, callback) {
        if (target.addEventListener) {
            target.addEventListener(type, callback);
        } else {
            target.attachEvent('on' + type, callback);
        }
    }

    // 카테고리 검색을 요청하는 함수입니다
    function searchPlaces() {
        if (!currCategory) {
            return;
        }
        
        // 커스텀 오버레이를 숨깁니다 
        placeOverlay.setMap(null);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
            displayPlaces(data);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

        } else if (status === kakao.maps.services.Status.ERROR) {
            // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
            
        }
    }

    // 지도에 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
        // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
        var order = document.getElementById(currCategory).getAttribute('data-order');

        

        for ( var i=0; i<places.length; i++ ) {

                // 마커를 생성하고 지도에 표시합니다
                var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

                // 마커와 검색결과 항목을 클릭 했을 때
                // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                (function(marker, place) {
                    kakao.maps.event.addListener(marker, 'click', function() {
                        displayPlaceInfo(place);
                    });
                })(marker, places[i]);
        }
    }    
    
    
    
    
    
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, order) {
        var imageSrc = './places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(72, 244), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }
 
 
 
 
 
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }





    // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
    function displayPlaceInfo (place) {
        var content = '<div class="placeinfo">' +
                        '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

        if (place.road_address_name) {
            content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                        '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
        }  else {
            content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
        }                
       
        content += '    <span class="tel">' + place.phone + '</span>' + 
                    '</div>' + 
                    '<div class="after"></div>';

        contentNode.innerHTML = content;
        placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
        placeOverlay.setMap(map);  
    }






    // 각 카테고리에 클릭 이벤트를 등록합니다
    function addCategoryClickEvent() {
        var category = document.getElementById('category'),
            children = category.children;

        for (var i=0; i<children.length; i++) {
            children[i].onclick = onClickCategory;
        }
    }





    // 카테고리를 클릭했을 때 호출되는 함수입니다
    function onClickCategory() {
        var id = this.id,
            className = this.className;

        placeOverlay.setMap(null);

        if (className === 'on') {
            currCategory = '';
            changeCategoryClass();
            removeMarker();
        } else {
            currCategory = id;
            changeCategoryClass(this);
            searchPlaces();
        }
    }





    // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
    function changeCategoryClass(el) {
        var category = document.getElementById('category'),
            children = category.children,
            i;

        for ( i=0; i<children.length; i++ ) {
            children[i].className = '';
        }

        if (el) {
            el.className = 'on';
        } 
    } 
    
    







	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);

	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});

	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var infoDiv = document.getElementById('centerAddr');

			for(var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					infoDiv.innerHTML = result[i].address_name;
					break;
				}
			}
		}    
	}
	
	
	
	
	
	
	var cnt = 0;
	
	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다
	var content = 
	'<div class="infowrap">' + 
    '    <div class="map_info">' + 
    '        <div class="co_title">' + 
    '            새인봉 - 입석대 코스' + 
    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="co_body">' + 
    '            <div class="co_img">' +
    '                <img src="./trail_pic/122000V001.jpg" width="73" height="70">' +
    '           </div>' + 
    '            <div class="map_desc">' + 
    '                <span class="name">상세구간</span> <span class="con">증심사입구 - 새인봉 - 서인봉 - 장불재 - 서석대</span><br>' +
    '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
    '                <span class="name">소요시간</span> <span class="con">03 시간 30분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">6.8km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
    '				 <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';

	// 커스텀 오버레이가 표시될 위치입니다. 이 코드는 지금은 의미가 없습니다만, 원래 이렇게 썻다고 기록을 남깁니다.
	var position = new kakao.maps.LatLng(35.149830, 126.919837);

	// 커스텀 오버레이를 생성합니다
	var customOverlay = new Array;
	    customOverlay[cnt]= new kakao.maps.CustomOverlay({
	    position: map.getCenter(),
	    map: map,
	    content: content   
	});

	// 커스텀 오버레이를 지도에 표시합니다
	customOverlay[cnt].setMap(map);

	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
	    customOverlay[cnt].setMap(null);     
	}
	
	function openOverlay() {
		customOverlay[cnt].setMap(map);
	}

	
	
	
	var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
    startOption = { 
        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };
	
	// 출발 마커 이미지를 생성합니다
	var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

	var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
	    startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
	    startDragOption = { 
	        offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };

	// 출발 마커의 드래그 이미지를 생성합니다
	var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

	var map_level_Lng1 = 1+map.getLevel()*-0.000005;
	var map_level_Lng2 = 1+map.getLevel()*0.0000035;
	var map_level_Lat1 = 1+map.getLevel()*-0.00004;
	var map_level_Lat2 = 1+map.getLevel()*-0.00004;
	
	// 출발 마커가 표시될 위치입니다 
	var startPosition = new kakao.maps.LatLng(map.getCenter().getLat()*map_level_Lat1,map.getCenter().getLng()*map_level_Lng1); 
	
	// 출발 마커를 생성합니다
	var startMarker = new Array();
	    startMarker[cnt] = new kakao.maps.Marker({
	    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
	    position: startPosition,
	    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
	    image: startImage // 출발 마커이미지를 설정합니다
	});

	// 출발 마커에 dragstart 이벤트를 등록합니다
	kakao.maps.event.addListener(startMarker[cnt], 'dragstart', function() {
	    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
	    startMarker[cnt].setImage(startDragImage);
	});

	// 출발 마커에 dragend 이벤트를 등록합니다
	kakao.maps.event.addListener(startMarker[cnt], 'dragend', function() {
	     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
	    startMarker[cnt].setImage(startImage);
	});

	var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
	arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
	arriveOption = { 
	    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	};

	// 도착 마커 이미지를 생성합니다
	var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

	var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
	    arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
	    arriveDragOption = { 
	        offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };
	 
	// 도착 마커의 드래그 이미지를 생성합니다
	var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

	// 도착 마커가 표시될 위치입니다 
	var arrivePosition = new kakao.maps.LatLng(map.getCenter().getLat()*map_level_Lat2,map.getCenter().getLng()*map_level_Lng2);    
	 
	// 도착 마커를 생성합니다 
	var arriveMarker = new Array();
	    arriveMarker[cnt] = new kakao.maps.Marker({  
	    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
	    position: arrivePosition,
	    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
	    image: arriveImage // 도착 마커이미지를 설정합니다
	});

	// 도착 마커에 dragstart 이벤트를 등록합니다
	kakao.maps.event.addListener(arriveMarker[cnt], 'dragstart', function() {
	    // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
	    arriveMarker[cnt].setImage(arriveDragImage);
	});

	// 도착 마커에 dragend 이벤트를 등록합니다
	kakao.maps.event.addListener(arriveMarker[cnt], 'dragend', function() {
	     // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
	    arriveMarker[cnt].setImage(arriveImage);  
	});
	
	function showSAmarker(){
		startMarker[cnt].setVisible(true);
		arriveMarker[cnt].setVisible(true);
	}
	
	function closeSAmarker(){
		startMarker[cnt].setVisible(false);
		arriveMarker[cnt].setVisible(false);
	}
	
	closeSAmarker();
	
	// 토글하면 출발, 도착 마커가 보이거나 안보인다.
	function setST_Markers(){
	    if (STmarker.checked) {
			showSAmarker();
	    }else {
	    	closeSAmarker();
	    }
	}
	
	var current_mountain_name="무등산"
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	var before = current;
	function del_polyline(){
		if(current_mountain_name == "무등산"){
			for(var i = 0; i<trail_list_m_obj['무등산'][before].length;i++){
			  	polyline[i].setMap(null);
			}
		}else if(current_mountain_name == "월출산"){
			for(var i = 0; i<trail_list_m_obj['월출산'][before].length;i++){
			  	polyline[i].setMap(null);
			}
		}else if(current_mountain_name == "지리산"){
			for(var i = 0; i<trail_list_m_obj['지리산'][before].length;i++){
			  	polyline[i].setMap(null);
			}
		}
	}
	function clear_onclick(){
		for(var i=0; i<document.frm1.length;i++){
			document.frm1.elements[i].checked=false;
		}
	}
	function del_customOverlay(){
		customOverlay[cnt].setMap(null);
	}
	function view_cnt(){
		console.log('cnt : '+cnt);
	}
	
	function makeMap1(){
		clear_onclick();
		del_polyline();
		del_customOverlay();
		closeSAmarker();
		cnt=cnt+1;
		
		// 함수 안에서 그리는 것은 되는데, 지우는 것은 안된다. 선생님은 지도를 새로 만들었기 때문에 이전 등산로가 사라졌던 것이다.
		
	  	// 경로의 집합(등산로) 출력, 배열 변수 선언
		var trail_list_kakao_obj = {};
		var trail_list_kakao = new Array();
		
		// 색상 지정
		trail_color[0]="#FF0000";
		trail_color[1]="#FF9900";
		trail_color[2]="#FFFF00";
		trail_color[3]="#00FF00";
		trail_color[4]="#00FFFF";
		trail_color[5]="#0000FF";
		trail_color[6]="#FF00FF";
		trail_color[7]="#664B00";
		trail_color[8]="#290066";
		trail_color[9]="#660033";
		
	}
	
	function makeMap2_mu(){
		// k = 산이름
		// j = 코스이름
		// i = 위도, 경도
		// 등산로 개별 반복문 시작
	    for(var i=0; i<trail_list_m_obj['무등산'][current].length; i++){
			trail_list_kakao[i]=[];
	    		
			// 각 등산로에 좌표 입력
			for(var j=0; j<trail_list_m_obj['무등산'][current][i].length; j++){
				임시=new kakao.maps.LatLng(trail_list_m_obj['무등산'][current][i][j][0], trail_list_m_obj['무등산'][current][i][j][1]);
				trail_list_kakao[i].push(임시);
			}
	
			// 지도에 표시할 선을 생성합니다
	        polyline[i] = new kakao.maps.Polyline({
	        path: trail_list_kakao[i], // 선을 구성하는 좌표배열 입니다
	        strokeWeight: 5, // 선의 두께 입니다
	        strokeColor: trail_color[i], // 선의 색깔입니다
	        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid' // 선의 스타일입니다
	   		});
			
	     	// 지도에 선을 표시합니다 
		    polyline[i].setMap(map);

	    }

	    
	    
		
		
		// 좌표가 2차원 배열일 경우 지도 범위 재설정하는 코드
		bounds = new kakao.maps.LatLngBounds();  
		
	    for(var i=0; i<trail_list_m_obj['무등산'][current].length; i++){
			trail_list_kakao[i]=[];
	    		
				// 각 등산로에 좌표 입력
				for(var j=0; j<trail_list_m_obj['무등산'][current][i].length; j++){
					
				    // LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(new kakao.maps.LatLng(trail_list_m_obj['무등산'][current][i][j][0], trail_list_m_obj['무등산'][current][i][j][1]));
				}
	    }
		// 시작시 marker들을 기준으로 지도의 범위를 재설정한다.
		map.panTo(bounds);
		current_mountain_name="무등산"
	}
	
	function makeMap2_wol(){
		// k = 산이름
		// j = 코스이름
		// i = 위도, 경도
		// 등산로 개별 반복문 시작
	    for(var i=0; i<trail_list_m_obj['월출산'][current].length; i++){
			trail_list_kakao[i]=[];
	    		
			// 각 등산로에 좌표 입력
			for(var j=0; j<trail_list_m_obj['월출산'][current][i].length; j++){
				임시=new kakao.maps.LatLng(trail_list_m_obj['월출산'][current][i][j][0], trail_list_m_obj['월출산'][current][i][j][1]);
				trail_list_kakao[i].push(임시);
			}
	
			// 지도에 표시할 선을 생성합니다
	        polyline[i] = new kakao.maps.Polyline({
	        path: trail_list_kakao[i], // 선을 구성하는 좌표배열 입니다
	        strokeWeight: 5, // 선의 두께 입니다
	        strokeColor: trail_color[i], // 선의 색깔입니다
	        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid' // 선의 스타일입니다
	   		});
			
	     	// 지도에 선을 표시합니다 
		    polyline[i].setMap(map);

	    }

	    
	    
		
		
		// 좌표가 2차원 배열일 경우 지도 범위 재설정하는 코드
		bounds = new kakao.maps.LatLngBounds();  
		
	    for(var i=0; i<trail_list_m_obj['월출산'][current].length; i++){
			trail_list_kakao[i]=[];
	    		
				// 각 등산로에 좌표 입력
				for(var j=0; j<trail_list_m_obj['월출산'][current][i].length; j++){
					
				    // LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(new kakao.maps.LatLng(trail_list_m_obj['월출산'][current][i][j][0], trail_list_m_obj['월출산'][current][i][j][1]));
				}
	    }
		// 시작시 marker들을 기준으로 지도의 범위를 재설정한다.
		map.panTo(bounds);
		current_mountain_name="월출산"
	}
	
	function makeMap2_ji(){
		// k = 산이름
		// j = 코스이름
		// i = 위도, 경도
		// 등산로 개별 반복문 시작
	    for(var i=0; i<trail_list_m_obj['지리산'][current].length; i++){
			trail_list_kakao[i]=[];
	    		
			// 각 등산로에 좌표 입력
			for(var j=0; j<trail_list_m_obj['지리산'][current][i].length; j++){
				임시=new kakao.maps.LatLng(trail_list_m_obj['지리산'][current][i][j][0], trail_list_m_obj['지리산'][current][i][j][1]);
				trail_list_kakao[i].push(임시);
			}
	
			// 지도에 표시할 선을 생성합니다
	        polyline[i] = new kakao.maps.Polyline({
	        path: trail_list_kakao[i], // 선을 구성하는 좌표배열 입니다
	        strokeWeight: 5, // 선의 두께 입니다
	        strokeColor: trail_color[i], // 선의 색깔입니다
	        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid' // 선의 스타일입니다
	   		});
			
	     	// 지도에 선을 표시합니다 
		    polyline[i].setMap(map);

	    }

	    
	    
		
		
		// 좌표가 2차원 배열일 경우 지도 범위 재설정하는 코드
		bounds = new kakao.maps.LatLngBounds();  
		
	    for(var i=0; i<trail_list_m_obj['지리산'][current].length; i++){
			trail_list_kakao[i]=[];
	    		
				// 각 등산로에 좌표 입력
				for(var j=0; j<trail_list_m_obj['지리산'][current][i].length; j++){
					
				    // LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(new kakao.maps.LatLng(trail_list_m_obj['지리산'][current][i][j][0], trail_list_m_obj['지리산'][current][i][j][1]));
				}
	    }
		// 시작시 marker들을 기준으로 지도의 범위를 재설정한다.
		map.panTo(bounds);
		current_mountain_name="지리산"
	}
			
		
			
	function makeMap3(){
			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다
			
			switch(current){
			case "새인봉":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            새인봉 - 입석대 코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V001.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">증심사입구 - 새인봉 - 서인봉 - 장불재 - 서석대</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">03 시간 30분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">6.8km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '				 <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "늦재":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            늦재 - 옛길코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V002.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">원효사입구 - 늦재 - 동화사터 - 용추삼거리 - 장불재 - 목교 - 원효사입구 - 목교 - 원효사입구</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">09 시간 50분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">10.4km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "당산나무":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            당산나무 코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V003.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">증심사주차장 - 당산나무 - 중머리재</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">01 시간 35분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">4.0km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "시무지기폭포":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            시무지기폭포 코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V004.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">증심교 - 토끼등 - 중머리재 - 장불재 - 규봉 - 시무지기폭포 - 인계리</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">16 시간 55분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">12.0km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "너릿재":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            너릿재-옛길코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V005.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">이십곡리-수레바위산-너와나목장-중머리재-장불재-원효사</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">07 시간 20분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">14.9km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "안양산":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            안양산 - 북산 코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V006.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">안양산휴양림 - 안양산 - 장불재 - 규봉 - 북산 - 담양경상리</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">07 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">12.2km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "도원마을":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            도원마을 - 규봉코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V007.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">도원마을 - 장불재 - 규봉 - 영신마을</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">03 시간 30분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">7.5km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "교리":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            교리 - 만연산코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/122000V008.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">교리 - 수레바위산 - 만연사</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">04 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">7.5km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "월출산":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            구름다리' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/121700V001.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">천황탐방지원센터~천황사~구름다리~바람폭포 삼거리~천황탐방지원센터</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">02 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">3.0km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">하</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "종주코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            종주코스,바람폭포 경유' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/121700V002.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">천황지구~도갑지구</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">06 시간 30분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">9.5km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">상</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "경포대지구":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            경포대지구~천황지구' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/121700V003.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">경포대지구~천황지구</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">03 시간 10분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">5.9km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "천황지구": 
				content = '<div class="infowrap">' + 
	           '    <div class="map_info">' + 
	           '        <div class="co_title">' + 
	           '            천황지구 순환코스' + 
	           '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	           '        </div>' + 
	           '        <div class="co_body">' + 
	           '            <div class="co_img">' +
	           '                <img src="./trail_pic/121700V004.jpg" width="73" height="70">' +
	           '           </div>' + 
	           '            <div class="map_desc">' + 
	           '                <span class="name">상세구간</span> <span class="con">천황지구~천황지구</span><br>' +
	           '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	           '                <span class="name">소요시간</span> <span class="con">04 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">6.7km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">상</span><br>' + 
	           '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	           '            </div>' + 
	           '        </div>' + 
	           '    </div>' +    
	           '</div>';
            	break;
			case "도갑지구":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            도갑지구~경포대지구' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/121700V005.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">도갑지구~경포대지구</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">03 시간 40분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">6.9km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
            	break;
			case "산성대주차장":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            산성대주차장 ~ 광암터삼거리' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/121700V006.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">산성대주차장~산성대~광암터삼거리</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">02 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">3.3km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">상</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "구룡계곡코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            구룡계곡코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V001.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">구룡삼곡(구룡탐방지원센터)-유선대-비폭동-구룡폭포</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">02 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">3.1km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">하</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "삼신봉코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            삼신봉코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V002.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">청학동탐방지원센터~삼신봉~상불재~삼성궁</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">05 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">8.3km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "뱀사골계곡코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            뱀사골계곡코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V003.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">반선-뱀사골탐방안내소-요룡대-병소-간장소-뱀사골탐방지원센터-화개재</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">04 시간 20분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">9.2km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
           		break;
			case "정령치":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            정령치- 바래봉코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V004.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">정령치-세걸산-세동치-부운치-팔랑치-바래봉삼거리-운봉아래(용산리)</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">06 시간 10분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">12.8km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "만복대코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            만복대코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V005.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">성삼재 탐방로 입구~당치고개~고리봉~묘봉치~만복대정</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">03 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">5.4km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "화엄계곡코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            화엄계곡코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V006.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">화엄사~연기암~무넹기</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">04 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">7.0km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">상</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "피아골코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            피아골코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V007.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">피아골분소~직전마을~표고막터~피아골 대피소~ 피아골 삼거리</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">05 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">8.0km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "반야봉코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            반야봉코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V008.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">노고단고개~임걸령~노루목~반야봉</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">03 시간 30분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">5.5km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "불일폭포코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            불일폭포코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="././trail_pic/120100V009.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">쌍계사탐방지원센터~불일폭포~쌍계사탐방지원센터</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">03 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">4.8km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">하</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
				break;
			case "중산리1":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            중산리(장터목)코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V010.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">중산리탐방안내소~장터목대피소~천왕봉~로타리대피소~중산리</span><br>' +
	            '                <span class="name">일정</span> <span class="con">1박2일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">09 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">12.4km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "중산리2":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            중산리(칼바위)코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="././trail_pic/120100V011.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">중산리탐방안내소~칼바위~로타리대피소~천왕봉~중산리탐방안내소</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">08 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">10.8km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "백무동":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            백무동~중산리코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V012.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">백무동탐방지원센터~장터목대피소~천왕봉~로타리대피소~중산리탐방안내소</span><br>' +
	            '                <span class="name">일정</span> <span class="con">1박2일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">09 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">12.9km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "백무동코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            백무동코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V013.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">백무동탐방지원센터~장터목대피소~천왕봉~장터목대피소~백무동탐방지원센터</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">11 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">15.0km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "거림코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            거림코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V014.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">거림공원지킴터~세석대피소~장터목대피소~천왕봉~로타리대피소~중산리 탐방안내소</span><br>' +
	            '                <span class="name">일정</span> <span class="con">1박2일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">11 시간 30분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">18.9km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
				break;
			case "노고단코스":
				content = '<div class="infowrap">' + 
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            노고단코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V015.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">성삼재주차장~무넹기~노고단대피소~노고단고개</span><br>' +
	            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">01 시간 00분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">4.7km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">하</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	            break;
			case "유평":
				content = '<div class="infowrap">' +
	            '    <div class="map_info">' + 
	            '        <div class="co_title">' + 
	            '            유평(대원사)코스' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="co_body">' + 
	            '            <div class="co_img">' +
	            '                <img src="./trail_pic/120100V016.jpg" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="map_desc">' + 
	            '                <span class="name">상세구간</span> <span class="con">유평탐방지원센터~유평청소년수련원(밤밭골)~치밭목대피소~천왕봉~로타리대피소</span><br>' +
	            '                <span class="name">일정</span> <span class="con">1박2일</span><br>' + 
	            '                <span class="name">소요시간</span> <span class="con">12 시간 30분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">21.5km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">상</span><br>' + 
	            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	       		break;
	       		default:
	       			break;
			}

			setTimeout(function(){
				// 커스텀 오버레이를 생성합니다. 딜레이를 안주면 가까운 곳으로 이동할 때 커스텀 오버레이의 위치가 변하지 않는다.
			    customOverlay[cnt]= new kakao.maps.CustomOverlay({
			    position: map.getCenter(),
			    map: map,
			    content: content   
				});
			
				
				// 출발 도착 마커의 적당한 위치를 위한 식입니다.
				map_level_Lng1 = 1+map.getLevel()*-0.000005;
				map_level_Lng2 = 1+map.getLevel()*0.0000035;
				map_level_Lat1 = 1+map.getLevel()*-0.00004;
				map_level_Lat2 = 1+map.getLevel()*-0.00004;
				
				// 출발 마커가 표시될 위치입니다 
				startPosition = new kakao.maps.LatLng(map.getCenter().getLat()*map_level_Lat1,map.getCenter().getLng()*map_level_Lng1); 
				
				// 출발 마커를 생성합니다
				    startMarker[cnt] = new kakao.maps.Marker({
				    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
				    position: startPosition,
				    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
				    image: startImage // 출발 마커이미지를 설정합니다
				});
		
				// 출발 마커에 dragstart 이벤트를 등록합니다
				kakao.maps.event.addListener(startMarker[cnt], 'dragstart', function() {
				    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
				    startMarker[cnt].setImage(startDragImage);
				});
		
				// 출발 마커에 dragend 이벤트를 등록합니다
				kakao.maps.event.addListener(startMarker[cnt], 'dragend', function() {
				     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
				    startMarker[cnt].setImage(startImage);
				});
		
				// 도착 마커가 표시될 위치입니다 
				arrivePosition = new kakao.maps.LatLng(map.getCenter().getLat()*map_level_Lat2,map.getCenter().getLng()*map_level_Lng2);    
				 
				// 도착 마커를 생성합니다 
				    arriveMarker[cnt] = new kakao.maps.Marker({  
				    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
				    position: arrivePosition,
				    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
				    image: arriveImage // 도착 마커이미지를 설정합니다
				});
		
				// 도착 마커에 dragstart 이벤트를 등록합니다
				kakao.maps.event.addListener(arriveMarker[cnt], 'dragstart', function() {
				    // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
				    arriveMarker[cnt].setImage(arriveDragImage);
				});
		
				// 도착 마커에 dragend 이벤트를 등록합니다
				kakao.maps.event.addListener(arriveMarker[cnt], 'dragend', function() {
				     // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
				    arriveMarker[cnt].setImage(arriveImage);  
				});
				
				closeSAmarker();
			
			}, 300);
			

		

		

			
			before = current;
	}
	</script>
</body>
											</html>

											</script>
											<script type="text/javascript"
												src="//dapi.kakao.com/v2/maps/sdk.js?appkey=570ba83ef799797bed963963c7518be2&libraries=clusterer&libraries=services"></script>
											<script type="text/javascript">
	function makeMap(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(35.317068711991006,126.86217720529942), // 지도의 중심좌표
		        level: 5, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		
		
	  	// 경로의 집합(등산로) 출력, 배열 변수 선언
		var polyline = new Array();
		var trail_list_kakao_obj = {};
		var trail_list_kakao = new Array();
		var trail_color = new Array();
		
		// 색상 지정
		trail_color[0]="#FF0000";
		trail_color[1]="#FF9900";
		trail_color[2]="#FFFF00";
		trail_color[3]="#00FF00";
		trail_color[4]="#00FFFF";
		trail_color[5]="#0000FF";
		trail_color[6]="#FF00FF";
		trail_color[7]="#664B00";
		trail_color[8]="#290066";
		trail_color[9]="#660033";
		
		
		
		// k = 산이름
		// j = 코스이름
		// i = 위도, 경도
		console.log("current :"+current);
		//console.log("버튼 누른 후 : "+trail_list_m_obj.무등산[current]);
		
		
		// 등산로 개별 반복문 시작
	    for(var i=0; i<trail_list_m_obj.무등산[current].length; i++){
			trail_list_kakao[i]=[];
	    		
			// 각 등산로에 좌표 입력
			for(var j=0; j<trail_list_m_obj['무등산'][current][i].length; j++){
				임시=new kakao.maps.LatLng(trail_list_m_obj['무등산'][current][i][j][0], trail_list_m_obj['무등산'][current][i][j][1]);
				trail_list_kakao[i].push(임시);
			}
	
			// 지도에 표시할 선을 생성합니다
	        polyline[i] = new kakao.maps.Polyline({
	        path: trail_list_kakao[i], // 선을 구성하는 좌표배열 입니다
	        strokeWeight: 5, // 선의 두께 입니다
	        strokeColor: trail_color[i], // 선의 색깔입니다
	        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid' // 선의 스타일입니다
	   		});
			
	     	// 지도에 선을 표시합니다 
		    polyline[i].setMap(map);

	    }
		
		
				
/*  		for(var k of Object.keys(trail_list_obj)){
			trail_list_kakao_obj[k] = new Array();
			
				for(var i = 0; i<trail_list_obj[k].length;i++){
					trail_list_kakao_obj[k][i]=[];
				
					// 각 경로에 좌표 입력
					for(var j=0; j<trail_list_obj[k][i].length; j++){

						임시=new kakao.maps.LatLng(trail_list_obj[k][i][j][0], trail_list_obj[k][i][j][1]);
						trail_list_kakao_obj[k][i].push(임시);
					}
					
					// 지도에 표시할 선을 생성합니다
			        polyline[i] = new kakao.maps.Polyline({
			        path: trail_list_kakao_obj[k][i], // 선을 구성하는 좌표배열 입니다
			        strokeWeight: 5, // 선의 두께 입니다
			        strokeColor: trail_color[i], // 선의 색깔입니다
			        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			        strokeStyle: 'solid' // 선의 스타일입니다
			   		});
					
			     	// 지도에 선을 표시합니다 
				    polyline[i].setMap(map);
				}
		}  */

		
		
	    
	    
		
		// 좌표가 2차원 배열일 경우 지도 범위 재설정하는 코드
		var bounds = new kakao.maps.LatLngBounds();  
		
		var i, marker;
	    for(var i=0; i<trail_list_m_obj['무등산'][current].length; i++){
			trail_list_kakao[i]=[];
	    		
				// 각 등산로에 좌표 입력
				for(var j=0; j<trail_list_m_obj['무등산'][current][i].length; j++){
				    marker =     new kakao.maps.Marker({ position : new kakao.maps.LatLng(trail_list_m_obj['무등산'][current][i][j][0], trail_list_m_obj['무등산'][current][i][j][1]) });
				    // marker.setMap(map);
				    
				    // LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(new kakao.maps.LatLng(trail_list_m_obj['무등산'][current][i][j][0], trail_list_m_obj['무등산'][current][i][j][1]));
				}
	    }
	    // 버튼을 사용할 경우 marker들을 기준으로 지도의 범위를 재설정한다.
		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.panTo(bounds);;
		}
		// 시작시 marker들을 기준으로 지도의 범위를 재설정한다.
		map.panTo(bounds);
		
		
		
		
		
		var mapTypes = {
			    terrain : kakao.maps.MapTypeId.TERRAIN,  
		};
		
		function setOverlayMapTypeId() {
			var chkTerrain = document.getElementById('chkTerrain');
			    
		    // 지도 타입을 제거합니다
		    for (var type in mapTypes) {
		        map.removeOverlayMapTypeId(mapTypes[type]);    
		    }
		    
		    // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
		    if (chkTerrain.checked) {
		        map.addOverlayMapTypeId(mapTypes.terrain);    
		    }
		}  
		
		
		
		
		
		// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
		function setMapType(maptype) { 
		    var roadmapControl = document.getElementById('btnRoadmap');
		    var skyviewControl = document.getElementById('btnSkyview'); 
		    if (maptype === 'roadmap') {
		        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
		        roadmapControl.className = 'selected_btn';
		        skyviewControl.className = 'btn';
		    } else {
		        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
		        skyviewControl.className = 'selected_btn';
		        roadmapControl.className = 'btn';
		    }
		}

		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomIn() {
		    map.setLevel(map.getLevel() - 1);
		}

		// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomOut() {
		    map.setLevel(map.getLevel() + 1);
		}
		
		

		
		
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		
		    
		    
		 // 장소 검색 객체를 생성합니다
		    var ps = new kakao.maps.services.Places(map); 

		    // 지도에 idle 이벤트를 등록합니다
		    kakao.maps.event.addListener(map, 'idle', searchPlaces);

		    // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		    contentNode.className = 'placeinfo_wrap';

		    // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		    // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		    addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		    addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		    // 커스텀 오버레이 컨텐츠를 설정합니다
		    placeOverlay.setContent(contentNode);  

		    // 각 카테고리에 클릭 이벤트를 등록합니다
		    addCategoryClickEvent();

		    // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		    function addEventHandle(target, type, callback) {
		        if (target.addEventListener) {
		            target.addEventListener(type, callback);
		        } else {
		            target.attachEvent('on' + type, callback);
		        }
		    }

		    // 카테고리 검색을 요청하는 함수입니다
		    function searchPlaces() {
		        if (!currCategory) {
		            return;
		        }
		        
		        // 커스텀 오버레이를 숨깁니다 
		        placeOverlay.setMap(null);

		        // 지도에 표시되고 있는 마커를 제거합니다
		        removeMarker();
		        
		        ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
		    }

		    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		    function placesSearchCB(data, status, pagination) {
		        if (status === kakao.maps.services.Status.OK) {

		            // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		            displayPlaces(data);
		        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		            // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		        } else if (status === kakao.maps.services.Status.ERROR) {
		            // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		            
		        }
		    }

		    // 지도에 마커를 표출하는 함수입니다
		    function displayPlaces(places) {

		        // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		        // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		        var order = document.getElementById(currCategory).getAttribute('data-order');

		        

		        for ( var i=0; i<places.length; i++ ) {

		                // 마커를 생성하고 지도에 표시합니다
		                var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

		                // 마커와 검색결과 항목을 클릭 했을 때
		                // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		                (function(marker, place) {
		                    kakao.maps.event.addListener(marker, 'click', function() {
		                        displayPlaceInfo(place);
		                    });
		                })(marker, places[i]);
		        }
		    }    
		    
		    
		    
		    
		    
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		    function addMarker(position, order) {
		        var imageSrc = './places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		            imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
		            imgOptions =  {
		                spriteSize : new kakao.maps.Size(72, 244), // 스프라이트 이미지의 크기
		                spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		                offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		            },
		            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		                marker = new kakao.maps.Marker({
		                position: position, // 마커의 위치
		                image: markerImage 
		            });

		        marker.setMap(map); // 지도 위에 마커를 표출합니다
		        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		        return marker;
		    }
		 
		 
		 
		 
		 
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		    function removeMarker() {
		        for ( var i = 0; i < markers.length; i++ ) {
		            markers[i].setMap(null);
		        }   
		        markers = [];
		    }





		    // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		    function displayPlaceInfo (place) {
		        var content = '<div class="placeinfo">' +
		                        '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

		        if (place.road_address_name) {
		            content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                        '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		        }  else {
		            content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		        }                
		       
		        content += '    <span class="tel">' + place.phone + '</span>' + 
		                    '</div>' + 
		                    '<div class="after"></div>';

		        contentNode.innerHTML = content;
		        placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		        placeOverlay.setMap(map);  
		    }






		    // 각 카테고리에 클릭 이벤트를 등록합니다
		    function addCategoryClickEvent() {
		        var category = document.getElementById('category'),
		            children = category.children;

		        for (var i=0; i<children.length; i++) {
		            children[i].onclick = onClickCategory;
		        }
		    }





		    // 카테고리를 클릭했을 때 호출되는 함수입니다
		    function onClickCategory() {
		        var id = this.id,
		            className = this.className;

		        placeOverlay.setMap(null);

		        if (className === 'on') {
		            currCategory = '';
		            changeCategoryClass();
		            removeMarker();
		        } else {
		            currCategory = id;
		            changeCategoryClass(this);
		            searchPlaces();
		        }
		    }





		    // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		    function changeCategoryClass(el) {
		        var category = document.getElementById('category'),
		            children = category.children,
		            i;

		        for ( i=0; i<children.length; i++ ) {
		            children[i].className = '';
		        }

		        if (el) {
		            el.className = 'on';
		        } 
		    } 
		    
		    







			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
				infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', function() {
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});

			function searchAddrFromCoords(coords, callback) {
				// 좌표로 행정동 주소 정보를 요청합니다
				geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
			}

			function searchDetailAddrFromCoords(coords, callback) {
				// 좌표로 법정동 상세 주소 정보를 요청합니다
				geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var infoDiv = document.getElementById('centerAddr');

					for(var i = 0; i < result.length; i++) {
						// 행정동의 region_type 값은 'H' 이므로
						if (result[i].region_type === 'H') {
							infoDiv.innerHTML = result[i].address_name;
							break;
						}
					}
				}    
			}
			
			
			
			
			
			
			var cnt = 0;
			
			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다
			
			
			
			
			// 푯말 기능 
			
			/* var content = '<div class="infowrap">' + 
			            '    <div class="map_info">' + 
			            '        <div class="co_title">' + 
			            '            늦재 - 옛길코스' + 
			            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			            '        </div>' + 
			            '        <div class="co_body">' + 
			            '            <div class="co_img">' +
			            '                <img src="./Neutjae_three-way_intersection.jpg" width="73" height="70">' +
			            '           </div>' + 
			            '            <div class="map_desc">' + 
			            '                <span class="name">상세구간</span> <span class="con">원효사입구 - 늦재 - 동화사터 - 용추삼거리 - 장불재 - 목교 - 원효사입구 - 목교 - 원효사입구</span><br>' +
			            '                <span class="name">일정</span> <span class="con">당일</span><br>' + 
			            '                <span class="name">소요시간</span> <span class="con">09 시간 50분</span>&nbsp;&nbsp;<span class="name">거리</span> <span class="con">10.4km</span>&nbsp;&nbsp;<span class="name">난이도</span> <span class="con">중</span><br>' + 
			            '                <span><a href="# 그냥 만들어 봄" target="_blank" class="link">자세히보기</a></span>' + 
			            '            </div>' + 
			            '        </div>' + 
			            '    </div>' +    
			            '</div>';

			// 커스텀 오버레이가 표시될 위치입니다. 이 코드는 지금은 의미가 없습니다만, 원래 이렇게 썻다고 기록을 남깁니다.
			var position = new kakao.maps.LatLng(35.149830, 126.919837);

			// 커스텀 오버레이를 생성합니다
			var customOverlay = new Array;
			    customOverlay[cnt]= new kakao.maps.CustomOverlay({
			    position: map.getCenter(),
			    map: map,
			    content: content   
			});

			// 커스텀 오버레이를 지도에 표시합니다
			customOverlay[cnt].setMap(map);

			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
			    customOverlay[cnt].setMap(null);     
			}
			
			function openOverlay() {
				customOverlay[cnt].setMap(map);
			} */
		
			
			
			
			var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
		    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		    startOption = { 
		        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };
			
			// 출발 마커 이미지를 생성합니다
			var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
	
			var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
			    startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
			    startDragOption = { 
			        offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			    };
	
			// 출발 마커의 드래그 이미지를 생성합니다
			var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);
	
			var map_level_Lng1 = 1+map.getLevel()*-0.000005;
			var map_level_Lng2 = 1+map.getLevel()*0.0000035;
			var map_level_Lat1 = 1+map.getLevel()*-0.00004;
			var map_level_Lat2 = 1+map.getLevel()*-0.00004;
			
			// 출발 마커가 표시될 위치입니다 
			var startPosition = new kakao.maps.LatLng(map.getCenter().getLat()*map_level_Lat1,map.getCenter().getLng()*map_level_Lng1); 
			
			// 출발 마커를 생성합니다
			var startMarker = new Array();
			    startMarker[cnt] = new kakao.maps.Marker({
			    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
			    position: startPosition,
			    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
			    image: startImage // 출발 마커이미지를 설정합니다
			});
	
			// 출발 마커에 dragstart 이벤트를 등록합니다
			kakao.maps.event.addListener(startMarker[cnt], 'dragstart', function() {
			    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
			    startMarker[cnt].setImage(startDragImage);
			});
	
			// 출발 마커에 dragend 이벤트를 등록합니다
			kakao.maps.event.addListener(startMarker[cnt], 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
			    startMarker[cnt].setImage(startImage);
			});
	
			var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
			arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
			arriveOption = { 
			    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			};
	
			// 도착 마커 이미지를 생성합니다
			var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
	
			var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
			    arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
			    arriveDragOption = { 
			        offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
			    };
			 
			// 도착 마커의 드래그 이미지를 생성합니다
			var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);
	
			// 도착 마커가 표시될 위치입니다 
			var arrivePosition = new kakao.maps.LatLng(map.getCenter().getLat()*map_level_Lat2,map.getCenter().getLng()*map_level_Lng2);    
			 
			// 도착 마커를 생성합니다 
			var arriveMarker = new Array();
			    arriveMarker[cnt] = new kakao.maps.Marker({  
			    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
			    position: arrivePosition,
			    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
			    image: arriveImage // 도착 마커이미지를 설정합니다
			});
	
			// 도착 마커에 dragstart 이벤트를 등록합니다
			kakao.maps.event.addListener(arriveMarker[cnt], 'dragstart', function() {
			    // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
			    arriveMarker[cnt].setImage(arriveDragImage);
			});
	
			// 도착 마커에 dragend 이벤트를 등록합니다
			kakao.maps.event.addListener(arriveMarker[cnt], 'dragend', function() {
			     // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
			    arriveMarker[cnt].setImage(arriveImage);  
			});
			
			function showSAmarker(){
				startMarker[cnt].setVisible(true);
				arriveMarker[cnt].setVisible(true);
			}
			
			function closeSAmarker(){
				startMarker[cnt].setVisible(false);
				arriveMarker[cnt].setVisible(false);
			}
			
			closeSAmarker();
			
			// 토글하면 출발, 도착 마커가 보이거나 안보인다.
			function setST_Markers(){
			    if (STmarker.checked) {
					showSAmarker();
			    }else {
			    	closeSAmarker();
			    }
			}
			
			
			
		
			
			// 등산로를 지도에서 지웁니다.
			function del_polyline(){
				for(var i = 0; i<trail_list_obj[0].length;i++){
			  		polyline[i].setMap(null);
				}
			}
			function del_customOverlay(){
				customOverlay.setMap(null);
				customOverlay=null;
			}

			
	}
	</script>
	
									</article>

								</div>
		</div>
		
		</article>
		</section>
		</article>
		</section>
		</article>
		</section>
		<!-- //컨텐츠 내용 -->
		</section>
		<!-- //content -->
	</div>
	<!-- //middleArea -->
	</section>
	<!-- //컨텐츠 내용 -->
	</section>
	<!-- //내용들어가는곳 끝 -->
</div>
<!-- //중단부 틀 끝 -->
</div>
<!-- //container -->

<!-- // 컨텐츠 -->
<!-- footer -->
<footer id="footer" style="margin-top: -15px;">
	<div id="footerInner" class="clearfix">
		<!-- 푸터 상단 -->
		<article id="footerTop">
			<!-- 푸터 하단 왼쪽 -->
			<article class="footer-left-con">
				<a href="../Main/D_Home.jsp">
					<div class="footer-logo">
						<img src="./img/logo_font.png" width="320px" height="160px">
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
							Backend : 정현수, 곽승옥, 최혜준 <span style="color: white;"> / </span>
							Front : 류태욱, 정찬준
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
<!-- //footer -->
</div>
<!-- //code -->

</html>