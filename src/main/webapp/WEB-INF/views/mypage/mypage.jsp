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
					<div class="mp_img"></div>
					<div class="mp_acc">
						<p class="mp_name">Username</p>
						<p class="mp_call">phoneNumber</p>
						<p class="mp_email">E-mail Address</p>
					</div>
					<div class="mp_acc_setting">
						<button>
							<a href="#">계정 설정하기</a>
						</button>
					</div>
				</div>

				<div class="mp_status">
					<ul>
						<li><a href="#">
								<div class="mp_status_li1">지원 현황</div>
								<div>12</div>
						</a></li>
						<li><a href="#">
								<div class="mp_status_li2">좋아요</div>
								<div>2</div>
						</a></li>
						<li><a href="#">
								<div class="mp_status_li3">쪽지함(받은 요청)</div>
								<p class="proposal_notifications"></p>
								<div>5</div>
						</a></li>
						<li><a href="#">
								<div class="mp_status_li4">구독</div>
								<div>3</div>
						</a></li>
					</ul>
				</div>
				<!-- end mp_status -->
			</div>
			<!-- end mp_info -->

			<div class="btn_proposal">
				<button>
					<a href="#">제안하기</a>
				</button>
			</div>
			<div class="btn_application">
				<button>
					<a href="#">지원하기</a>
				</button>
			</div>

			<p class="application_notifications"></p>

			<div class="logout">
				<button>
					<a href="/logout">로그아웃</a>
				</button>
			</div>
		</div>

		<div class="mp_contents">
			<div class="mp_applications">
				<p class="mp_application_title">지원 현황</p>
				<div class="mp_application_counts">
					<div class="mp_app_all">
						<a href="#">
							<p class="mp_all_count">12</p>
							<p class="mp_all_text">전체</p>
						</a>
					</div>
					<div class="mp_app">
						<a href="#">
							<p class="mp_count">4</p>
							<p class="mp_text">지원 완료</p>
						</a>
					</div>
					<div class="mp_app_final">
						<a href="#">
							<p class="mp_final_count">4</p>
							<p class="mp_final_text">최종 합격</p>
						</a>
					</div>
				</div>
			</div>

			<div class="mp_position">
				<p class="mp_position_title">프로필</p>
				<div class="mp_pro_contents">
					<p class="mp_profile_position">
						현재 구직중인 포지션은 <span><b>포지션명</b></span>
					</p>

					<button>
						<a href="#">프로필 수정하기</a>
					</button>
				</div>
			</div>

			<div class="mp_recommend">
				<p class="mp_reco_title">추천 공고</p>
				<div class="mp_recos">
					<div class="mp_reco1">
						<a href="#">
							<div class="mp_reco1_1">
								<img src="https://picsum.photos/250/250" />
							</div>
							<p class="mp_reco_com_title">공고명</p>
							<p class="mp_reco_com_content">공고 세부내용</p>
							<div class="mp_company">
								<!-- <img> -->
								<p class="mp_company_name">회사명</p>
							</div>
						</a>
					</div>

					<div class="mp_reco2">
						<a href="#">
							<div class="mp_reco2_1">
								<img src="https://picsum.photos/250/250" />
							</div>
							<p class="mp_reco_com_title">공고명</p>
							<p class="mp_reco_com_content">공고 세부내용</p>
							<div class="mp_company">
								<!-- <img> -->
								<p class="mp_company_name">회사명</p>
							</div>
						</a>
					</div>

					<div class="mp_reco3">
						<a href="#">
							<div class="mp_reco3_1">
								<img src="https://picsum.photos/250/250" />
							</div>
							<p class="mp_reco_com_title">공고명</p>
							<p class="mp_reco_com_content">공고 세부내용</p>
							<div class="mp_company">
								<!-- <img> -->
								<p class="mp_company_name">회사명</p>
							</div>
						</a>
					</div>

					<div class="mp_reco4">
						<a href="#">
							<div class="mp_reco4_1">
								<img src="https://picsum.photos/250/250" />
							</div>
							<p class="mp_reco_com_title">공고명</p>
							<p class="mp_reco_com_content">공고 세부내용</p>
							<div class="mp_company">
								<!-- <img> -->
								<p class="mp_company_name">회사명</p>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- .mprecommend -->
		</div>
		<!--.mpcontents -->
	</div>
	<!-- .mpwrap -->
</div>

<%@ include file="../layout/footer.jsp"%>
