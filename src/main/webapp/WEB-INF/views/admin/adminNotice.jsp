<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminNav.css"
	type="text/css">
<style>
.center {
  text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 4px 8px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}
.pagination a:hover:not(.active) {background-color: #ddd;}
.sh {
  text-align: right;
  margin-top : 20px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바 부분 -->
			<c:import url="/WEB-INF/views/admin/adminsidenav.jsp" />

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<form action="notice_delete.do" method="post" id="deleteForm">
					<div
						class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2">공지사항</h1>
						<div class="btn-toolbar mb-2 mb-md-0">
							<div class="btn-group me-2">
								<button type="button" class="btn btn-sm btn-outline-secondary"
									onclick="location='notice_write.do?pageNum=${pageNum}'">글작성</button>
								<button type="button" class="btn btn-sm btn-outline-secondary"
									data-bs-toggle="modal" data-bs-target="#noticeDelete">삭제</button>
							</div>
						</div>
					</div>
					<h2></h2>
					<div class="table-responsive small">
						<table class="table table-sm">
							<thead class="table-primary">
								<tr>
									<td><input type="checkbox" class="form-check-input" id="toggleCheckbox" onchange="toggleAllCheckboxes()"></td>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="n" items="${noticelist}">
									<tr>
										<td><input type="checkbox" class="form-check-input"
											name="selectedNotList" value="${n['NOTNO']}"></td>
										<td>${n['NOTNO']}</td>
										<td><a
											href="admin_notice_read.do?notNo=${n['NOTNO']}&pageNum=${pageNum}&state=cont">
												${n['NOTSUB']}</a></td>
										<td>${n['ADMINNAME']}</td>
										<td><fmt:formatDate value="${n['NOTDATE']}"
												pattern="yyyy-MM-dd" /></td>
										<td>${n['NOTRCOUNT']}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="center">
							<div class="pagination">
								<c:if test="${not empty keyword}">
									<c:if test="${pp.startPage > pp.pagePerBlk }">
										<a href="admin_notice.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</c:if>
									<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
										<c:if test="${pp.currentPage==i}"></c:if>
										<a href="admin_notice.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
									</c:forEach>
									<c:if test="${pp.endPage < pp.pageCount}">
										<a href="admin_notice.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</c:if>
								</c:if>
		
								<!-- 전체 목록의 페이징 처리 -->
								<c:if test="${empty keyword}">
									<c:if test="${pp.startPage > pp.pagePerBlk }">
										<a href="admin_notice.do?pageNum=${pp.startPage - 1}">
										<span aria-hidden="true">&laquo;</span></a>
									</c:if>
									<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
										<c:if test="${pp.currentPage==i}"></c:if>
										<a href="admin_notice.do?pageNum=${i}">${i}</a>
									</c:forEach>
									<c:if test="${pp.endPage < pp.pageCount}">
										<a href="admin_notice.do?pageNum=${pp.endPage + 1}">
										<span aria-hidden="true">&raquo;</span>
										</a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</form>

				<form action="admin_notice.do" class="sh">
					<input type="hidden" name="pageNum" value="1"> <select
						name="search">
						<option value="notSub"
							<c:if test="${search=='notSub'}">selected="selected" </c:if>>제목</option>
						<option value="notText"
							<c:if test="${search=='notText'}">selected="selected" </c:if>>내용</option>
						<option value="subcon"
							<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
					</select> 
					<input type="text" name="keyword">
					<input type="submit" value="확인">
				</form>
			</main>
		</div>
	</div>



	<!-- 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="noticeDelete" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">정말로 삭제하시겠습니까?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">이 작업은 되돌릴 수 없습니다.</div>
				<div class="modal-footer">
					<!-- 'notNo' 값을 JavaScript로 얻어와서 hidden 필드에 설정 -->
					<input type="hidden" id="notNoToDelete" name="notNo">
					<button type="button" class="btn btn-danger"
						onclick="submitDeleteForm()">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function setNotNoToDelete(notNo) {
			// 모달이 열릴 때마다 'notNoToDelete' 필드에 'notNo' 값을 설정
			document.getElementById('notNoToDelete').value = notNo;
		}

		function submitDeleteForm() {
			// 'notNoToDelete' 값을 가져와서 'deleteForm'에 추가
			var notNoToDelete = document.getElementById('notNoToDelete').value;
			document.getElementById('deleteForm').action = 'notice_delete_selected.do?notNo='
					+ notNoToDelete;
			document.getElementById('deleteForm').submit();
		}
	    function toggleAllCheckboxes() {
	        var checkboxes = document.getElementsByName('selectedNotList');
	        var toggleCheckbox = document.getElementById('toggleCheckbox');

	        for (var i = 0; i < checkboxes.length; i++) {
	            checkboxes[i].checked = toggleCheckbox.checked;
	        }
	    }
	</script>
</body>
</html>