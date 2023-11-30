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
				<li class="pp_position"><a href="commWroteAll.do?id=${id}">작성 글</a></li>
				<li class="pp_proposal"><a href="commReplyWrote.do?id=${id}">작성 댓글</a></li>
				<li class="pp_position"><a href="likeListsComm.do?id=${id}">좋아요 한 글</a></li>
			</ul>
		</div>

		<div class="pp_contents">
			<p class="pp_sub_title">작성 댓글</p>
			<div class="pp_search">
				<form name="searchProposal" action="commReplyWrote.do?id=${commReplysVO.id}">
					<input id="keyword" type="text" placeholder="글 제목 검색" name="keyword" value="${commReplysVO.keyword}">
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<div>
				<table class="pp_table">
					<thead>
						<tr>
							<th>댓글 내용</th>
							<th>댓글단 글 제목</th>
							<th>댓글수</th>
							<th>댓글 수정(작성)일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="commReplyInfoVOs" items="${commReplysVO.commReplyInfoVOs}">
							<tr>
								<!-- 댓글로 이동 -->
								<!-- 댓글 상세내용 -->
								<td><a href="?commReNo=${commReplyInfoVOs.commReNo}">${commReplyInfoVOs.commReText}</a></td>
								<!-- 댓글 단 글의 제목 -->
								<td>${commReplyInfoVOs.commSub}</td>
								<!-- 댓글 단 글의 댓글 수 -->
								<td><p class="cnt_highlight">${commReplyInfoVOs.commreplyCnt}</p></td>
								<!-- 해당 댓글 수정일 -->
								<td>${commReplyInfoVOs.commReUpdate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>