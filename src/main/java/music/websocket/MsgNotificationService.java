package music.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import music.websocket.model.ResponseMessage;

@Service
public class MsgNotificationService {
	
	private final SimpMessagingTemplate msgTemplt;
	
	@Autowired
	public MsgNotificationService(SimpMessagingTemplate msgTemplt) {
		this.msgTemplt = msgTemplt;
	}
	
	// 쪽지 받음 알림 메시지
	public void sendNewMsgNotification() {
		ResponseMessage pushMsg = new ResponseMessage("NewMsg Notification");
		msgTemplt.convertAndSend("/topic/newmsg-notifications", pushMsg);
	}
	
	// 새 유저 메시지
	public void sendGlobalNotification() {
		ResponseMessage pushMsg = new ResponseMessage("Global Notification");
		msgTemplt.convertAndSend("/topic/global-notifications", pushMsg);
	}
	
	// 새로운 지원자 메시지
	public void sendApplicationNotification() {
		ResponseMessage pushMsg = new ResponseMessage("Application Notification");
		msgTemplt.convertAndSend("/topic/application-notifications", pushMsg);
	}
	
	// 글 댓글 작성자 메시지
	public void sendReplyNotification() {
		ResponseMessage pushMsg = new ResponseMessage("Reply Notification");
		msgTemplt.convertAndSend("/topic/reply-notifications", pushMsg);
	}
	
	// 개인 메시지
	public void sendPrivateNotification(String id) {
		ResponseMessage pushMsg = new ResponseMessage("Private Notification");
		msgTemplt.convertAndSendToUser(id, "/topic/private-notifications", pushMsg);
	}

}
