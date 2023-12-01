<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/header.jsp"%>

<head>
  <link href="${path}/css/application_status.css" rel="stylesheet" />

  <script src="${path}/js/writejobstatus.js"></script>
</head>

<div id="wrap">
  <div id="as_wrap">
    <div class="as_menu">
      <p class="as_title">구인 게시판</p>
      <ul>
        <li class="as_proposal">
          <a href="applyStatusAll.do?id=${id}">지원 현황</a>
        </li>
        <li class="as_position">
          <a href="writeJobStatusAll.do?id=${id}">구인 현황</a>
        </li>
      </ul>
    </div>

    <div class="as_contents">
      <div class="as_counts">
        <c:forEach
          var="statusCountVOs"
          items="${jobstatusWaitingVO.statusCountVOs}"
        >
          <div class="as_count_all">
            <a href="writeJobStatusAll.do?id=${id}">
              <p class="as_all_count">${statusCountVOs.jobstatusAll}</p>
              <p class="as_all_text">전체</p>
            </a>
          </div>
          <div class="as_count_c">
            <a href="writeJobStatus.do?id=${id}">
              <p class="as_count">${statusCountVOs.jobstatusCont}</p>
              <p class="as_text">진행중</p>
            </a>
          </div>
          <div class="as_count_final">
            <a href="writeJobStatusFin.do?id=${id}">
              <p class="as_final_count">${statusCountVOs.jobstatusFin}</p>
              <p class="as_final_text">컨택 완료</p>
            </a>
          </div>
        </c:forEach>
      </div>

      <div class="as_search">
        <form
          name="search"
          action="writeJobStatus.do"
        >
          <input
            type="text"
            placeholder="공고 제목 검색"
            name="keyword"
            value="${sessionScope.referer != null ? sessionScope.referer.keyword : ''}"
          />
          <input type="hidden" name="id" value="${jobstatusWaitingVO.userId}" />
          <button class="btn_search" type="submit"></button>
        </form>
      </div>

      <div>
        <table class="as_table">
          <thead>
            <tr>
              <th>공고 제목</th>
              <th>신청자 이름</th>
              <th>모집 마감일</th>
              <th>진행 상태</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach
              var="statusWaitingInfoVOs"
              items="${jobstatusWaitingVO.statusWaitingInfoVOs}"
            >
              <tr>
                <td>
                  <a href="#?jobNo=${statusWaitingInfoVOs.jobNo}"
                    >${statusWaitingInfoVOs.jobSub}</a
                  >
                </td>
                <td>
                  ${statusWaitingInfoVOs.appName}(${statusWaitingInfoVOs.userId})
                </td>
                <td>${statusWaitingInfoVOs.jobEndDate}</td>
                <td>
                  <p class="waiting">대기중</p>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp"%>
