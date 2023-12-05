<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MusicInsite</title>

<link rel="shortcut icon" href="${path}/favicon/music_icon.ico" type="image/x-icon" />

<link href="${path}/css/reset.css" rel="stylesheet" />
<link href="${path}/css/header.css" rel="stylesheet" />
<link href="${path}/css/footer.css" rel="stylesheet" />
<link href="${path}/css/main.css" rel="stylesheet" />
<link href="${path}/css/wanted.css" rel="stylesheet" />
<link href="${path}/css/wanted-detail.css" rel="stylesheet" />
<link href="${path}/css/company-detail.css" rel="stylesheet" />


<script src="https://kit.fontawesome.com/e264982194.js" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body>
	<header class="header">
		<div class="header_inner">
			<div class="menu">
				<button class="btn_menu">포지션</button>
				<ul class="dropdown_menu">
					<li class="menu_top">포지션 목록</li>
					<li><a class="dropdown_item" href="#">포지션1</a></li>
					<li><a class="dropdown_item" href="#">포지션2</a></li>
					<li><a class="dropdown_item" href="#">포지션3</a></li>
					<li class="menu_bottom">음악인 구인공고 사이트</li>
				</ul>
			</div>

			<h1 class="logo">
				<a href="#">MusicInsite</a>
			</h1>

			<ul class="gnb">
				<li><a href="jobList.do">구인</a></li>
				<li><a href="prList.do">PR</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
				<li><a href="notification.do">공지사항</a></li>
			</ul>

			<ul class="login">
				<li class="alert">
					<a href="#">알림</a>
					<ul class="alert_item_list">
						<li class="alert_item">
							<div class="messages">
								<p>
									쪽지를 받았어요! <br /> 지금 쪽지함에서 확인해보세요!
								</p>
							</div>
						</li>
					</ul>
				</li>

				<li>
					<p class="notifications"></p>
				</li>

				<li class="profile">
					<a href="mypage_Apply.do">My</a>
					<ul class="profile_list">
						<li><a class="profile_item_mypage" href="mypage_Apply.do">지원 공고 관리</a></li>
						<li><a class="profile_item" href="applyStatusAll.do">지원 현황</a></li>
						<li><a class="profile_item" href="writeJobStatusAll.do">구인 현황</a></li>
						<li><a class="profile_item" href="commWroteAll.do">커뮤니티 글 관리</a></li>
						<li><a class="profile_item" href="likeListsPR.do">좋아요 한 PR 글</a></li>
						<li><a class="profile_item_logout" href="logout.do">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</header>