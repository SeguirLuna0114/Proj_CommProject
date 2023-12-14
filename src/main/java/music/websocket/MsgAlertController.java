package music.websocket;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import music.websocket.model.ResponseMessage;
import music.websocket.model.Message;

@Controller
public class MsgAlertController {
	
	@Autowired
	private MsgNotificationService notifService;

	
	// 새로운 쪽지함 알림 메시지
    @MessageMapping("/newmsgalarm")
    @SendTo("/topic/newmsg")
    public ResponseMessage getNewMsgAlarm(final Message message) throws InterruptedException {
    	Thread.sleep(1000);
    	notifService.sendGlobalNotification();
    	
    	notifService.sendNewMsgNotification();
        return new ResponseMessage("새로운 쪽지를 받았어요!</br>지금 쪽지함에서 확인해보세요!");
    }	
	
	// 새 유저 메시지
	@MessageMapping("/firstAlarmToNewUser")
	@SendTo("/topic/all")
	public ResponseMessage getFirstAlarm(final Message message) throws InterruptedException {
		Thread.sleep(1000);
		notifService.sendGlobalNotification();
		return new ResponseMessage("환영합니다!</br>새로운 공고를 확인해보세요!");
//		return new ResponseMessage(HtmlUtils.htmlEscape(message.getMessageContent()));
	}
	
	
	// 새로운 공고 지원자
    @MessageMapping("/applicationalarm")
    @SendTo("/topic/application")
    public ResponseMessage getApplicationAlarm(final Message message) throws InterruptedException {
    	Thread.sleep(1000);
    	notifService.sendGlobalNotification();
    	
    	notifService.sendApplicationNotification();
        return new ResponseMessage("새로운 지원자가 있어요!</br>지금 구인현황 페이지를 확인해보세요!");
    }
    
    
    // 새로운 댓글 작성자
    @MessageMapping("/replyalarm")
    @SendTo("/topic/reply")
    public ResponseMessage getReplyAlarm(final Message message) throws InterruptedException {
    	Thread.sleep(1000);
    	notifService.sendGlobalNotification();
    	
    	notifService.sendReplyNotification();
    	return new ResponseMessage("작성한 게시글에 댓글이 달렸어요!");
    }
    
    
    // 개인 메시지
    @MessageMapping("/private-message")
    @SendToUser("/topic/private-messages")
    public ResponseMessage getPrivateMessage(final Message message,
    										 HttpSession httpSession) throws InterruptedException {
    	Thread.sleep(500);	// 딜레이 0.5초(시뮬레이션)
    	String logInUserId = (String) httpSession.getAttribute("userId");
    	
    	// 프라이빗 알림
    	notifService.sendPrivateNotification(logInUserId);
    	
    	System.out.println(logInUserId+"<<-- 사용자에게, 프라이빗 메시지 컨트롤러 : " + message.getMessageContent());
    	
    	// 클라이언트에게 보낼 응답 메시지 객체에 이스케이핑한 메시지 내용 저장해 반환
        return new ResponseMessage(
        		HtmlUtils.htmlEscape(
                "Sending private message to user " + logInUserId + " : " + message.getMessageContent())
        );
    }

}
