<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/proposal.css?after" rel="stylesheet">

<script src="${path}/js/commWroteList.js"></script>
<script type="text/javascript">
	function toggleAllCheckboxes() {
		var selectAllCheckbox = document.getElementById("selectAll");
		var commNoCheckboxes = document.getElementsByName("commNo");
		
		for (var i = 0; i < commNoCheckboxes.length; i++) {
            commNoCheckboxes[i].checked = selectAllCheckbox.checked;
        }
	}

	function deleteComm() {
		delNoList = document.querySelectorAll("[type=checkbox]:checked");
		
	    if (delNoList.length === 0) {
	        // 체크박스가 선택되지 않았을 경우
	        alert("삭제할 항목을 선택해주세요.");
	        return;
	    }
		
		let commNo = "";
		delNoList.forEach((checkbox) => {
			commNo += checkbox.value + ',';
		});
		
		commNo = commNo.substr(0, commNo.length-1);
		console.log(commNo);
		
		deleteComm.action = "deleteComm.do";
		deleteComm.commNo.value = commNo;
		deleteComm.submit();
	}
</script>

</head>

<div id="wrap">
	<div id="pp_wrap">
		<div class="pp_menu">
			<p class="pp_title">커뮤니티 글 관리</p>
			<ul>
				<li class="pp_proposal"><a href="commWroteAll.do">작성 글</a></li>
				<li class="pp_position"><a href="commReplyWrote.do">작성 댓글</a></li>
				<li class="pp_position"><a href="likeListsComm.do">좋아요 한 글</a></li>
			</ul>
		</div>

		<div class="pp_contents">
			<p class="pp_sub_title">작성 글</p>
			<div class="pp_search">
				<form name="searchProposal" action="commWroteAll.do">
					<input id="keyword" type="text" placeholder="글 제목 검색" name="keyword"
					 value="${sessionScope.referer != null ? sessionScope.referer.keyword : ''}">
					<%-- <input type="hidden" name="id" value="${commsVO.id}" /> --%>
					<button class="btn_search" type="submit"></button>
				</form>
			</div>

			<div class="pp_search">
				<button type="button" id="deleteCommBtn" onclick="deleteComm()">삭제</button>
			</div>
			
			<div>
				<form action="deleteComm.do" name="deleteComm" id="deleteComm">
					<table class="pp_table">
						<thead>
							<tr>
								<th><input type="checkbox" id="selectAll" onclick="toggleAllCheckboxes()"></th>
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
									<td>
										<label>
											<input type="checkbox" name="commNo" value="${commInfoVOs.commNo}">
											<span style="font-size: 12px"></span>
										</label>
									</td>
									<td><a href="#?commNo=${commInfoVOs.commNo}">${commInfoVOs.commSub}</a></td>
									<td>${commInfoVOs.commText}</td>
									<td>${commInfoVOs.commCount}</td>
									<td><p class="cnt_highlight">${commInfoVOs.replyCnt}</p></td>
									<td><p class="cnt_highlight">${commInfoVOs.likeCnt}</p></td>
									<td>${commInfoVOs.commUpdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>