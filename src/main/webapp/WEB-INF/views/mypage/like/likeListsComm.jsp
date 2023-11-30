<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<!-- 좋아요 관련 css -->
<link href="${path}/css/likes.css" rel="stylesheet" />

<script src="${path}/js/like.js"></script>
</head>

<!-- <input id="id" type="hidden" value="{likesListComm.userId}"> -->

<div class="container">
	<div class="photosetting">
		<div class="liketitle">♥ 커뮤니티 좋아요한 글</div>

		<!-- for each문 사용해서 좋아요 한 글 반복 출력-->
		<c:forEach var="likesComm" items="${likesListComm}">
			<div class="replay_box">
				<div class="full_setting">
					<div class="photocompany">
						<!-- <img src="/img/${likesComm.commFile}" class="img-thumbnail"/>-->
						<!-- 좋아요한 커뮤니티 글로 이동 -->
						<c:choose>
							<c:when test="${empty likesComm.commFile}">
								<!-- 사진이 없는 경우 디폴트 이미지 사용 -->
								<a href="comDetail.do?commNo=${likesComm.commNo}"><img class="companyphoto" src='https://picsum.photos/250/250' alt="커뮤니티 첨부 이미지"></a>
							</c:when>
							<c:otherwise>
								<!-- 업로드한 사진 첨부파일이 있는 경우 -->
								<a href="comDetail.do?commNo=${likesComm.commNo}"><img class="companyphoto" src="${path}/upload/${likesComm.commFile}" alt="커뮤니티 첨부 이미지"></a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="company_story">
						<!-- 좋아요 한 글 제목 -->
						<div class="contect_title">${likesComm.commSub}</div>
						<!-- 좋아요 한 글 세부내용 -->
						<div class="explanation">
							<div class="explanation_text">${likesComm.commText}</div>
						</div>

						<!-- 작성자 profile이미지 -->
						<div class="company_image">
							<div class="test">
								<!-- 해당 작성자가 커뮤니티에서 작성한 글 리스트로 이동 -->
								<c:choose>
									<c:when test="${empty likesComm.prFile}">
										<!-- 사진이 없는 경우 디폴트 이미지 사용 -->
										<a href="comList.do?id=${likesComm.writerId}"><img class="conpany_min_iphoto" src='https://picsum.photos/250/250' alt="작성자 프로필 이미지"
											width="25" height="25"></a>
									</c:when>
									<c:otherwise>
										<!-- 업로드한 사진 첨부파일이 있는 경우 -->
										<a href="comList.do?id=${likesComm.writerId}"><img class="conpany_min_iphoto" src="${path}/upload/${likesComm.prFile}" alt="작성자 프로필 이미지" width="25" height="25"></a>
									</c:otherwise>
								</c:choose>
								
								<!-- 작성자 명(작성자 id) -->
								<a class="test2">${likesComm.writerName}(${likesComm.writerId})</a>
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