package music.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mysql.cj.util.StringUtils;

import music.dao.mypageDao;
import music.model.memberVO;

@Repository
public class EchoHandler extends TextWebSocketHandler{

	// WebSocket 세션과 사용자 이름을 매핑(누가 세션에 접속했는지 추적) -1:1
	Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	// 로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	
	// 웹 소켓 연결이 종료되고 나서 서버단에서 실행해야할 일들을 정의
	@Override    
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed "+session+", "+status);
		
		userSessionMap.remove(session.getId());
		sessions.remove(session);
	}
	
	// 웹소켓 연결 직후에 처리
	@Override  	  
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		
		String senderId = session.getId();
		String senderEmail = getEmail(session);
		
		userSessionMap.put(session.getId(), session);
	}
	
	// 웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		memberVO loginUser = (memberVO)httpSession.get("memberVO");
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getUserEmail();
		}
	}
	
	
	// 웹소켓 연결후 서버단(소켓)으로 메세지가 도착했을때 해주어야할 일들을 정의
	@Override    
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 모든 유저에게 보냄
//		for (WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderNickname + ": "+message.getPayload()));
//		}
		
		// message.getPayload()함수 : 메시지에 담긴 텍스트값을 얻을 수 있음
		System.out.println(session.getId()+"가 보낸 메시지: "+message.getPayload());
		
		String msg = message.getPayload();
		if(!StringUtils.isNullOrEmpty(msg)) {
			String[] strs = msg.spl
		}
		
		// dao.count_receive_note 함수 : 수신자의 닉네임을 통해서 수신함에서 현재 수신자에게 몇개의 쪽지가 와있는지를 카운트
		
		// 인터페이스에 정의된 메소드들을 구현한 객체를 가져옴
		mypageDao dao = sqlsession.getMapper(mypageDao.class);
		
		session.sendMessage(new TextMessage(dao.cntMgsAlert(message.getPayload()))); 
	}
}
