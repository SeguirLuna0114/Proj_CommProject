<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/header.jsp"%>

<head>
  <link href="${path}/css/mypage.css" rel="stylesheet" />
  <link href="${path}/css/subscribes.css" rel="stylesheet" />
  <link href="${path}/css/proposal.css" rel="stylesheet" />
  <link href="${path}/css/companypage_recruit_manage.css" rel="stylesheet" />

  <!-- select option에 따른 page shift -->
  <script src="${path}/js/mypageShift.js"></script>
</head>

<div id="wrap">
  <div id="mp_wrap">
    <div class="mypage">
      <p class="mypage_title">My Page</p>

      <div class="mp_info">
        <div class="mp_account">
          <c:forEach var="userInfoVOs" items="${infoAllDto.userInfoVOs}">
            <div class="mp_img"></div>
            <div class="mp_acc">
              <p class="mp_name">${userInfoVOs.userName}</p>
              <p class="mp_call">${userInfoVOs.userPhone}</p>
              <p class="mp_email">${userInfoVOs.userEmail}</p>
            </div>
            <div class="mp_acc_setting">
              <button>
                <a href="accountSetting.do?id=${userInfoVOs.userId}"
                  >계정 설정하기</a
                >
              </button>
            </div>
          </c:forEach>

          <!-- JobBoard에 작성한/지원한 공고 select -->
          <div class="cp_menu">
            <select
              name="cp_option"
              id="cp_option_select"
              onchange="changePage()"
            >
              <option value="applyStatus_main">지원 공고 관리</option>
              <option value="recruitStatus_main" selected="selected">
                작성 공고 관리
              </option>
            </select>
          </div>
        </div>

        <div class="cp_status">
          <c:forEach var="infoCountVOs" items="${infoAllDto.infoCountVOs}">
            <ul>
              <li>
                <a href="writeJobStatusAll.do?id=${principal.id}">
                  <div class="cp_status_li2">구인 현황</div>
                  <div>${infoCountVOs.jobstatusAll}</div>
                </a>
              </li>
              <li>
                <a href="likeListsPR.do?id=${principal.id}">
                  <div class="mp_status_li2">좋아요 한 PR</div>
                  <div>${infoCountVOs.prlikesCount}</div>
                </a>
              </li>
              <!-- 보낸 쪽지함으로 이동 -->
              <li>
                <a href="messagebox_send.do?id=${principal.id}">
                  <div class="mp_status_li3">쪽지함</div>
                  <p class="proposal_notifications"></p>
                  <div>${infoCountVOs.messagesCount}</div>
                </a>
              </li>
              <li>
                <a href="commWroteAll.do?id=${principal.id}">
                  <div class="mp_status_li4">커뮤니티</div>
                  <div>${infoCountVOs.commCountAll}</div>
                </a>
              </li>
            </ul>
          </c:forEach>
        </div>
        <!-- end mp_status -->
      </div>
      <!-- end mp_info -->

      <!-- 작성한 글 관리 -->
      <!-- <div class="btn_proposal">
            <button>
              <a href="./commWroteAll.html">커뮤니티 글 관리</a>
            </button>
          </div>
          <div class="btn_application">
            <button>
              <a href="#">PR 글 관리</a>
            </button>
          </div> -->

      <div class="logout">
        <button>
          <a href="logout.do?id=${principal.id}">로그아웃</a>
        </button>
      </div>
    </div>

    <!-- 본문 내용 -->
    <div class="cp_contents">
      <div class="cp_applications">
        <a
          href="writeJobStatusAll.do?id=${principal.id}"
          class="cp_apply_manage"
        >
          <div class="cp_apply_text">
            <p>지원자 관리 바로가기</p>
            <span>지원/열람/승인한 지원자들을 한 눈에 볼 수 있습니다.</span>
          </div>
          <div class="cp_arrow">></div>
        </a>

        <div class="cp_search">
          <!-- 공고 작성하는 페이지로 이동-->
          <a href="#" class="subtitle_btn"> 구인공고 작성 </a>

          <div class="cp_select">
            <select name="text">
              <option value="#" selected="selected">지역</option>
              <c:forEach var="careersCode" items="${jobLists}">
                <option value="${jobLists.jobplace}">
                  ${jobLists.jobplace}
                </option>
              </c:forEach>
            </select>

            <select name="text" class="select_position">
              <option value="#" selected="selected">포지션</option>
              <c:forEach var="positionCode" items="${jobLists}">
                <option value="${jobLists.jobcd}">${jobLists.jobcd}</option>
              </c:forEach>
            </select>
          </div>
        </div>

        <div class="cp_content_wrapper">
          <c:forEach var="wanteds" items="${jobLists}">
            <div class="cp_content_item">
              <div class="cp_item_top">
                <div class="cp_item_wanted">
                  <!-- 해당 공고로 이동 -->
                  <a href="#" class="cp_wanted_link">
                    <!-- 공고 제목 -->
                    <p class="wanted_title">${jobLists.jobsub}</p>
                    <!-- 공고 세부사항(내용) -->
                    <p class="wanted_discribes">${jobLists.jobtext}</p>
                  </a>
                </div>
                <!-- 공고 진행상태(진행중, 마감) -->
                <div class="cp_item_state">${jobLists.state}</div>
              </div>
              <div class="cp_item_bot">
                <!-- 공고 수정 페이지로 이동 -->
                <a href="#" class="cp_wanted_modify">수정하기</a>
              </div>
            </div>
          </c:forEach>

          <!-- 페이지 설정 -->
          <div class="paging">
            <ul class="pagination">
              <li
                class="page-item-prev${pagingWantedsManage.pagingDto.first ? &quot;hidden&quot; : &quot;&quot;}"
              >
                <a
                  href="mypage_JobBoard.do?id=${id}&page=${pagingWantedsManage.pagingDto.currentPage - 1}"
                  >이전</a
                >
              </li>
              <c:forEach
                var="num"
                begin="${pagingWantedsManage.pagingDto.startPageNum}"
                end="${pagingWantedsManage.pagingDto.lastPageNum}"
              >
                <li
                  class="page-item${pagingWantedsManage.pagingDto.currentPage + 1 == num ? &quot;-select&quot; : &quot;&quot;}"
                >
                  <a href="mypage_JobBoard.do?id=${id}&page=${num-1}">${num}</a>
                </li>
              </c:forEach>
              <li
                class="page-item-next${pagingWantedsManage.pagingDto.last ? &quot;-hidden&quot; : &quot;&quot;}"
              >
                <a
                  href="mypage_JobBoard.do?id=${id}&page=${pagingWantedsManage.pagingDto.currentPage + 1}"
                  >다음</a
                >
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp"%>
