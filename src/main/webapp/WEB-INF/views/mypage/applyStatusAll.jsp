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
			<p class="asa_title">구인 게시판</p>
			<ul>
				<li class="asa_position"><a href="/applyStatusAll/${principal.id}">지원 현황</a></li>
				<li class="asa_proposal"><a href="/proposal/${principal.id}">구인 현황</a></li>
			</ul>
		</div>

		<div class="asa_contents">
			<div class="asa_counts">
				<c:forEach var="statusCountDtos" items="${statusAllDto.statusCountDtos}">
					<div class="asa_count_all">
						<a href="/applyStatuAll/${principal.id}">
							<p class="asa_all_count">${statusCountDtos.statusAll}</p>
							<p class="asa_all_text">전체</p>
						</a>
					</div>
					<div class="asa_count_c">
						<a href="/applyStatus/${principal.id}">
							<p class="asa_count">${statusCountDtos.statusC}</p>
							<p class="asa_text">지원 완료</p>
						</a>
					</div>
					<div class="asa_count_final">
						<a href="/applyStatusFin/${principal.id}">
							<p class="asa_final_count">${statusCountDtos.statusFinal}</p>
							<p class="asa_final_text">최종 컨택</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="asa_search">
				<form name="searchAll" action="/applyStatusAll/${statusAllDto.id}">
					<input id="keyword" placeholder="공고 제목 검색" type="text" name="keyword" value="${statusAllDto.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<div>
				<table class="asa_table">
					<thead>
						<tr>
							<th>게시판 제목</th>
							<th>지원 유형</th>
							<th>모집마감일</th>
							<th>진행 상태</th>
						</tr>
					</thead>
					<tbody>
						<!-- 모든 진행상태의 리스트 -->
						<c:forEach var="statusInfoDtos" items="${statusAllDto.statusInfoDtos}">
							<tr>
								<!-- 지원한 구인공고 제목 -->
								<!-- ** 구인공고로 이동하는 링크 설정 필요 -->
								<td><a href="#">${statusWaitingInfoDtos.jobSub}</a></td>
								<!-- 지원한 구인공고 분류 -->
								<td>${statusWaitingInfoDtos.jobCd}</td>
								<!-- 지원한 공고 마감일 -->
								<td>${statusWaitingInfoDtos.jobEndDate}</td>
								<td><c:choose>
										<c:when test="${statusInfoDtos.state == 0}">
											<p class="waiting">대기중</p>
										</c:when>
										<c:when test="${statusInfoDtos.state == 1}">
											<p class="pass">승인</p>
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