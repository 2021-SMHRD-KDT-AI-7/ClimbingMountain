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




<% 	MemberDTO info = (MemberDTO)session.getAttribute("info"); 

	int mountain_seq = 0;
	if( request.getParameter("mountain_seq")!=null ){
		mountain_seq = Integer.parseInt(request.getParameter("mountain_seq"));
	}else{
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
    <meta name="viewport" content="width=device-width, initial-scale=1"><!-- 모바일사이트, 반응형사이트 제작시 사용 -->
    <meta name="format-detection" content="telephone=no" /><!-- ios 자동전화걸기 방지 -->
    <meta name="theme-color" content="#222">
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
    <link th:href="@{https://fonts.googleapis.com/icon?family=Material+Icons}" rel="stylesheet"> google
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="./css/xeicon.min.css"><!-- naver -->

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
    <style>
    #M_N{font-size: xxx-large;font-weight: 700;text-align: right;color: #006400;}
	#M_L{font-size: x-large;margin-top: 25px;color: black;text-indent: -5px;}
	#M_H{font-size: large;margin-top: 10px;color: black;text-indent: 10px;}
	#R_S{font-size: large;margin-top: 10px;text-indent: 10px;color: black;}
	#M_T{font-size: xx-large;text-align: center;color: red;margin-top: 35px;}
	#C_D{font-size: xxx-large;text-align: right;color: black;margin-top: 50px;}
	#M_C_T{font-size: xx-large;color: black;margin-top: 25px;}
	#M_C{font-size: large;word-spacing: 2px;line-height: 25px;color: black;}
	#M_S_T{font-size: xx-large;color: black;margin-top: 25px;}
	#M_S{font-size: medium;word-spacing: 2px;line-height: 20px;color: black;}
	#M_I_T{font-size: xx-large;color: black;margin-top: 25px;}
	#M_I{font-size: medium;word-spacing: 3px;line-height: 24px;color: black;}
	#C_I_I{font-size: xxx-large;text-align: center;-webkit-text-emphasis-style:triangle;color: #006400;margin-bottom: 25px;}
	#C_CN{font-size: xx-large;text-indent: 20px;color:red;margin-bottom: 30px;}
	#C_I{margin-block: 50px;margin-left: 115px;}
	#C_E{font-size: large;word-spacing: 4px;color:black;line-height: 30px;}
	#C_CN2{font-size: medium;color: black;position: absolute;margin-left:-240px;margin-top:10px;})
	#C_I2{}
    #T_I{font-size: xxx-large;color: #006400;text-align: right;}
    #T_C{font-size: x-large;text-align: center;color: black;margin-top: 50px;}
    .T_CC{font-size: x-large;color: black;}
    .T_CCC{font-size: medium;line-height: 30px;color: #000000;}
    .T_R{font-size: large;line-height: 30px;font-weight: 600;color:black;}
    .line_info{display: block;height: 5px;border: 0;border-top: 3px solid #006400;margin: 2em 0;padding: 0;}
    .line-traffic{display: block;height:2px;border:0;border-top:1px solid #000000;margin:1em 0;}
    .line_course{display:block;height:1px;border:0;border-top:1px solid #000000;margin:2em 0;}
        
        
        
        
        .map_wrap,
        .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            font-size: 12px;
        }

        .map_wrap {
            position: relative;
            width: 100%;
            height: 350px;
        }

        #category {
            position: absolute;
            top: -400px;
            left: -400px;
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
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;
        }

        #category li .bank {
            background-position: -10px 0;
        }

        #category li .mart {
            background-position: -10px -36px;
        }

        #category li .pharmacy {
            background-position: -10px -72px;
        }

        #category li .oil {
            background-position: -10px -108px;
        }

        #category li .cafe {
            background-position: -10px -144px;
        }

        #category li .store {
            background-position: -10px -180px;
        }

        #category li.on .category_bg {
            background-position-x: -46px;
        }

        .placeinfo_wrap {
            position: relative;
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
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
        }

        .placeinfo a,
        .placeinfo a:hover,
        .placeinfo a:active {
            color: #fff;
            text-decoration: none;
        }

        .placeinfo a,
        .placeinfo span {
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
            background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
        }

        .placeinfo .tel {
            color: #0f7833;
        }

        .placeinfo .jibun {
            color: #999;
            font-size: 11px;
            margin-top: 0;
        }
        /* 밑에 두개 승옥이가 함 ㅋ */
        .course_exp_img{
        	height: 300px;
        	width : 800px;
        }
        
        .course_3_img{
        	height:200px;
        	width:200px;
        	margin:40px;
        	border-radius: 5%;
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
                <h1 class="logo"><a href="../Main/D_Home.jsp" title="메인"><img src="./img/logo.png" alt="산 타 클로스_로고"
                            class="pc-logo" width="160px" height="90px" /></a></h1>
                <div class="header-util-box">
                    <% if(info==null){ %>
								<a href="../Login/Login.jsp" class="contact-tx">로그인</a>
								<a href="../Join/Join.jsp" class="contact-tx">회원가입</a>
							<%}else{%>
								<a href="LogoutServiceCon.do" class="contact-tx">로그아웃</a>
							<% } %>	
                </div>
            </div>

            <!-- ****************** GNB ********************** -->
            <!-- GNB PC ( ### 메뉴 4개이하 ### ) -->
            <nav id="gnb" class="total-menu">
                <h2 class="blind">주메뉴</h2>
                <div id="gnbBg"></div>
                <ul class="clearfix area">
                    <li class="gnb2">
                        <a href="M_info.jsp" style="text-shadow: 3px 3px 3px #666;">산정보</a>
                        <div class="gnb-2dep">
                            <article class="gnb-2dep-inner area clearfix">
                                <div class="gnb-2dep-menu-list">
                                    <ul class="clearfix">
                                        <li>
                                            <a href="M_info.jsp">
                                                <span style="font-weight: bold;">종합정보</span>
                                                <em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="gnb-2dep-menu-txt">
                                    <div class="gnb-2dep-menu-info">
                                        <p><span style="color:#006400;">Climbing</span> <span style="color:red;">Mountain</span></p>
                                        <div class="gnb-2dep-menu-img"></div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </li>
                    <li class="gnb1">
                        <a href="../Board/list.jsp" style="text-shadow: 3px 3px 3px #666;">게시판</a>
                        <div class="gnb-2dep">
                            <article class="gnb-2dep-inner area clearfix">
                                <div class="gnb-2dep-menu-list list-3">
                                    <ul class="clearfix">
                                        <li>
                                            <a href="../Board/list.jsp">
                                                <span style="font-weight: bold;">모두의 게시판</span>
                                                <em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
                                            </a>
                                        </li>
                                        <li>
                                            <% if(info==null){ %>
												<a href="../Login/Login.jsp">
                                                <span style="font-weight: bold;">다이어리</span>
                                                <em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
                                            </a>
											<%}else{%>
												<a href="../Board/diary_list.jsp">
                                                <span style="font-weight: bold;">다이어리</span>
                                                <em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
                                            </a>
											<% } %>	
											</li>	
                                    </ul>
                                </div>
                                <div class="gnb-2dep-menu-txt">
                                    <div class="gnb-2dep-menu-info">
                                        <p><span style="color:#006400;">Bo</span><span style="color:red;">ard</span></p>
                                        <div class="gnb-2dep-menu-img"></div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </li>
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
            <div class="visual-img-con" style="background:#fff url(./img/M_info_bg.jpg) no-repeat 50% 18%;text-shadow: 3px 3px 3px #666;">
            </div> <!-- 여기에 산 사진으로 배경 나오게 한다 -->
            <div class="area visual-txt-con">
                <div class="table-cell-layout">
                    <div class="visual-txt-container">
                        <h2 class="visual-tit trans400"><%= mountain100_1_dto.getMountain_name()%></h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- 배경 들어가고 이름 나오는곳 끝 -->

        <!-- 헤더 서브메뉴  -->
        <script>

            var fr = "ir";
            var se = "intro";
            var tr = "";

            var dep1 = 1;
            var dep2 = 1;
            var dep3 = 1;
            var frMenu = { "ir": 1, "bn": 2, "cs": 3, "rc": 4 };
            var seMenu = {
                "ir": {
                    "intro": 1,
                    "ethics_charter": 2,
                    "history": 3,
                    "vision": 4,
                    "philosophy": 5,
                    "organogram": 6,
                    "location": 7
                },
                "bn": {
                    "performance": 1,
                    "loan_01": 2,
                    "result_02": 3,
                    "capital_01": 4,
                    "stock": 5,
                    "card": 6,
                    "rnd": 7,
                    "finance_01": 8,
                    "platform": 9,
                    "ibkbox": 10
                },
                "cs": {
                    //"brguide"	:	3	,
                    "report": 3,
                    "login": 4,
                    "private": 5,
                    "BRD001": 1,
                    "BRD002": 2,
                    //"BRD003" 	: 3 ,
                    "BRD005": 1
                },
                "rc": {
                    "talent": 1,
                    "personnelsystem": 2,
                    "benefits": 3,
                    "BRD004": 4
                }
            };
            var trMenu = {
                "loan_01": 1, "loan_02": 2, "loan_03": 3, "loan_04": 4, "loan_05": 5,
                "result_02": 1, "result_03": 2, "result_04": 3,
                "capital_01": 1, "capital_02": 2, "capital_03": 3, "capital_04": 4, "capital_05": 5,
                "finance_01": 1, "finance_02": 2, "finance_03": 3, "finance_04": 4, "finance_05": 5, "finance_06": 6, "finance_07": 7,
                "rnd": 1, "platform": 1, "ibkbox": 1
            };
            dep1 = frMenu[fr];
            dep2 = seMenu[fr][se];
            if (fr === "bn") {
                dep3 = trMenu[tr];
            }

        </script>


        <!-- 헤더 서브메뉴  -->
        <aside id="headerSubMenu">
            <div class="side-menu-inner">
                <div class="cm-top-menu clearfix">
                    <a href="../Main/D_Home.jsp" class="location-to-home-btn" title="메인으로"><i class="xi-home-o"></i></a>



                    <!-- 서브메뉴 첫번쨰 -->
                    <div class="menu-location location1">


                        <a href="#기본 산메뉴(무등산?)" class="cur-location">
                            <span>산 목록</span>
                            <em class="arrow"><i class="xi-caret-down-min"></i></em>
                        </a>



                        <ul class="location-menu-con">
                        	
                        	<% for(int i =0;i<mountain13_list.size();i++){%>
                        	
                        	<li><a href="M_info.jsp?mountain_seq=<%=mountain13_list.get(i).getMountain_seq()%>"> <%=mountain13_list.get(i).getMountain_name()%> <em class="gnb-icon"><i class="xi-angle-right-min"></i></em></a></li>
                        	<%} %>
                            
              				
              				
              				
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
        <!-- // -->

        <!-- // -->


    


        <!-- middleArea -->
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
                                <!-- tba01 content -->
                                <div class="history-tab-con cm-tab-con" id="historyCon01">
                                    <article class="history-list-box">
                                        <div class="Mountain-info-pic">
                                            <img src="<%=mountain100_3_img_dto.getMountain_img() %>" alt="">
                                           
                                        </div>
                                        <div class="Mountain-info-text">  
                                        	
                                            <p id=M_N><i class="xi-signal"></i> <%= mountain100_1_dto.getMountain_name()%> <i class="xi-signal xi-rotate-90"></i><p>
                                            <p id=M_L><i class="xi-gps"></i> 산 위치 : <%=mountain100_1_dto.getMountain_location()%></p>
                                            <p id=M_H>산 높이 : <%=mountain100_1_dto.getMountain_height()%>m</p>
                                            <p id=R_S>추천계절 : <%=mountain100_1_dto.getMountain_season()%></p>
                                            
                                            <p id=M_T><i class="xi-time-o"></i> 등산시간 = <%=mountain100_1_dto.getMountain_time()%></p>
                                            <p id=C_D><i class="xi-run"></i> 등산 난이도 : <%=mountain100_1_dto.getDifficulty()%></p>
                                             
                                             
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

                                <!-- tba02 content -->
                                <div class="history-tab-con cm-tab-con" id="historyCon02">
                                    <article class="history-list-box">
                                        <div class="Mountain-route">
                                            <h1 id=C_I_I>등산로 정보</h1>
                                            
                                            <% for(int i=0;i<course_1_list.size();i++) {%>
                                            <p id=C_CN><i class="xi-walk"></i> <%= course_1_list.get(i).getCourse_name()%></p>
                                            <hr class=line_course>
                                            <img id=C_I class = 'course_exp_img' src='<%= course_1_list.get(i).getCourse_exp_img()%>'>

                                            <p id=C_E><%= course_1_list.get(i).getCourse_exp()%></p>

                                            <hr class=line_course>
                                            <% int course_seq =course_1_list.get(i).getCourse_seq(); 
                                            ArrayList<Course_3_img_DTO> course_3_img_list = course_3_img_dao.selectCourse(course_seq);
                                            for(int j=0;j<course_3_img_list.size();j++){    %>
                                            <img id=C_I2 class='course_3_img' src='<%=course_3_img_list.get(j).getCourse_img()%>'>
                                            <span id=C_CN2><%= course_3_img_list.get(j).getCourse_name() %></span>
                                            <%}%>
                                            <hr class=line_course>
                                            <%} %>         
                                           
                                        </div>

                                    </article>
                                </div>

                                <!-- tba03 content -->
                                <div class="history-tab-con cm-tab-con" id="historyCon03">
                                    <article class="history-list-box">
                                        <div class="Traffic-info">
                                            <h1 id=T_I><i class="xi-location-arrow"></i> 교통정보</h1>
                                            <% for(int i=0;i<course_2_list.size();i++) {%>
                                            	<h1 id=T_C>= <%= course_2_list.get(i).getCourse_name() %> =</h1>
                                            	<br>
                                            	<% String[] car = course_2_list.get(i).getCar().split("◈"); %>
                                            	<p class=T_CC><i class="xi-car"></i> 차</p>                                            	
                                            	<br>
												<% for(int c = 0; c<car.length;c++){ 	
													if(c%2==1){                      %>
														<p class=T_R><%= car[c]  %></p>                     
													<% }else{                        %>
														<p class=T_CCC><%= car[c]  %></p>
													<%}%>
												<%} %>
												<hr class=line-traffic>
												<br>
												<% String[] bus = course_2_list.get(i).getBus().split("◈"); %>
												<p class=T_CC><i class="xi-bus"></i> 버스</p>
												<br>
												<% for(int c = 0; c<bus.length;c++){ 	
													if(c%2==1){                      %>
														<p class=T_R><%= car[c]  %></p>                     
													<% }else{                        %>
														<p class=T_CCC><%= car[c]  %></p>
													<%}%>
												<%} %>
												<hr class=line-traffic>
												<br>
												<% String[] train = course_2_list.get(i).getTrain().split("◈"); %>
												<p class=T_CC><i class="xi-train"></i> 기차</p>
												<br>
												<% for(int c = 0; c<train.length;c++){ 	
													if(c%2==1){                      %>
														<p class=T_R><%= car[c]  %></p>                     
													<% }else{                        %>
														<p class=T_CCC><%= car[c]  %></p>
													<%}%>
												<%} %>
                                            	<hr class=line-traffic>
                                           	 	<%} %>
                                            	
                                            	<!-- 코스별 교통정보 출력인데  그냥 출력하면 개행 할 때 검색할 용도로 쓴 특수 기호 있어서 split로 특수기호 기준으로
                                            	개행 주고 배열에 들어가서 배열길이만큼 반복문 돌려서 출력 -->
           
                           
                                        </div>
                                    </article>
                                </div>
                                <!-- tba04 content -->
                                <div class="history-tab-con cm-tab-con" id="historyCon04">
                                    <article class="history-list-box">
                                        <div class="Mountain-map">
                                            <div class="map_wrap">
                                                <div class="Mountain-map" id="map"
                                                    style="width:100%;height:100%;right: 400px; bottom: 400px; position:relative; overflow:hidden; padding: 400px;">
                                                </div>
                                                <ul id="category">
                                                    <li id="BK9" data-order="0">
                                                        <span class="category_bg bank"></span>
                                                        주차장
                                                    </li>
                                                    <li id="MT1" data-order="1">
                                                        <span class="category_bg mart"></span>
                                                        문화시설
                                                    </li>
                                                    <li id="PM9" data-order="2">
                                                        <span class="category_bg pharmacy"></span>
                                                        관광명소
                                                    </li>
                                                    <li id="OL7" data-order="3">
                                                        <span class="category_bg oil"></span>
                                                        숙박
                                                    </li>
                                                    <li id="CE7" data-order="4">
                                                        <span class="category_bg cafe"></span>
                                                        음식점
                                                    </li>
                                                    <li id="CS2" data-order="5">
                                                        <span class="category_bg store"></span>
                                                        편의점
                                                    </li>
                                                </ul>
                                            </div>
                                            <script type="text/javascript"
                                                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=570ba83ef799797bed963963c7518be2&libraries=services"></script>
                                            <script>
                                                // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
                                                var placeOverlay = new kakao.maps.CustomOverlay({ zIndex: 1 }),
                                                    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
                                                    markers = [], // 마커를 담을 배열입니다
                                                    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

                                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                                    mapOption = {
                                                        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                                        level: 5 // 지도의 확대 레벨
                                                    };

                                                // 지도를 생성합니다    
                                                var map = new kakao.maps.Map(mapContainer, mapOption);



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

                                                    ps.categorySearch(currCategory, placesSearchCB, { useMapBounds: true });
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



                                                    for (var i = 0; i < places.length; i++) {

                                                        // 마커를 생성하고 지도에 표시합니다
                                                        var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

                                                        // 마커와 검색결과 항목을 클릭 했을 때
                                                        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                                                        (function (marker, place) {
                                                            kakao.maps.event.addListener(marker, 'click', function () {
                                                                displayPlaceInfo(place);
                                                            });
                                                        })(marker, places[i]);
                                                    }
                                                }





                                                // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                                                function addMarker(position, order) {
                                                    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                                                        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
                                                        imgOptions = {
                                                            spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                                                            spriteOrigin: new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
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
                                                    for (var i = 0; i < markers.length; i++) {
                                                        markers[i].setMap(null);
                                                    }
                                                    markers = [];
                                                }





                                                // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
                                                function displayPlaceInfo(place) {
                                                    var content = '<div class="placeinfo">' +
                                                        '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';

                                                    if (place.road_address_name) {
                                                        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                                                            '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
                                                    } else {
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

                                                    for (var i = 0; i < children.length; i++) {
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

                                                    for (i = 0; i < children.length; i++) {
                                                        children[i].className = '';
                                                    }

                                                    if (el) {
                                                        el.className = 'on';
                                                    }
                                                }
                                            </script>

                                        </div>
                                    </article>
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
                    <div class="footer-logo"><img src="./img/logo_font.png" width="320px" height="160px"></div>
                </a>
            </article>
            <!-- 푸터 하단 중앙 -->
            <article class="footer-center-con">

                <div class="footer-address-list">
                    <dl>
                        <dd>광주/전남 명산 정보를 한눈에 볼 수 있도록 정리해주는 웹 프로젝트
                        </dd>
                    </dl>
                    <br>
                    <dl>
                        <dt>조장 : </dt>
                        <dd>류태욱</dd>
                        <dt>역할/조원 : </dt>
                        <dd>Backend : 정현수, 곽승옥, 최혜준 / Front : 류태욱, 정찬준</dd>
                    </dl>
                    <br>
                </div>
                <div class="footer-copyright">스마트인재개발원_인공지능7차_1차프로젝트(드가자)
                </div>
            </article>
        </article>
    </div>
</footer>
<!-- //footer -->
</div>
<!-- //code -->

</html>