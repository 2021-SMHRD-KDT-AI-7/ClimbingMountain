<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sun.corba.se.pept.transport.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Model.communityDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.communityDAO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<% MemberDTO info = (MemberDTO)session.getAttribute("info"); 	
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
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
    <link rel="stylesheet" href="./css/board_css.css">
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

<%
	
	communityDAO community_dao = new communityDAO();
	ArrayList<communityDTO> communityBoard_list = new ArrayList<>(); 
	communityBoard_list = community_dao.viewBoard();
	int pagenum =1;
%>
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
							<h1 class="logo"><a href="../Main/D_Home.jsp" title="메인"><img src="./images/header_logo.png"
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
													<p><span style="color:#006400;">Climbing</span> <span style="color:red;">Mountain</span></p>
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
                                            <% if(info==null){ %>
												<a href="../Login/Login.jsp">
                                                <span>다이어리</span>
                                                <em class="gnb-icon"><i class="xi-angle-right-min"></i></em>
                                            </a>
											<%}else{%>
												<a href="../Board/diary_list.jsp">
                                                <span>다이어리</span>
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
      
      <p class="c_2"><a class='c_2_f' href="list.jsp">산 게시판</a>

    </div>

  </aside>


    <div class="board_wrap">
        <div class="board_title">
            <strong>산 게시판</strong>
            <p>산에 관련된 정보를 공유하는 게시판입니다.</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                
                
                
              
	
	<% //번호 제목 글쓴이 작성일 조회
	for(int i=0;i<communityBoard_list.size();i++){   %>
	<tr>
		<td><%= i+1 %></td>
		<td><a href="communityViewOneBoard.jsp?community_seq=<%= communityBoard_list.get(i).getCommunity_seq() %>"><%= communityBoard_list.get(i).getCommunity_subject() %></a></td>
		<td><%= communityBoard_list.get(i).getReg_date() %></td>
		<td><%= communityBoard_list.get(i).getCommunity_cnt() %></td>
		<td><%= communityBoard_list.get(i).getMember_id() %></td>

	</tr>
	
	<% } %>
	</table>
	
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                <div>
                	<% //번호 제목 글쓴이 작성일 조회
                	for(int i=0;i<communityBoard_list.size();i++){   %>
                    <div class="num"><%=communityBoard_list.size() -i%></div>
                    <div class="title"><a href="view.jsp?Community_seq=<%= communityBoard_list.get(i).getCommunity_seq() %>"><%= communityBoard_list.get(i).getCommunity_subject() %></a></div>
                    <div class="writer"><%= communityBoard_list.get(i).getMember_id() %></div>
                    <div class="date"><%= communityBoard_list.get(i).getReg_date() %></div>
                    <div class="count"><%= communityBoard_list.get(i).getCommunity_cnt() %></div>
                   <%} %> 
                </div>
              
                
            </div>
            <div class="board_page">
                <%
               if (pagenum != 1) {//이전페이지로
            %>
                <a href="list.jsp?number=<%=pagenum -1 %>" class="bt prev"> 이전 </a>
                <%
               }
            %>
              <%
              	int n = (int)(community_dao.getcount() / 5+1);
              	for (int i = 1; i <= n; i++) {
              %>
                <a href="list.jsp?number=<%=i%>" class="num"><%=i%></a>
                <%
               }
            %>
                <a href="list.jsp?number=<%=pagenum +1 %>" class="bt next"> 다음</a>
                
            </div>
            <div class="bt_wrap">
                <a href="write.jsp" class="on">등록</a>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
</body>
</html> 