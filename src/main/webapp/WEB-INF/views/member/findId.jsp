<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/member/findid.css" type="text/css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function check() {
		if ($.trim($("#userName").val()) == "") {
			alert("성명을 입력하세요.");
			$("#userName").val("").focus();
			return false;
		}
		if ($.trim($("#userEmail").val()) == "") {
			alert("이메일을 입력하세요.");
			$("#userEmail").val("").focus();
			return false;
		}
	}
</script>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<main class="form-findid w-500 m-auto">
		<c:if test="${empty findid}">
			<form method="post" action="findIdCheck.do" onsubmit="return check()">
				<br>
				<img src="images/184.png" alt="" width="100"
					height="100" onclick="location.href='home.do'" style="cursor: pointer;">
				<br><br>
				<h1 class="h4 mb-3"><b>오브리</b>&nbsp; 아이디 찾기</h1>
				<br>
				<div class="form-floating">
					<input type="text" class="form-control" id="userName"
						name="userName" placeholder="name"> <label for="userName">성명</label>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" id="userEmail"
						name="userEmail" placeholder="email"> <label for="userEmail">이메일</label>
				</div>

				<button class="btn w-100 pr-100 fw-bold" type="submit">아이디
					찾기</button>
			</form>
		</c:if>

		<c:if test="${!empty findid}">
			<h1 class="h4 mb-3 fw-bold" align="center">아이디 찾기 결과</h1>
			<tr>
				<th>조회한 아이디:</th>
				<td>${findid}</td>
			</tr>
			<br><br>
			<button class="btn w-100 pr-100 fw-bold" type="button"
				onclick="location.href='login.do'">확인</button>
		</c:if>

			<p class="mt-5 mb-3 text-body-secondary" align="center"
				style="font-size: 80%">&copy; 2023. 1조</p>

	</main>
</body>
</html>