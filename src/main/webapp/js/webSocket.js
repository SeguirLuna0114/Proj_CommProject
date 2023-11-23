/** 웹소켓 관련 사용자 정의 코드 */

/** 웹 소켓 연결 수립 및 해제 */
var websock;
$(function() {
	$('#message').keypress(function(event) {
		var keycode = event.keyCode ? event.keyCode : event.which;
		if (keycode == 13)
			send();
		event.stopPropagation();
	});
	$('#enterBtn').click(function() {
		connect();
	});
	$('#exitBtn').click(function() {
		disconnect();
	});
	$('#sendBtn').click(function() {
		send();
	});
});

function send() {
	var nickName = $('#nickName').val();
	var msg = $('#message').val();
	websocket.send('msg:' + nickName + ' => ' + msg);
	$('#message').val('');
}

function connect() {
	websock = new WebSocket("ws://localhost:80/webSock/chat-ws.do");
	websock.onopen = onOpen;
//	websock.onclose = onClose;
	websock.onmessage = onMessage;
}

function disconnect() {
	websock.close();
}

function send() {
	var nickname = $('#nickName').val();
	var message = $('#message').val();
	websock.send('msg:' + nickname + ' : ' + message);
	$('#message').val('');
}

function onOpen(event) {
	appendMessage("연결되었습니다.");
}

function onClose(event) {
	appendMessage("연결이 종료되었니다.");
}

function onMessage(event) {
	var data = event.data;
	appendMessage(data);
}

function appendMessage(msg) {
	$('#chatMessageArea').append(msg + "<br>");
	var chatAreaheight = $('#chatArea').height();
	var maxscroll = $('#chatMessageArea').height() - chatAreaheight;
	$('#chatArea').scrollTop(maxscroll);
}