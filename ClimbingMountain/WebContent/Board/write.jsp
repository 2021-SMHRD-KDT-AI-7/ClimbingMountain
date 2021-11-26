<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/board_css.css">
  
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
    <link rel="stylesheet" href="css/board_css.css">
    <!-- 아이콘폰트 -->
	<link href="/css/icon.css" rel="stylesheet">
	<!-- <link th:href="@{https://fonts.googleapis.com/icon?family=Material+Icons}"  rel="stylesheet"> google -->
	<link rel="stylesheet" href="./css/xeicon.min.css">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<!--link rel="stylesheet" th:href="@{http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css}"> naver -->

	<!-- 슬라이드 플러그인 -->
	<link rel="stylesheet" type="text/css" href="./css/plugin/slick.css">
	<script src="./js/plugin/slick.js"></script>
    <script>
        $(function () {
            dep1 = 0,
                dep2 = 0;
        })
    </script>
    <link rel="stylesheet" type="text/css" href="./css/plugin/jquery.fullPage.css" />
    <script type="text/javascript" src="./js/plugin/jquery.fullPage.js"></script>
    <script type="text/javascript">
        function numberCounter(target_frame, target_number) {
            this.count = 0; this.diff = 0;
            this.target_count = parseInt(target_number);
            this.target_frame = document.getElementById(target_frame);
            this.timer = null;
            this.counter();
        };
        numberCounter.prototype.counter = function () {
            var self = this;
            this.diff = this.target_count - this.count;
    
            if (this.diff > 0) {
                self.count += Math.ceil(this.diff / 5);
            }
    
            this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    
            if (this.count < this.target_count) {
                this.timer = setTimeout(function () { self.counter(); }, 30);
            } else {
                clearTimeout(this.timer);
            }
        };
        function callCount(target, number) {
            return new numberCounter(target, number);
        }
    
        function numberCounter2(target_frame, target_number) {
            this.count = 0; this.diff = 0;
            this.target_count = parseInt(target_number);
            this.target_frame = document.getElementById(target_frame);
            this.timer = null;
            this.counter();
        };
        numberCounter2.prototype.counter = function () {
            var self = this;
            this.diff = this.target_count - this.count;
    
            if (this.diff > 0) {
                self.count += Math.ceil(this.diff / 5);
            }
    
            this.target_frame.innerHTML = this.count.toString();
    
            if (this.count < this.target_count) {
                this.timer = setTimeout(function () { self.counter(); }, 30);
            } else {
                clearTimeout(this.timer);
            }
        };
        function callCount2(target, number) {
            return new numberCounter2(target, number);
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mainContainer').fullpage({
                verticalCentered: true,
                menu: '#menu',
                navigation: true,
                responsiveWidth: 1220,
                navigationPosition: 'right',
                onLeave: function (index, nextIndex, direction) {
                    if (direction === 'down') {
                        if (nextIndex == 3) {
                            $("#mainInformationCon").addClass("active-item");
                            $(".count-num").each(function () {
                                setTimeout(function () {
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
							<h1 class="logo"><a href="D_Home.html" title="메인"><img src="./images/header_logo.png"
										alt="IBK 시스템" class="pc-logo" width="160px" height="90px" /></a></h1>
							<div class="header-util-box">
                   			<% if(info==null){ %>
								<a href="../Login/Login.jsp" class="contact-tx" style="background-color:#000000">로그인</a>
								<a href="../Join/Join.jsp" class="contact-tx" style="background-color:#000000">회원가입</a>
							<%}else{%>
								<a href="LogoutServiceCon.do" class="contact-tx" style="background-color:#000000">로그아웃</a>
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
									<a href="../Mountain/M_info.jsp">산정보</a>
									<div class="gnb-2dep">
										<article class="gnb-2dep-inner area clearfix">
											<div class="gnb-2dep-menu-list">
												<ul class="clearfix">
													<li>
														<a href="../Mountain/M_info.jsp">
															<span>종합정보</span>
															<em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
														</a>
													</li>													
												</ul>
											</div>
											<div class="gnb-2dep-menu-txt">
												<div class="gnb-2dep-menu-info">
													<p>Climbing Mountain</p>
													<div class="gnb-2dep-menu-img"></div>
												</div>
											</div>
										</article>
									</div>
								</li>
								<li class="gnb1">
									<a href="list.jsp">게시판</a>
									<div class="gnb-2dep">
										<article class="gnb-2dep-inner area clearfix">
											<div class="gnb-2dep-menu-list list-3">
												<ul class="clearfix">
													<li>
														<a href="list.jsp">
															<span>모두의 게시판</span>
															<em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
														</a>
													</li>
													<li>
														<%
															if (info == null) {
														%> <a href="../Login/Login.jsp"> <span
															style="font-weight: bold;">다이어리</span> <em
															class="gnb-icon"><i class="xi-angle-right-min"></i></em>
													</a> <%
 	} else {
 %> <a href="../Board/list.jsp"> <span style="font-weight: bold;">다이어리</span>
															<em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
													</a> <%
 	}
 %>
													</li>
												</ul>
											</div>
											<div class="gnb-2dep-menu-txt">
												<div class="gnb-2dep-menu-info">
													<p>Board</p>
													<div class="gnb-2dep-menu-img"></div>
												</div>
											</div>
										</article>
									</div>
								</li>
							</ul>
						</nav>
						<!-- 사이트맵 버튼 ( 기본 라인 三 ) -->
						<!-- <button class="sitemap-line-btn sitemap-open-btn" title="사이트맵 열기"> -->
						<!-- <span class="line line1"></span><span class="line line2"></span><span class="line line3"></span> -->
						<!-- </button> -->
					</div>
					
                    <aside id="nav1">
                        <div id='c_up'>
                          <p class='c_1'>커뮤니티 게시판
                          <p>
                          <p class='c_1_1'>Community Board</p>
                        </div>
                    
                    
                        <div id="left">
      
      <p class="c_2"><a class='c_2_f' href="#">산 게시판</a>

    </div>

  </aside>


    <div class="board_wrap">
        <div class="board_title">
            <strong>산 게시판</strong>
            <p>산에 관련된 정보를 공유하는 게시판입니다.</p>
        </div>
        
        
        
        
	
	<form action="../communityServiceCon" method="post" enctype="multipart/form-data">
	
	
        <div class="board_write_wrap">
        	
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="community_subject" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                
                <dd>파일1 : <input type="file" name="community_file1";><br>
					파일2 : <input type="file" name="community_file2";><br>
					파일3 : <input type="file" name="community_file3";><br> </dd>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" name="community_content"></textarea>
                </div>
           
            <div class="bt_wrap">
                	<a ><button>등록</button></a>
                <a href="list.html">취소</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>