var stompClient = null;
// header 알림 message태그
let headerAlarmCnt = 0;
// 읽지 않은 메시지 수
let newmsgAlarmCnt = 0;
// 구인 공고 지원자 수
let applicationAlarmCnt = 0;

$(document).ready(function () {
  console.log("This page is ready");

  connect();

  // 메시지 알림 보내기 설정
  $(".btn_proposal").click(function () {
    sendNewMsgAlarm();
  });

  // 구인현황알림 메시지
  $(".btn_application").click(function () {
    sendApplicationAlarm();
  });

  // 새 댓글 알림 메시지
  $(".btn_rply").click(function () {
    sendReplyAlarm();
  });

  // 개인 메시지
  $("#send-private").click(function () {
    sendPrivateMessage();
  });

  $(".notifications").click(function () {
    resetHeaderNotificationCount();
  });

  $(".proposal_notifications").click(function () {
    resetProposalNotificationCount();
  });

  $(".application_notifications").click(function () {
    resetApplicationNotificationCount();
  });
});

function connect() {
  let socket = new SockJS("/mypage-websocket");
  stompClient = Stomp.over(socket);
  stompClient.connect({}, function (frame) {
    console.log("Connected: " + frame);

    updateHeaderNotificationDisplay();
    updateProposalNotificationDisplay();
    updateApplicationNotificationDisplay();

    /* 메시지 내용을 파싱하고, 해당 태그 내용을 보이게 설정 */
    // 새 유저 메시지
    stompClient.subscribe("/topic/all", function (message) {
      showMessage(JSON.parse(message.body).content);
    });

    // 새로운 쪽지함 알림 메시지
    stompClient.subscribe("/topic/newmsg", function (message) {
      showMessage(JSON.parse(message.body).content);
    });

    // 새로운 공고 지원자 알림 메시지
    stompClient.subscribe("/topic/application", function (message) {
      showMessage(JSON.parse(message.body).content);
    });

    // 새로운 댓글 작성자 알림 메시지
    stompClient.subscribe("/topic/reply", function (message) {
      showMessage(JSON.parse(message.body).content);
    });

    // 개별 메시지
    stompClient.subscribe("/user/topic/private-messages", function (message) {
      showMessage(JSON.parse(message.body).content);
    });

    /* 알림 횟수를 증가시킴(알림 횟수 업데이트) */
    // header의 알림 카운트 증가
    stompClient.subscribe("/topic/global-notifications", function () {
      headerAlarmCnt = headerAlarmCnt + 1;
      updateHeaderNotificationDisplay();
    });

    // 새로운 메시지 수 알림
    stompClient.subscribe("/topic/newmsg-notifications", function () {
      newmsgAlarmCnt = newmsgAlarmCnt + 1;
      updateProposalNotificationDisplay();
    });

    // 구인공고 지원자 수 알림
    stompClient.subscribe("/topic/application-notifications", function () {
      applicationAlarmCnt = applicationAlarmCnt + 1;
      updateApplicationNotificationDisplay();
    });

    // 개인 메시지
    stompClient.subscribe(
      "/user/topic/private-notifications",
      function (message) {
        headerAlarmCnt = headerAlarmCnt + 1;
        updateHeaderNotificationDisplay();
      }
    );
  });
}

// 알림 메시지를 화면에 표시(header 알림창)
function showMessage(message) {
  $(".messages").append("<p>" + message + "</p>");
}

/* 메시지 보내기 설정 */
// 새 유저 메시지
function sendFirstAlarm() {
  console.log("sending first alarm");
  stompClient.send("/ws/firstAlarmToNewUser");
}

// 읽지 않은 메시지
function sendNewMsgAlarm() {
  console.log("sending new message alarm");
  stompClient.send("/ws/newmsgalarm");
}

function sendApplicationAlarm() {
  console.log("sending application alarm");
  stompClient.send("/ws/applicationalarm");
}

function sendReplyAlarm() {
  console.log("sending reply alarm");
  stompClient.send("/ws/replyalarm");
}

function sendPrivateMessage() {
  console.log("sending private message");
  stompClient.send(
    "/ws/private-message",
    {},
    JSON.stringify({ messageContent: $("#private-message").val() })
  );
}

// header에 알림 수 class 숨김/보임 처리
function updateHeaderNotificationDisplay() {
  if (headerAlarmCnt == 0) {
    $(".notifications").hide();
  } else {
    $(".notifications").show();
    $(".notifications").text(headerAlarmCnt);
  }
}

// 쪽지함 알림 수 class 숨김/보임 처리
function updateProposalNotificationDisplay() {
  if (newmsgAlarmCnt == 0) {
    $(".proposal_notifications").hide();
  } else {
    $(".proposal_notifications").show();
    $(".proposal_notifications").text(newmsgAlarmCnt);
  }
}

// 구인현황 수 class 숨김/보임 처리
function updateApplicationNotificationDisplay() {
  if (applicationAlarmCnt == 0) {
    $(".application_notifications").hide();
  } else {
    $(".application_notifications").show();
    $(".application_notifications").text(applicationAlarmCnt);
  }
}

/* 알림 cnt API */
function updateUnreadMessageCount() {
  $.ajax({
    type: "GET",
    url: "/api/unreadMessageCount",
    data: { userId: "yourUserId" }, // 실제 사용자 ID로 변경
    success: function (data) {
      newmsgAlarmCnt = data;
      updateProposalNotificationDisplay();
    },
    error: function (error) {
      console.error("Error fetching unread message count:", error);
    },
  });
}

/* 알림 cnt 초기화 */
function resetHeaderNotificationCount() {
  headerAlarmCnt = 0;
  updateHeaderNotificationDisplay();
}

function resetProposalNotificationCount() {
  newmsgAlarmCnt = 0;
  updateProposalNotificationDisplay();
}

function resetApplicationNotificationCount() {
  applicationAlarmCnt = 0;
  updateApplicationNotificationDisplay();
}
