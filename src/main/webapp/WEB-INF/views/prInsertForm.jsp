<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    
    <title>홍보 입력 폼 게시판</title>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Bootstrap core CSS -->
<%-- 	<link href="${path}/css/bootstrap.min.css" rel="stylesheet"> --%>
	<script type="text/javascript">
	
	// 	validation check
	function pr_check() {
		
	}
	
	
	</script>
	

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      
      #pr_sub::placeholder{
    	color: #D2E1FF; /* 원하는 색상으로 변경하세요 */
	  }

	  .col-md-7.col-lg-8 {
    	margin: 0 auto; /* 왼쪽과 오른쪽 마진을 자동으로 설정하여 가운데 정렬합니다. */
    	float: none;    /* 부가적으로 float를 해제합니다. */
	  }
	  
	  .pr_file1 {
 	   /* .pr_file1 클래스에만 적용할 스타일을 여기에 추가하세요 */
	    padding-left: 8px; /* 왼쪽 패딩 설정 */
    	padding-top: 4px;  /* 위쪽 패딩 설정 */
       /* 추가적인 스타일을 필요에 따라 정의하세요 */
	  }
	  
	  .pr_fileImage{
	  
	  }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="${path}/css/form-validation.css" rel="stylesheet">
    
</head>

<body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <p class="lead">자신의 정보를 입력하여 자신을 홍보하세요.</p>
    </div>

    <div class="row g-5">
      <div class="col-md-7 col-lg-8">
        <form action ="pr_insert_ok.do" method="post" onsubmit="return pr_check()" enctype="multipart/form-data">
          <div class="row g-3">
          	<div class="container-md">
          		<label for="pr_sub" class="form-label">글제목</label>
          		<input type="text" class="form-control" id="pr_sub" name="pr_sub" placeholder="나를 한마디로 표현해봐"  required>
          	</div>
            <div class="col-sm-6">
              <label for="pr_career" class="form-label">경력</label>
              <input type="text" class="form-control" id="pr_career" name="pr_career" required>
<!--               <div class="invalid-feedback"> -->
<!--                 Valid first name is required. -->
<!--               </div> -->
            </div>

            <div class="col-sm-6">
              <label for="pr_loc" class="form-label">지역</label>
              <input type="text" class="form-control" id="pr_loc" name="pr_loc" required>
<!--               <div class="invalid-feedback"> -->
<!--                 Valid last name is required. -->
<!--               </div> -->
            </div>
            
            <div class="col-12"> <!-- mb-3 -->
  				<label for="formFile" class="form-label pr_fileImage">이미지 업로드</label>
  				<input class="form-control pr_file1" type="file" id="pr_file1" name="pr_file1">
			</div>
			
			<div class="col-12">			
				<div class="form-floating">
  					<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="pr_text" style="height: 250px"></textarea>
  					<label for="floatingTextarea2">Comments</label>
				</div>
			</div>
			
            <div class="col-12">
              <div class="input-group has-validation">
                <span class="input-group-text">#</span>
                <input type="text" class="form-control" id="pr_hash" name="pr_hash" placeholder="해쉬태그는 최대 5개 까지만 등록 가능합니다." required>
              </div>
            </div>

            <div class="col-12">
              <label for="youtube" class="form-label">유튜브링크</label>
              <input type="text" class="form-control" id="pr_video" name="pr_video" placeholder="ex) https://www.youtube.com/watch?v=7ou0pne7EfY 링크를 넣습니다.">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

          <button class="w-100 btn btn-primary btn-lg" type="submit">등록하기</button>
        </form>
      </div>
    </div>
  </main>

<!--   <footer class="my-5 pt-5 text-muted text-center text-small"> -->
<!--     <p class="mb-1">&copy; 2017–2021 Company Name</p> -->
<!--     <ul class="list-inline"> -->
<!--       <li class="list-inline-item"><a href="#">Privacy</a></li> -->
<!--       <li class="list-inline-item"><a href="#">Terms</a></li> -->
<!--       <li class="list-inline-item"><a href="#">Support</a></li> -->
<!--     </ul> -->
<!--   </footer> -->
</div>

    <script src="${path}/js/form-validation.js"></script>

</body>
</html>