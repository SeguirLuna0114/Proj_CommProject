<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/header.jsp"%>

<head>
  <link href="${path}/css/application_status_all.css" rel="stylesheet" />

  <script src="${path}/js/applyStatus.js"></script>
</head>


<div id="wrap">
  <div id="asa_wrap">
    <div class="asa_menu">
      <p class="asa_title">구인 게시판</p>
      <ul>
        <li class="asa_position">
          <a href="applyStatusAll.do?id=${id}">지원 현황</a>
        </li>
        <li class="asa_proposal">
          <a href="writeJobStatusAll.do?id=${id}">구인 현황</a>
        </li>
      </ul>
    </div>

    <div class="asa_contents">
      <div class="asa_counts">
        <c:forEach var="statusCountVOs" items="${statusAllVO.statusCountVOs}">
          <div class="asa_count_all">
            <a href="applyStatusAll.do?id=${id}">
              <p class="asa_all_count">${statusCountVOs.appstatusAll}</p>
              <p class="asa_all_text">전체</p>
            </a>
          </div>
          <div class="asa_count_c">
            <a href="applyStatus.do?id=${id}">
              <p class="asa_count">${statusCountVOs.appstatusCont}</p>
              <p class="asa_text">지원 완료</p>
            </a>
          </div>
          <div class="asa_count_final">
            <a href="applyStatusFin.do?id=${id}">
              <p class="asa_final_count">${statusCountVOs.appstatusFin}</p>
              <p class="asa_final_text">최종 컨택</p>
            </a>
          </div>
        </c:forEach>
      </div>

      <div class="asa_search">
        <form name="searchAll" action="applyStatusAll.do?id=${statusAllVO.id}">
          <input
            id="keyword"
            placeholder="공고 제목 검색"
            type="text"
            name="keyword"
            value="${statusAllVO.keyword}"
          />
          <button class="btn_search" type="submit"></button>
        </form>
      </div>

      <div>
        <table class="asa_table">
          <thead>
            <tr>
              <th>공고 제목</th>
              <th>지원 유형</th>
              <th>모집마감일</th>
              <th>진행 상태</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="statusInfoVOs" items="${statusAllVO.statusInfoVOs}">
              <tr>
                <td>
                  <a href="#?jobNo=${statusInfoVOs.jobNo}"
                    >${statusInfoVOs.jobSub}</a
                  >
                </td>
                <td>${statusInfoVOs.jobCd}</td>
                <td>${statusInfoVOs.jobEndDate}</td>
                <td>
                  <c:choose>
                    <c:when test="${statusInfoVOs.appCheck == Y}">
                      <p class="pass">승인</p>
                    </c:when>
                    <c:when test="${statusInfoVOs.appCheck == N}">
                      <p class="fail">불합격</p>
                    </c:when>
                    <c:otherwise>
                      <p class="waiting">대기중</p>
                    </c:otherwise>
                  </c:choose>
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
