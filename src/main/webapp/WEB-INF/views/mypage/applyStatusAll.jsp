<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<!-- 지원현황 페이지 css 설정 -->
<link href="${path}/css/application_status_all.css" rel="stylesheet" />

<!-- 지원현황 관련 js파일 -->
<script src="${path}/js/applyStatus.js"></script>
</head>

<!-- 지원현황 페이지 - 전체 지원현황 -->

<div id="wrap">
	<div id="asa_wrap">
		<div class="asa_menu">
			<p class="asa_title">지원 현황</p>
			<ul>
				<li class="asa_position"><a href="/applicationstatusall/${principal.id}">지원한 포지션</a></li>
				<li class="asa_proposal"><a href="/proposal/${principal.id}">받은 요청</a></li>
			</ul>
		</div>

		<div class="asa_contents">
			<div class="asa_counts">
				<c:forEach var="statusCountDtos" items="${statusAllDto.statusCountDtos}">
					<div class="asa_count_all">
						<a href="/applicationstatusall/${principal.id}">
							<p class="asa_all_count">${statusCountDtos.statusAll}</p>
							<p class="asa_all_text">전체</p>
						</a>
					</div>
					<div class="asa_count_c">
						<a href="/applicationstatus/${principal.id}">
							<p class="asa_count">${statusCountDtos.statusC}</p>
							<p class="asa_text">지원 완료</p>
						</a>
					</div>
					<div class="asa_count_final">
						<a href="/applicationstatusfinal/${principal.id}">
							<p class="asa_final_count">${statusCountDtos.statusFinal}</p>
							<p class="asa_final_text">최종합격</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="asa_search">
				<form name="searchAll" action="/applicationstatusall/${statusAllDto.id}">
					<input id="keyword" placeholder="회사명 검색" type="text" name="keyword" value="${statusAllDto.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<div>
				<table class="asa_table">
					<thead>
						<tr>
							<th>지원 회사</th>
							<th>지원 포지션</th>
							<th>작성 시간</th>
							<th>진행 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="statusInfoDtos" items="${statusAllDto.statusInfoDtos}">
							<tr>
								<td><a href="#">${statusInfoDtos.companyName}</a></td>
								<td>${statusInfoDtos.positionCodeName}</td>
								<td>${statusInfoDtos.created}</td>
								<td><c:choose>
										<c:when test="${statusInfoDtos.state == 0}">
											<p class="waiting">대기중</p>
										</c:when>
										<c:when test="${statusInfoDtos.state == 1}">
											<p class="pass">합격</p>
										</c:when>
										<c:when test="${statusInfoDtos.state == 2}">
											<p class="fail">불합격</p>
										</c:when>
										<c:otherwise>
											<p class="waiting">대기중</p>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- footer -->
<%@ include file="../layout/footer.jsp"%>