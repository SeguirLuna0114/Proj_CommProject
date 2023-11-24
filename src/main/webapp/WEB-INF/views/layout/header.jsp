<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 컨텍스트 경로 : 웹 서버에서 실행되는 루트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MusicInsite</title>

<!-- Favicon 설정 -->
<link rel="shortcut icon" href="${path}/favicon/music_icon.ico" type="image/x-icon" />

<!-- 공통 CSS 설정 -->
<link href="${path}/css/reset.css" rel="stylesheet" />
<link href="${path}/css/header.css" rel="stylesheet" />
<link href="${path}/css/footer.css" rel="stylesheet" />
<link href="${path}/css/main.css" rel="stylesheet" />
<link href="${path}/css/wanted.css" rel="stylesheet" />
<link href="${path}/css/wanted-detail.css" rel="stylesheet" />
<link href="${path}/css/company-detail.css" rel="stylesheet" />

<!-- mypage용 CSS는 해당 페이지 구현 jsp파일에서 설정 -->
<%-- <link href="${path}/css/mypage.css" rel="stylesheet" /> --%>

<!-- Font Awesome 아이콘 라이브러리 -->
<script src="https://kit.fontawesome.com/e264982194.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<header class="header">
		<div class="header_inner">
			<!-- 페이지 상단 메뉴바 -->
			<div class="menu">
				<button class="btn_menu">포지션</button>
				<ul class="dropdown_menu">
					<li class="menu_top">포지션 목록</li>
					<li><a class="dropdown_item" href="#">포지션1</a></li>
					<li><a class="dropdown_item" href="#">포지션2</a></li>
					<li><a class="dropdown_item" href="#">포지션3</a></li>
					<li class="menu_bottom">음악관련 전공자 구인공고 사이트</li>
				</ul>
			</div>

			<!-- 홈페이지 처음(index페이지)으로 이동-->
			<h1 class="logo">
				<a href="#">MusicInsite</a>
			</h1>

			<ul class="gnb">
				<li><a href="jobList.do?">구인</a></li>
				<li><a href="prList.do?">PR</a></li>
				<li><a href="communityList.do?">커뮤니티</a></li>
				<li><a href="notification.do?">공지사항</a></li>
			</ul>

			<!-- 로그인 관련 -->
			<ul class="login">
				<!-- 1) 로그인하지 않은 유저인 경우 -->
				<c:when test="${empty principal}">
					<li><a href="login.do">로그인/회원가입</a></li>
				</c:when>

				<!-- 2) 로그인한 경우 -->
				<li class="alert">
					<!-- 입력받은 id값을 갖고, mypage로 이동 -->
					<a href="mypage.do?id=${principal.id}">알림</a>
					<ul class="alert_item_list">
						<li class="alert_item">
							<!-- 알림 메시지 -->
							<div class="messages">
								<!-- 받은 쪽지가 있을 경우 -->
								<p>
									쪽지를 받았어요! <br /> 지금 쪽지함에서 확인해보세요!
								</p>

								<!-- 관리자로부터 받은 쪽지 -->
								<p>
									<a href="#"> 관리자로부터 쪽지를 받았어요! <br /> 지금 쪽지함을 확인하세요.</a>
								</p>
							</div>
						</li>
					</ul>
				</li>

				<li>
					<p class="notifications"></p>
				</li>


				<li class="profile">
					<a href="#">프로필</a>
						<ul class="profile_list">
							<li><a class="profile_item_mypage" href="mypage.do?id=${principal.id}">My page</a></li>
							<li><a class="profile_item" href="applyStatusAll.do?id=${principal.id}">지원 현황</a></li>
							<li><a class="profile_item" href="proposal.do?id=${principal.id}">제안받기 현황</a></li>
							<li><a class="profile_item" href="likeList.do?id=${principal.id}">PR 좋아요 현황</a></li>
							<li><a class="profile_item" href="comList.do?id=${id}">커뮤니티</a></li>
							<li><a class="profile_item_logout" href="logout.do?id=${id }">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<!-- end login -->

			<ul class="companyservice">
				<li><a href="#"></a></li>
			</ul>
		</div>
	</header>