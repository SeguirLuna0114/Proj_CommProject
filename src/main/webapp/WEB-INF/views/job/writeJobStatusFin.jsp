<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<!-- 지원현황 최종 페이지 css 설정 -->
<link href="${path}/css/application_status_final.css" rel="stylesheet">

<!-- 구인 현황 관련 js파일 -->
<script src="${path}/js/writejobstatus.js"></script>
</head>

<!-- 지원현황 페이지 - 컨택 완료 -->
<div id="wrap">
	<div id="asf_wrap">
		<div class="asf_menu">
			<p class="asf_title">구인 게시판</p>
			<ul>
				<li class="asf_proposal"><a href="applyStatusAll.do?id=${principal.id}">지원 현황</a></li>
				<li class="asf_position"><a href="writeJobStatusAll.do?id=${principal.id}">구인 현황</a></li>
			</ul>
		</div>

		<div class="asf_contents">
			<div class="asf_counts">
				<c:forEach var="statusCountDtos" items="${statusFinalDto.statusCountDtos}">
					<div class="asf_count_all">
						<a href="writeJobStatusAll.do?id=${principal.id}">
							<p class="asf_all_count">${statusCountDtos.statusAll}</p>
							<p class="asf_all_text">전체</p>
						</a>
					</div>
					<div class="asf_count_c">
						<a href="writeJobStatus.do?id=${principal.id}">
							<p class="asf_count">${statusCountDtos.statusC}</p>
							<p class="asf_text">진행중</p>
						</a>
					</div>
					<div class="asf_count_final">
						<a href="writeJobStatusFin.do?id=${principal.id}">
							<p class="asf_final_count">${statusCountDtos.statusFinal}</p>
							<p class="asf_final_text">컨택 완료</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<!-- 검색 란 - 회사명 입력 시, 해당 회사에 대해서만 출력 -->
			<div class="asf_search">
				<form name="searchFinal" action="writeJobStatusFin.do?id=${statusFinalDto.id}">
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
							<th>신청자 이름</th>
							<th>모집 마감일</th>
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