<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/proposal.css?after" rel="stylesheet">

<!-- 커뮤니티 관련 js파일 -->
<script src="${path}/js/commWroteList.js"></script>
</head>

<div id="wrap">
	<div id="pp_wrap">
		<div class="pp_menu">
			<p class="pp_title">커뮤니티 글 관리</p>
			<ul>
				<li class="pp_proposal"><a href="commWroteAll.do?id=${id}">작성 글</a></li>
				<li class="pp_position"><a href="commReplyWrote.do?id=${id}">작성 댓글</a></li>
				<li class="pp_position"><a href="likeListsComm.do?id=${id}">좋아요 한 글</a></li>
			</ul>
		</div>

		<div class="pp_contents">
			<p class="pp_sub_title">작성 글</p>
			<div class="pp_search">
				<form name="searchProposal" action="commWroteAll.do?id=${commsVO.id}">
					<input id="keyword" type="text" placeholder="글 제목 검색" name="keyword" value="${commsVO.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<div>
				<table class="pp_table">
					<thead>
						<tr>
							<th>글 제목</th>
							<th>글 내용</th>
							<th>조회수</th>
							<th>댓글수</th>
							<th>좋아요 갯수</th>
							<th>글 수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="commInfoVOs" items="${commsVO.commInfoVOs}">
							<tr>
								<!-- 커뮤니티 글 제목으로 이동 -->
								<td><a href="#?commNo=${commInfoVOs.commNo}">${commInfoVOs.commSub}</a></td>
								<!-- 커뮤니티 글 상세내용 -->
								<td>${commInfoVOs.commText}</td>
								<!-- 커뮤니티 글 조회수 -->
								<td>${commInfoVOs.commCount}</td>
								<!-- 해당 글 댓글수 -->
								<td><p class="cnt_highlight">${commInfoVOs.replyCnt}</p></td>
								<!-- 해당 글 좋아요 수 -->
								<td><p class="cnt_highlight">${commInfoVOs.likeCnt}</p></td>
								<!-- 해당 글 수정일 -->
								<td>${commInfoVOs.commUpdate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>