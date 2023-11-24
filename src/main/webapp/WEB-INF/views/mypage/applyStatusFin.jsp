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
			<p class="asf_title">지원 현황</p>
			<ul>
				<li class="asf_position"><a href="/applicationstatusall/${principal.id}">지원한 포지션</a></li>
				<li class="asf_proposal"><a href="/proposal/${principal.id}">받은 요청</a></li>
			</ul>
		</div>

		<div class="asf_contents">
			<div class="asf_counts">
				<c:forEach var="statusCountDtos" items="${statusFinalDto.statusCountDtos}">
					<div class="asf_count_all">
						<a href="/applicationstatusall/${principal.id}">
							<p class="asf_all_count">${statusCountDtos.statusAll}</p>
							<p class="asf_all_text">전체</p>
						</a>
					</div>
					<div class="asf_count_c">
						<a href="/applicationstatus/${principal.id}">
							<p class="asf_count">${statusCountDtos.statusC}</p>
							<p class="asf_text">지원 완료</p>
						</a>
					</div>
					<div class="asf_count_final">
						<a href="/applicationstatusfinal/${principal.id}">
							<p class="asf_final_count">${statusCountDtos.statusFinal}</p>
							<p class="asf_final_text">최종합격</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="asf_search">
				<form name="searchFinal" action="/applicationstatusfinal/${statusFinalDto.id}">
					<input type="text" placeholder="회사명 검색" name="keyword" value="${statusFinalDto.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>


			<div>
				<table class="asf_table">
					<thead>
						<tr>
							<th>지원 회사</th>
							<th>지원 포지션</th>
							<th>작성 시간</th>
							<th>진행 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="statusFinalInfoDtos" items="${statusFinalDto.statusFinalInfoDtos}">
							<tr>
								<!-- 지원한 회사 명 -->
								<td><a href="#">${statusFinalInfoDtos.companyName}</a></td>
								<!-- 지원한 포지션 명 -->
								<td>${statusFinalInfoDtos.positionCodeName}</td>
								<!-- 지원 일자 -->
								<td>${statusFinalInfoDtos.created}</td>
								<td>
									<p class="pass">합격</p>
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