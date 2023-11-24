<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<link href="${path}/css/mypage.css" rel="stylesheet" />
</head>


<div id="wrap">
	<div id="mp_wrap">
		<div class="mypage">
			<p class="mypage_title">My Page</p>

			<div class="mp_info">
				<div class="mp_account">
					<c:forEach var="userInfoDtos" items="${infoAllDto.userInfoDtos}">
						<div class="mp_img"></div>
						<div class="mp_acc">
							<p class="mp_name">${userInfoDtos.userName}</p>
							<p class="mp_call">${userInfoDtos.phoneNumber}</p>
							<p class="mp_email">${userInfoDtos.email}</p>
						</div>
						<div class="mp_acc_setting">
							<button>
								<a href="accountSetting.do?id=${principal.id}">계정 설정하기</a>
							</button>
						</div>
					</c:forEach>
				</div>

				<div class="mp_status">
					<c:forEach var="infoCountDtos" items="${infoAllDto.infoCountDtos}">
						<ul>
							<li><a href="applyStatusAll.do?id=${principal.id}">
									<div class="mp_status_li1">지원 현황</div>
									<div>${infoCountDtos.statusAll}</div>
							</a></li>
							<li><a href="likeList.do?id=${principal.id}">
									<div class="mp_status_li2">좋아요</div>
									<div>${infoCountDtos.likesCount}</div>
							</a></li>
							<li><a href="messageBox.do?id=${principal.id}">
									<div class="mp_status_li3">쪽지함</div>
									<p class="proposal_notifications"></p>
									<div>${infoCountDtos.requestsCount}</div>
							</a></li>
							<li><a href="communityList.do?id=${principal.id}">
									<div class="mp_status_li4">커뮤니티</div>
									<div>${infoCountDtos.subscribesCount}</div>
							</a></li>
						</ul>
					</c:forEach>
				</div>
				<!-- end mp_status -->
			</div>
			<!-- end mp_info -->

			<div class="btn_proposal">
				<button>
					<a href="#">추천 공고</a>
				</button>
			</div>
			<div class="btn_application">
				<button>
					<a href="#">인기 게시글</a>
				</button>
			</div>

			<p class="application_notifications"></p>

			<div class="logout">
				<button>
					<a href="logout.do?id=${principal.id}">로그아웃</a>
				</button>
			</div>
		</div>

		<!-- 페이지 contents -->
		<div class="mp_contents">
			<div class="mp_applications">
				<c:forEach var="statusCountDtos" items="${infoAllDto.statusCountDtos}">
					<p class="mp_application_title">활동 내역</p>
					<!-- 작성 글 개수만 출력 -->
					<div class="mp_application_counts">
					
						<!-- 작성한 구인 공고 내역 -->
						<div class="mp_app_all">
							<a href="jobStatusAll.do?id=${principal.id}">
								<p class="mp_all_count">${statusCountDtos.statusJob}</p>
								<p class="mp_all_text">구인 현황</p>
							</a>
						</div>
						
						<!-- 지원 완료 내역 -->
						<div class="mp_app">
							<a href="applyStatusAll.do?id=${principal.id}">
								<p class="mp_count">${statusCountDtos.statusAll}</p>
								<p class="mp_text">지원 현황</p>
							</a>
						</div>
						
						<!-- 커뮤니티 페이지에 작성한 글 내역 -->
						<div class="mp_app_final">
							<a href="commStatusAll.do?id=${principal.id}">
								<p class="mp_final_count">${statusCountDtos.statusFinal}</p>
								<p class="mp_final_text">커뮤니티</p>
							</a>
						</div>
				</c:forEach>
			</div>
		</div>

		<!-- pr게시판에 작성한 "가장 최근" 내용 불러오기 -->
		<div class="mp_position">
			<p class="mp_position_title">프로필</p>
			<div class="mp_pro_contents">
				<!-- PR게시판에 작성한 내용 중, 내용, 전공, 지역, 경력, 영상, 첨부파일, 해시태그 -->
				<c:forEach var="userInfoDtos" items="${infoAllDto.userInfoDtos}">
					
				
					<c:choose>
						<c:when test="${userInfoDtos.positionCodeName eq null}">
							<p class="mp_profile_position">
								선호하는 <span>포지션</span>을 설정해주세요
							</p>
						</c:when>
						<c:otherwise>
							<p class="mp_profile_position">
								선호하는 포지션 : <span><b>${userInfoDtos.positionCodeName}</b></span>
							</p>
						</c:otherwise>
					</c:choose>

					<button>
						<!-- PR 수정페이지로 이동 -->
						<a href="prUpdate.do?id=${principal.id}">프로필 수정하기</a>
					</button>
				</c:forEach>
			</div>
		</div>

		<div class="mp_recommend">
			<p class="mp_reco_title">추천 공고</p>
			<div class="mp_recos">
				<!-- 추천공고 4개만 나오게 설정 -->
				<c:forEach var="companyInfoDtos" items="${infoAllDto.companyInfoDtos}" begin="0" end="3">
					<div class="mp_reco${companyInfoDtos.no}">
						<a href="#">
							<div class="mp_reco${companyInfoDtos.no}_1">
								<!-- 회사에서 설정한 이미지 -->
								<img src="https://picsum.photos/250/250" />
							</div> <!-- 해당 공고 제목 -->
							<p class="mp_reco_com_title">${companyInfoDtos.title}</p> <!-- 해당 공고 상세내용 -->
							<p class="mp_reco_com_content">${companyInfoDtos.detail}</p>

							<div class="mp_company">
								<!-- <img> -->
								<!-- 해당 공고 회사명 -->
								<p class="mp_company_name">${companyInfoDtos.companyName}</p>
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
