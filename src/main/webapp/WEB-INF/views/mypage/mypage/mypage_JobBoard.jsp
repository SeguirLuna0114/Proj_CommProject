<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/mypage.css" rel="stylesheet" />
<link href="${path}/css/subscribes.css" rel="stylesheet" />
<link href="${path}/css/proposal.css" rel="stylesheet" />
<link href="${path}/css/companypage_recruit_manage.css" rel="stylesheet" />

<script>
	function changePage() {
		var select = document.getElementById("cp_option_select");
		var selectedValue = select.options[select.selectedIndex].value;

		if (selectedValue === "applyStatus_main") {
			window.location.href = "mypage_Apply.do";
		} else if (selectedValue === "recruitStatus_main") {
			window.location.href = "mypage_JobBoard.do";
		}
	}
</script>
</head>

<div id="wrap">
	<div id="mp_wrap">
		<div class="mypage">
			<p class="mypage_title">My Page</p>

			<div class="mp_info">
				<div class="mp_account">
					<c:forEach var="userInfoVOs" items="${infoAllDto.userInfoVOs}">
						<div class="mp_img"></div>
						<div class="mp_acc">
							<p class="mp_name">${userInfoVOs.userName}</p>
							<p class="mp_call">${userInfoVOs.userPhone}</p>
							<p class="mp_email">${userInfoVOs.userEmail}</p>
						</div>
						<div class="mp_acc_setting">
							<button>
								<a href="accountSetting.do">계정 설정하기</a>
							</button>
						</div>
					</c:forEach>
				</div>


				<div class="cp_menu">
					<select name="cp_option" id="cp_option_select"
						onchange="changePage()">
						<option value="applyStatus_main">지원 공고 관리</option>
						<option value="recruitStatus_main" selected="selected">
							작성 공고 관리</option>
					</select>
				</div>

				<div class="cp_status">
					<c:forEach var="infoCountVOs" items="${infoAllDto.infoCountVOs}">
						<ul>
							<li><a href="writeJobStatusAll.do">
									<div class="cp_status_li2">구인 현황</div>
									<div>${infoCountVOs.jobstatusAll}</div>
							</a></li>
							<li><a href="likeListsPR.do">
									<div class="mp_status_li2">좋아요 한 PR</div>
									<div>${infoCountVOs.prlikesCount}</div>
							</a></li>
							<li><a href="messagebox_send.do">
									<div class="mp_status_li3">쪽지함</div>
									<p class="proposal_notifications"></p>
									<div>${infoCountVOs.messagesCount}</div>
							</a></li>
							<li><a href="commWroteAll.do">
									<div class="mp_status_li4">커뮤니티 글 관리</div>
									<div>${infoCountVOs.commCountAll}</div>
							</a></li>
							<li><a href="#">
									<div class="mp_status_li4">문의 글 관리</div>
									<div>${infoCountVOs.qnaCountAll}</div>
							</a></li>
						</ul>
					</c:forEach>
				</div>
			</div>

			<div class="logout">
				<button>
					<a href="logout.do">로그아웃</a>
				</button>
			</div>
		</div>

		<div class="cp_contents">
			<div class="cp_applications">
				<a href="writeJobStatusAll.do" class="cp_apply_manage">
					<div class="cp_apply_text">
						<p>지원자 관리 바로가기</p>
						<span>지원/열람/승인한 지원자들을 한 눈에 볼 수 있습니다.</span>
					</div>
					<div class="cp_arrow">></div>
				</a>

				<div class="cp_search">
					<a href="#" class="subtitle_btn">구인공고 작성</a>

					<div class="cp_select">
						<select name="text">
							<option value="#" selected="selected">지역</option>
							<option value="all">전체</option>
							<c:forEach var="allJobDatas" items="${allJobDatas}">
								<option value="${allJobDatas.jobplace}">
									${allJobDatas.jobplace}</option>
							</c:forEach>
						</select>
						<select name="text" class="select_position">
							<option value="#" selected="selected">테마(분류)</option>
							<c:forEach var="allJobDatas" items="${allJobDatas}">
								<option value="${allJobDatas.jobcd}">${allJobDatas.jobcd}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="cp_content_wrapper">
					<c:forEach var="wanteds" items="${jobLists}">
						<div class="cp_content_item">
							<div class="cp_item_top">
								<div class="cp_item_wanted">
									<a href="#" class="cp_wanted_link">
										<p class="wanted_title">${wanteds.jobsub}</p>
										<p class="wanted_discribes">${wanteds.jobtext}</p>
									</a>
								</div>
								<%-- <div class="cp_item_state">${wanteds.state}</div> --%>
							</div>
							<div class="cp_item_bot">
								<a href="#" class="cp_wanted_modify">수정하기</a>
							</div>
						</div>
					</c:forEach>
					
					<div class="paging">
						<ul class="pagination">
							<li class='page-item-prev${pagingJobManageVO.pagingVO.first ? "-hidden" : ""}'><a href="mypage_JobBoard.do?page=${pagingJobManageVO.pagingVO.currentPage - 1}">이전</a></li>
							<c:forEach var="num" begin="${pagingJobManageVO.pagingVO.startPageNum}" end="${pagingJobManageVO.pagingVO.lastPageNum}">
								<li class='page-item${pagingJobManageVO.pagingVO.currentPage + 1 == num ? "-select" : ""}'>
								<a href="mypage_JobBoard.do?id=${id}&page= ${num-1}">${num}</a></li>
							</c:forEach>
							<li class='page-item-next${pagingJobManageVO.pagingVO.last ? "-hidden" : ""}'><a href="mypage_JobBoard.do?page=${pagingJobManageVO.pagingVO.currentPage + 1}">다음</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>
