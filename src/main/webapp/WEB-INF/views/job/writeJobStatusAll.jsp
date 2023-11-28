<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<!-- 지원현황 페이지 css 설정 -->
<link href="${path}/css/application_status_all.css" rel="stylesheet" />

<!-- 구인 현황 관련 js파일 -->
<script src="${path}/js/writejobstatus.js"></script>
</head>

<!-- 구인현황 페이지 - 전체 구인현황 -->
<div id="wrap">
	<div id="asa_wrap">
		<div class="asa_menu">
			<p class="asa_title">구인 게시판</p>
			<ul>
				<li class="asf_proposal"><a href="applyStatusAll.do?id=${principal.id}">지원 현황</a></li>
				<li class="asf_position"><a href="writeJobStatusAll.do?id=${principal.id}">구인 현황</a></li>
			</ul>
		</div>

		<div class="asa_contents">
			<div class="asa_counts">
				<c:forEach var="statusCountDtos" items="${statusAllDto.statusCountDtos}">
					<div class="asa_count_all">
						<a href="writeJobStatusAll.do?id=${principal.id}">
							<p class="asa_all_count">${statusCountDtos.statusAll}</p>
							<p class="asa_all_text">전체</p>
						</a>
					</div>
					<div class="asa_count_c">
						<a href="writeJobStatus.do?id=${principal.id}">
							<p class="asa_count">${statusCountDtos.statusC}</p>
							<p class="asa_text">진행중</p>
						</a>
					</div>
					<div class="asa_count_final">
						<a href="writeJobStatusFin.do?id=${principal.id}">
							<p class="asa_final_count">${statusCountDtos.statusFinal}</p>
							<p class="asa_final_text">컨택 완료</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="asa_search">
				<form name="searchAll" action="writeJobStatusAll.do?id=${statusAllDto.id}">
					<input id="keyword" placeholder="공고 제목 검색" type="text" name="keyword" value="${statusAllDto.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<div>
				<table class="asa_table">
					<thead>
						<tr>
							<th>공고 제목</th>
							<th>신청자 이름</th>
							<th>모집 마감일</th>
							<th>진행 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="statusInfoDtos" items="${statusAllDto.statusInfoDtos}">
							<tr>
								<!-- 작성 공고 제목 -->
								<td><a href="#">${statusWaitingInfoDtos.companyName}</a></td>
								<!-- 선호 포지션 유형 -->
								<td>${statusWaitingInfoDtos.positionCodeName}</td>
								<!-- 모집 마감일 -->
								<td>${statusWaitingInfoDtos.created}</td>
								<!-- 모든 진행상태 공고 출력 -->
								<td>
									<c:choose>
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
									</c:choose>
								</td>
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