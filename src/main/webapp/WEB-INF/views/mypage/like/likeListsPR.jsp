<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<script src="${path}/js/like.js"></script>
</head>

<div class="wanteds_page">
	<div class="search_wanted">
		<!-- 포지션 선택 select -->
		<div class="all_position">
			<div class="select_head">포지션 선택</div>
			<div class="select_all">
				<select class="all" id="positionCode" name="positionName" onchange="ChangeValue('positionCode')">
					<option selected>전체</option>
					<!-- prBoard.prMajor : PR게시판에 작성한 전체 "전공명" 리스트 中 선택 -->
					<c:forEach var="allPrDatas" items="${allPrDatas}">
						<option>${allPrDatas.prMajor}</option>
					</c:forEach>
				</select>
			</div>
			<div class="select_position" type="button" id="btnSearch">
				<a><i class="fa fa-search"></i></a>
			</div>
		</div>

		<div class="selects">
			<!-- 이력/경력 선택 -->
			<div class="select_career">
				<select class="career" id="careerCode" name="careerName" onchange="ChangeValue('careerCode')">
					<option selected>신입/경력</option>
					<!-- prBoard.prCareer : PR게시판에 작성한 전체 "경력" 리스트 中 선택 -->
					<c:forEach var="allPrDatas" items="${allPrDatas}">
						<option>${allPrDatas.prCareer}</option>
					</c:forEach>
				</select>
			</div>

			<!-- 지역 선택 select -->
			<div class="select_region">
				<select class="region" id="regionCode" name="regionName" onchange="ChangeValue('regionCode')">
					<option selected>지역 선택</option>
					<!-- prBoard.prLoc : PR게시판에 작성한 전체 "지역명" 리스트 中 선택 -->
					<c:forEach var="allPrDatas" items="${allPrDatas}">
						<option>${allPrDatas.prLoc}</option>
					</c:forEach>
				</select>
			</div>

			<!-- 해시태그 선택 -->
			<div class="select_skill">
				<select class="skill" id="skillsCode" name="skillsName" onchange="ChangeValue('skillsCode')">
					<option selected>해시태그</option>
					<!-- prBoard.prHash : PR게시판에 작성한 전체 "해시태그" 리스트 中 선택 -->
					<c:forEach var="allPrDatas" items="${allPrDatas}">
						<option>#${allPrDatas.prHash}</option>
					</c:forEach>
				</select>
			</div>

			<!-- ..? -->
			<div class="selected_skills">
				<ul>
					<li class="selected_skills_items" id="skill1" style="display: none;"><strong class="skill_name" id="skillName1">test1</strong>
						<p class="select_delete" type="button" onclick="hideSkillbutton('skill1')">
							<a>x</a>
						</p></li>
					<li class="selected_skills_items" id="skill2" style="display: none;"><strong class="skill_name" id="skillName2">test2</strong>
						<p class="select_delete" type="button" onclick="hideSkillbutton('skill2')">
							<a>x</a>
						</p></li>
					<li class="selected_skills_items" id="skill3" style="display: none;"><strong class="skill_name" id="skillName3">test3</strong>
						<p class="select_delete" type="button" onclick="hideSkillbutton('skill3')">
							<a>x</a>
						</p></li>
				</ul>
			</div>

			<!-- 최신순(prDate DESC), 인기순=조회수(prRcount DESC) -->
			<div class="select_sort">
				<select class="sort">
					<option selected>최신순</option>
					<option>인기순</option>
				</select>
			</div>
		</div>
	</div>
	<!-- end search_wanted -->

	<div class="overBox">
		<!-- 좋아요 설정한 PR 출력 -->
		<c:if test="${!empty id}">
			<div class="liked">
				<div class="liked_wanted">
					<div class="liked_title">♥ 내가 좋아요한 PR(홍보 글)</div>
					<div class="wanteds">
						<!-- 각 PR들 출력 -->
						<c:forEach var="likesListPR" items="${likesListPR}">
							<div class="wanted">
								<!-- 해당 PR글로 이동 -->
								<a href="prDetail.do?id=${likesListPR.prNo}">
									<div class="picture">
										<c:choose>
											<c:when test="${empty likesListPR.prFile}">
												<!-- 사진이 없는 경우 디폴트 이미지 사용 -->
												<img src="https://picsum.photos/seed/picsum/200/300">
											</c:when>
											<c:otherwise>
												<!-- 해당 PR글에 업로드한 첨부파일(prFile) -->
												<img src="${path}/upload/${likesListPR.prFile}">
											</c:otherwise>
										</c:choose>
									</div>

									<div class="wanted_text">
										<div class="text">
											<ul>
												<!-- PR 제목 -->
												<li class="title">
													<h2>${likesListPR.prSub}</h2>
												</li>
												<!-- PR 내용 -->
												<li class="content">
													<p>${likesListPR.prText}</p>
												</li>
											</ul>
										</div>
										<div class="company_intro">
											<p class="company_region">${likesListPR.prCareer}</p>
											<p class="company_name">${likesListPR.prMajor}</p>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:if>
	</div>

	<!-- 페이징 설정 -->
<%-- 	<div class="paging">
		<ul class="pagination">
			<li class='page-item-prev${pagingJobManageVO.pagingVO.isFirst ? "hidden" : ""}'><a
				href="likeListPR.do?id=${id}&page=${pagingJobManageVO.pagingVO.currentPage - 1}">이전</a></li>
			<c:forEach var="num" begin="${pagingJobManageVO.pagingVO.startPageNum}" end="${pagingJobManageVO.pagingVO.lastPageNum}">
				<li class='page-item${pagingJobManageVO.pagingVO.currentPage + 1 == num ? "-select" : ""}'><a
					href="likeListPR.do?id=${id}&page=${num-1}">${num}</a></li>
			</c:forEach>
			<li class='page-item-next${pagingJobManageVO.pagingVO.isLast ? "-hidden" : ""}'><a
				href="likeListPR.do?id=${id}&page=${pagingJobManageVO.pagingVO.currentPage + 1}">다음</a></li>
		</ul>
	</div> --%>
</div>

<%@ include file="../layout/footer.jsp"%>