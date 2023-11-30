<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/mypage.css" rel="stylesheet" />
<link href="${path}/css/companypage_recruit_manage.css" rel="stylesheet" />

<!-- select option에 따른 page shift -->
<script src="${path}/js/mypageShift.js"></script>
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
								<a href="accountSetting.do?id=${id}">계정 설정하기</a>
							</button>
						</div>
					</c:forEach>

					<!-- JobBoard에 작성한/지원한 공고 select -->
					<div class="cp_menu">
						<select name="cp_option" id="cp_option_select" onchange="changePage()">
							<option value="applyStatus_main" selected="selected">지원 공고 관리</option>
							<option value="recruitStatus_main">작성 공고 관리</option>
						</select>
					</div>
				</div>

				<div class="mp_status">
					<c:forEach var="infoCountVOs" items="${infoAllDto.infoCountVOs}">
						<ul>
							<li><a href="applyStatusAll.do?id=${id}">
									<div class="mp_status_li1">지원 현황</div>
									<div>${infoCountVOs.applystatusAll}</div>
							</a></li>
							<li><a href="likeListsComm.do?id=${id}">
									<div class="mp_status_li2">좋아요 한 커뮤니티</div>
									<div>${infoCountVOs.commlikesCount}</div>
							</a></li>
							<!-- 받은 쪽지함으로 이동 -->
							<li><a href="messagebox.do?id=${id}">
									<div class="mp_status_li3">쪽지함</div>
									<p class="proposal_notifications"></p>
									<div>${infoCountVOs.messagesCount}</div>
							</a></li>
							<li><a href="commWroteAll.do?id=${id}">
									<div class="mp_status_li4">커뮤니티 글 관리</div>
									<div>${infoCountVOs.commCountAll}</div>
							</a></li>
						</ul>
					</c:forEach>
				</div>
				<!-- end mp_status -->
			</div>
			<!-- end mp_info -->

          <!-- 작성한 글 관리 -->
          <!-- <div class="btn_proposal">
            <button>
              <a href="#">작성 글 관리</a>
            </button>
          </div>
          <div class="btn_application">
            <button>
              <a href="#">작성 댓글 관리</a>
            </button>
          </div> -->

          <!-- <p class="application_notifications"></p> -->

			<div class="logout">
				<button>
					<a href="logout.do?id=${id}">로그아웃</a>
				</button>
			</div>
		</div>
		<!-- end mypage -->


		<!-- 페이지 contents -->
		<div class="mp_contents">
			<div class="mp_applications">
				<c:forEach var="statusCountVOs" items="${infoAllDto.statusCountVOs}">
					<p class="mp_application_title">지원 현황</p>
					<div class="mp_application_counts">
						<!-- 전체 지원현황 -->
						<div class="mp_app_all">
							<a href="applyStatusAll.do?id=${id}">
								<p class="mp_all_count">${statusCountVOs.appstatusAll}</p>
								<p class="mp_all_text">전체</p>
							</a>
						</div>

						<!-- 지원 완료 내역 -->
						<div class="mp_app">
							<a href="applyStatusAll.do?id=${id}">
								<p class="mp_count">${statusCountDtos.appstatusCont}</p>
								<p class="mp_text">지원 완료</p>
							</a>
						</div>

						<!-- 지원한 공고에 합격한(승인된) 내역 -->
						<div class="mp_app_final">
							<a href="commStatusAll.do?id=${id}">
								<p class="mp_final_count">${statusCountDtos.appstatusFin}</p>
								<p class="mp_final_text">최종 합격</p>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- pr게시판에 작성한 "가장 최근" 내용 불러오기 -->
		<div class="mp_position">
			<p class="mp_position_title">프로필</p>
			<div class="mp_pro_contents">
				<!-- PR게시판에 작성한 내용 중, 내용, 전공, 지역, 경력, 영상, 첨부파일, 해시태그 -->
				<c:forEach var="userInfoVOs" items="${infoAllDto.userInfoVOs}">
					<c:choose>
						<c:when test="${userInfoVOs.userPosition eq null}">
							<p class="mp_profile_position">
								선호하는 <span>포지션</span>을 설정해주세요
							</p>
						</c:when>
						<c:otherwise>
							<p class="mp_profile_position">
								현재 설정한 포지션은 <span><b>${userInfoVOs.userPosition}</b></span>
							</p>
						</c:otherwise>
					</c:choose>

					<button>
						<!-- PR 수정페이지로 이동 -->
						<a href="prUpdate.do?id=${id}">프로필 수정하기</a>
					</button>
				</c:forEach>
			</div>
		</div>

		<!-- 인기 공고 리스트 -->
		<div class="mp_recommend">
			<p class="mp_reco_title">추천 공고</p>
			<div class="mp_recos">
				<!-- 추천공고 4개만 나오게 설정 -->
				<c:forEach var="jobInfoVOs" items="${infoAllDto.jobInfoVOs}">
					<div class="mp_reco${jobInfoVOs.no}">
						<a href="#">
							<div class="mp_reco${jobInfoVOs.no}_1">
								<!-- 공고의 모집분야 별 이미지 -->
								<c:if test="${!empty jobInfoVO.photo}">
									<img src="${jobInfoVO.photo}" />
								</c:if>
								<c:if test="${empty jobInfoVO.photo}">
									<!-- 디폴트 이미지 -->
									<img src="https://picsum.photos/250/250" />
								</c:if>
							</div> 
							
							<!-- 해당 공고 제목 -->
							<p class="mp_reco_com_title">${jobInfoVOs.jobSub}</p> 
							<!-- 해당 공고 상세내용 -->
							<p class="mp_reco_com_content">${jobInfoVOs.jobText}</p>

							<div class="mp_company">
								<!-- <img> -->
								<!-- 해당 공고 작성자 id -->
								<p class="mp_company_name">${jobInfoVOs.userName}(${jobInfoVOs.userId})</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- .mprecommend -->
	</div>
	<!--.mpcontents -->
</div>
<!-- .mpwrap -->
</div>

<%@ include file="../layout/footer.jsp"%>
