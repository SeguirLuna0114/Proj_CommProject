<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<!-- 좋아요 관련 css -->
<link href="${path}/css/likes.css" rel="stylesheet" />

<script src="${path}/js/like.js"></script>
</head>

<!-- <input id="id" type="hidden" value="{likesListstate.id}"> -->

<div class="container">
	<div class="photosetting">
		<div class="liketitle">♥ 커뮤니티 좋아요한 글</div>

		<!-- for each문 사용해서 좋아요 한 글 반복 출력-->
		<c:forEach var="likes" items="${likesList}">
			<div class="replay_box">
				<div class="full_setting">
					<div class="photocompany">
						<!-- <img src="/img/${comBoard.commFile}" class="img-thumbnail"/>-->
						<!-- 좋아요한 커뮤니티 글로 이동 -->
						<a href="comDetail.do?commNo=${likes.commNo}"><img class="companyphoto" src='https://picsum.photos/250/250' alt="커뮤니티 첨부 이미지"></a>
					</div>
					<div class="company_story">
						<!-- 좋아요 한 글 제목 -->
						<div class="contect_title">${likes.commSub}</div>
						<!-- 좋아요 한 글 세부내용 -->
						<div class="explanation">
							<div class="explanation_text">${likes.commText}</div>
						</div>

						<!-- 작성자 profile이미지 -->
						<div class="company_image">
							<div class="test">
								<!-- 해당 작성자가 커뮤니티에서 작성한 글 리스트 출력 -->
								<a href="comList.do?id=${likes.userId}"><img class="conpany_min_iphoto" src='https://picsum.photos/250/250' alt="작성자 프로필 이미지" width="25"
									height="25"></a> 
								<!-- 작성자 명 -->
								<a class="test2">${likes.userName}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<!-- photosetting-->

<!--container-->


<%@ include file="../layout/footer.jsp"%>