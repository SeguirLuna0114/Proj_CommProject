package music.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import music.websocket.model.ResponseMessage;

@Service
public class WSService {
	
	private final SimpMessagingTemplate messagingTemplate;
	private final MsgNotificationService msgNotificationService;
	
	@Autowired
	public WSService(SimpMessagingTemplate messagingTemplate,
					 MsgNotificationService msgNotificationService) {
		this.messagingTemplate = messagingTemplate;
		this.msgNotificationService = msgNotificationService;
	}
	
    public void notifyFrontend(final String message) {
        ResponseMessage response = new ResponseMessage(message);
        msgNotificationService.sendGlobalNotification();

        messagingTemplate.convertAndSend("/topic/messages", response);
    }

    public void notifyUser(final String id, final String message) {
        ResponseMessage response = new ResponseMessage(message);

        msgNotificationService.sendPrivateNotification(id);
        messagingTemplate.convertAndSendToUser(id, "/topic/private-messages", response);
    }	

}
