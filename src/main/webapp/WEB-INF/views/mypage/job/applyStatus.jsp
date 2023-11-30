<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<!-- 지원현황 페이지 css 설정 -->
<link href="${path}/css/application_status.css" rel="stylesheet" />

<!-- 지원현황 관련 js파일 -->
<script src="${path}/js/applyStatus.js"></script>
</head>

<!-- 지원현황 페이지 - 지원 완료(지원상태=대기중) -->
<div id="wrap">
	<div id="as_wrap">
		<div class="as_menu">
			<p class="as_title">구인 게시판</p>
			<ul>
				<li class="as_position"><a href="applyStatusAll.do?id=${id}">지원 현황</a></li>
				<li class="as_proposal"><a href="writeJobStatusAll.do?id=${id}">구인 현황</a></li>
			</ul>
		</div>

		<div class="as_contents">
			<div class="as_counts">
				<c:forEach var="statusCountVOs" items="${statusWaitingVO.statusCountVOs}">
					<div class="as_count_all">
						<a href="applyStatusAll.do?id=${id}"> <!-- 전체 지원완료 개수 -->
							<p class="as_all_count">${statusCountVOs.appstatusAll}</p>
							<p class="as_all_text">전체</p>
						</a>
					</div>
					<div class="as_count_c">
						<a href="applyStatus.do?id=${id}"> <!-- 지원완료 중 진행상태 = 대기중 -->
							<p class="as_count">${statusCountVOs.appstatusCont}</p>
							<p class="as_text">지원 완료</p>
						</a>
					</div>
					<div class="as_count_final">
						<a href="applyStatusFin.do?id=${id}"> <!-- 지원완료 중 진행상태 = 합격 -->
							<p class="as_final_count">${statusCountVOs.appstatusFin}</p>
							<p class="as_final_text">최종 컨택</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<!-- 검색 -->
			<div class="as_search">
				<form name="search" action="applyStatus.do?id=${statusWaitingVO.userId}">
					<input type="text" placeholder="공고 제목 검색" name="keyword" value="${statusWaitingVO.keyword}" />
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<!-- 하단에, 지원 내역을 표로 출력 -->
			<div>
				<table class="as_table">
					<thead>
						<tr>
							<th>공고 제목</th>
							<th>지원 유형</th>
							<th>모집마감일</th>
							<th>진행 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="statusWaitingInfoVOs" items="${StatusWaitingVO.statusWaitingInfoVOs}">
							<tr>
								<!-- 지원 공고 명 -->
								<td><a href="#">${statusWaitingInfoVOs.jobSub}</a></td>
								<!-- 지원한 포지션 유형(분류) -->
								<td>${statusWaitingInfoVOs.jobCd}</td>
								<!-- 모집 마감일 -->
								<td>${statusWaitingInfoVOs.jobEndDate}</td>
								<!-- 진행상태가 "대기중"인 공고만 출력 -->
								<td>
									<p class="waiting">대기중</p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- end as_table -->
		</div>
		<!-- end as_contents -->
	</div>
	<!-- end as_wrap -->
</div>

<!-- footer -->
<%@ include file="../layout/footer.jsp"%>