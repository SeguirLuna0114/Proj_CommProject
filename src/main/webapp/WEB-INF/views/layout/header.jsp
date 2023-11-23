<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 컨텍스트 경로 : 웹 서버에서 실행되는 루트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Music Insite</title>

    <!-- Favicon 설정 -->
    <link
      rel="shortcut icon"
      href="${path}/favicon/music_icon.ico"
      type="image/x-icon"
    />

    <!-- CSS 설정 -->
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
          <a href="#">Music Insite</a>
        </h1>

        <ul class="gnb">
          <li><a href="jobList.do?">구인</a></li>
          <li><a href="prList.do?">홍보</a></li>
          <li><a href="communityList.do?">커뮤니티</a></li>
        </ul>
        <ul class="login">
          <li><a href="#">로그인/회원가입</a></li>
        </ul>
        <ul class="companyservice">
          <li><a href="#">구인단체 서비스</a></li>
        </ul>
      </div>
    </header>

