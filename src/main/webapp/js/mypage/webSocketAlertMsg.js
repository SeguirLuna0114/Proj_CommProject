// 소켓 전역변수 선언
var socket = null;

$(document).ready(function () {
  // WebSocket 연결 함수 호출
  connectWs();

  // 시작 후 0.3초 후 알림 데이터 가져오기
  setTimeout(() => {
    sock.send("${id}");
  }, 300);

  // 5초마다 알림데이터 가져오기
  setInterval(() => {
    sock.send("${id}");
  }, 5000);
});

function getContextPath() {
  var hostIndex = location.href.indexOf(location.host) + location.host.length;
  return location.href.substring(
    hostIndex,
    location.href.indexOf("/", hostIndex + 1)
  );
}

function connectWs() {
  // SockJS를 사용하여 WebSocket 연결
  //sock = new SockJS("/echo");
  sock = new SockJS(getContextPath() + "/echo");
  socket = sock;

  // 이벤트 리스너(커넥션이 연결되었을 경우에 서버 호출됨)
  sock.onopen = function () {
    console.log("웹소켓 연결 info: connection opened.");
  };

  // 메시지 보냈을 경우 호출
  sock.onmessage = function (evt) {
    var data = evt.data;
    console.log("ReceivMessage : " + data + "\n");
    if (data != "null") {
      const obj = JSON.parse(data);
      // 알림 마지막 데이터
      alarmData(obj);
    } else {
      $(".messages").hide();
    }
  };

  // Ajax를 사용하여 서버에 알림 카운트 요청
  $.ajax({
    url: "countAlarm.do",
    type: "POST",
    dataType: "text",
    success: function (data) {
      if (data == "0") {
        // 알림이 없는 경우
      } else {
        // 알림이 있는 경우, 화면에 알림 카운트 표시
        $("#alarmCountSpan").addClass("bell-badge-danger bell-badge");
        $("#alarmCountSpan").text(data);
      }
    },
    error: function (err) {
      alert("에러 발생 :" + err);
    },
  });

  // 모달 알림
  var toastTop = app.toast.create({
    text: "알림 : " + data + "\n",
    position: "top",
    closeButton: true,
  });
  toastTop.open();
}

// 서버가 끊긴 경우 호출
sock.onclose = function () {
  console.log("connect close");
  /* setTimeout(function(){conntectWs();} , 1000); */
};

// 에러 발생한 경우 호출
sock.onerror = function (err) {
  console.log("Errors : ", err);
};

// 모달창에서 '보내기' 버튼 클릭 시(prDetail.jsp)
function messageAlarmSnd() {
  // let userId = '${map['USERID']}';
  let sender = '<%=request.getAttribute("id")%>';
  var receiver = $("#recvId").val();

  // 알림 메시지 데이터 형식
  var AlarmData = {
    myAlarm_senderUserId: sender,
    myAlarm_receiverUserId: receiver,
    myAlarm_content: sender + "님이 메시지를 보냈습니다.",
  };
  //스크랩 알림 DB저장
  $.ajax({
    type: "post",
    url: "saveMsgAlarm.do",
    data: JSON.stringify(AlarmData),
    contentType: "application/json; charset=utf-8",
    dataType: "text",
    success: function (data) {
      console.log("메시지 작성 protocol(cmd, sender, receiver, index)");
      if (socket) {
        let socketMsg = "message," + sender + "," + receiver;
        console.log("socketmsg : " + socketMsg);
        socket.send(socketMsg);
      }
    },
    error: function (err) {
      console.log("메시지 작성 중 에러 발생 : " + err);
    },
  });
}
