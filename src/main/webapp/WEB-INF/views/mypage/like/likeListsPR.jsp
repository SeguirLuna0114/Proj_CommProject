<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<script src="${path}/js/like.js"></script>
</head>

<div class="wanteds_page">
	<div class="search_wanted">
		<div class="all_position">
			<div class="select_head">포지션 선택</div>
			<div class="select_all">
				<select class="all" id="positionCode" name="positionName" onchange="ChangeValue('positionCode')">
					<option selected>전체</option>
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
			<div class="select_career">
				<select class="career" id="careerCode" name="careerName" onchange="ChangeValue('careerCode')">
					<option selected>신입/경력</option>
					<c:forEach var="allPrDatas" items="${allPrDatas}">
						<option>${allPrDatas.prCareer}</option>
					</c:forEach>
				</select>
			</div>

			<div class="select_region">
				<select class="region" id="regionCode" name="regionName" onchange="ChangeValue('regionCode')">
					<option selected>지역 선택</option>
					<c:forEach var="allPrDatas" items="${allPrDatas}">
						<option>${allPrDatas.prLoc}</option>
					</c:forEach>
				</select>
			</div>

			<div class="select_skill">
				<select class="skill" id="skillsCode" name="skillsName" onchange="ChangeValue('skillsCode')">
					<option selected>해시태그</option>
					<c:forEach var="allPrDatas" items="${allPrDatas}">
						<option>#${allPrDatas.prHash}</option>
					</c:forEach>
				</select>
			</div>

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

			<div class="select_sort">
				<select class="sort">
					<option selected>최신순</option>
					<option>인기순</option>
				</select>
			</div>
		</div>
	</div>

	<div class="overBox">
		<c:if test="${!empty id}">
			<div class="liked">
				<div class="liked_wanted">
					<div class="liked_title">♥ 내가 좋아요한 PR(홍보 글)</div>
					<div class="wanteds">
						<c:forEach var="likesListPR" items="${likesListPR}">
							<div class="wanted">
								<a href="prDetail.do?id=${likesListPR.prNo}">
									<div class="picture">
										<c:choose>
											<c:when test="${empty likesListPR.prFile}">
												<img src="https://picsum.photos/seed/picsum/200/300">
											</c:when>
											<c:otherwise>
												<img src="${path}/upload/${likesListPR.prFile}">
											</c:otherwise>
										</c:choose>
									</div>

									<div class="wanted_text">
										<div class="text">
											<ul>
												<li class="title">
													<h2>${likesListPR.prSub}</h2>
												</li>
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
</div>

<%@ include file="../layout/footer.jsp"%>