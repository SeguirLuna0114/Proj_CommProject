<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<!-- 지원현황 최종 페이지 css 설정 -->
<link href="${path}/css/application_status_final.css" rel="stylesheet">

<!-- 지원현황 관련 js파일 -->
<script src="${path}/js/applyStatus.js"></script>
</head>

<!-- 지원현황 페이지 - 최종(진행상태=합격) 지원현황 -->
<div id="wrap">
	<div id="asf_wrap">
		<div class="asf_menu">
			<p class="asf_title">구인 게시판</p>
			<ul>
				<li class="asf_position"><a href="applyStatusAll.do?id=${principal.id}">지원 현황</a></li>
				<li class="asf_proposal"><a href="writeJobStatusAll.do?id=${principal.id}">구인 현황</a></li>
			</ul>
		</div>

		<div class="asf_contents">
			<div class="asf_counts">
				<c:forEach var="statusCountDtos" items="${statusFinalDto.statusCountDtos}">
					<div class="asf_count_all">
						<a href="applyStatusAll.do?id=${principal.id}">
							<p class="asf_all_count">${statusCountDtos.statusAll}</p>
							<p class="asf_all_text">전체</p>
						</a>
					</div>
					<div class="asf_count_c">
						<a href="applyStatus.do?id=${principal.id}">
							<p class="asf_count">${statusCountDtos.statusC}</p>
							<p class="asf_text">지원 완료</p>
						</a>
					</div>
					<div class="asf_count_final">
						<a href="applyStatusFin.do?id=${principal.id}">
							<p class="asf_final_count">${statusCountDtos.statusFinal}</p>
							<p class="asf_final_text">최종 컨택</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="asf_search">
				<form name="searchFinal" action="applyStatusFin.do?id=${principal.id}">
					<input type="text" placeholder="공고 제목 검색" name="keyword" value="${statusFinalDto.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<!-- 완료된 지원내역을 표로 출력 -->
			<div>
				<table class="asf_table">
					<thead>
						<tr>
							<th>공고 제목</th>
							<th>지원 유형</th>
							<th>모집마감일</th>
							<th>진행 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="statusFinalInfoDtos" items="${statusFinalDto.statusFinalInfoDtos}">
							<tr>
								<!-- 지원 공고 명 -->
								<td><a href="#">${statusWaitingInfoDtos.companyName}</a></td>
								<!-- 지원한 포지션 유형 -->
								<td>${statusWaitingInfoDtos.positionCodeName}</td>
								<!-- 모집 마감일 -->
								<td>${statusWaitingInfoDtos.created}</td>
								<!-- 진행상태가 "승인"인 공고만 출력 -->
								<td>
									<p class="pass">승인</p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>