<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/proposal.css?after" rel="stylesheet">

<!-- 메시지 관련 js파일 -->
<script src="${path}/js/message.js"></script>
</head>

<div id="wrap">
	<div id="pp_wrap">
		<div class="pp_menu">
			<p class="pp_title">쪽지함</p>
			<ul>
				<li class="pp_position"><a href="messagebox.do">받은 쪽지함</a></li>
				<li class="pp_proposal"><a href="messagebox_send.do">보낸 쪽지함</a></li>
			</ul>
		</div>


		<div class="pp_contents">
			<p class="pp_sub_title">보낸 쪽지함</p>
			<!-- 검색창 -->
			<div class="pp_search">
				<form name="searchProposal" action="messagebox_send.do">
					<input id="keyword" type="text" placeholder="키워드 검색" name="keyword" value="${requestsDto.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<div>
				<table class="pp_table">
					<thead>
						<tr>
							<th>받는 사람</th>
							<th>쪽지 내용</th>
							<th>보낸 날짜</th>
							<th>수신 확인</th>
						</tr>
					</thead>
					<tbody>
						<!-- 발신인(userId)이 "본인"인 메일(보낸 메일)에 관해서만 출력 -->
						<c:forEach var="requestsInfoDtos" items="${requestsDto.requestsInfoDtos}">
							<c:if test="${requestsInfoDtos.userId eq requestsDto.id}">
								<tr>
									<!-- 해당 쪽지 상세내용으로 이동 -->
									<td><a href="#">${requestsInfoDtos.userId2}</a></td>
									<td>${requestsInfoDtos.msgText}</td>
									<td>${requestsInfoDtos.msgDate}</td>
									<!-- 수신확인(확인했을 경우, 확인한 시간을 출력)/(미확인) -->
									<td><c:choose>
											<c:when test="${requestsInfoDtos.msggubun == 0}">
												<p class="notyet">미확인</p>
											</c:when>
											<c:when test="${requestsInfoDtos.msggubun == 1}">
												<p class="checked">확인</p>
												<!-- 확인한 시간 -->
												<p class="checked_time">${requestsInfoDtos.checktime}</p>
											</c:when>
											<c:otherwise>
												<p class="notyet">미확인</p>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<%@ include file="../layout/footer.jsp"%>