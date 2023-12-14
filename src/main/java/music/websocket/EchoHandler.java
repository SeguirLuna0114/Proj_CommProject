//package music.websocket;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.socket.CloseStatus;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.mysql.cj.util.StringUtils;
//
//import music.dao.mypageDao;
//
//@Component
//@RequestMapping("/echo")
//public class EchoHandler extends TextWebSocketHandler{
//
//	// 누가 세션에 접속했는지 추적 -1:1
//	Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
//	// 로그인 한 유저 전체
//	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
//	
//	@Autowired
//	MsgNotificationService notiService;
//	
//	@Autowired
//	SqlSession sqlSession;
//	
//	
//	// 웹 소켓 연결이 종료되고 나서 서버단에서 실행해야할 일들을 정의
//	@Override    
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		System.out.println("afterConnectionClosed "+session+", "+status);
//		
//		// 개별 접속한 사용자Id rmv
//		userSessionMap.remove(session.getId());
//		// 전체 접속자Id rmv
//		sessions.remove(session);
//	}
//	
//	// 웹소켓 연결 직후에 처리
//	@Override  	  
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		System.out.println("Socket 연결");
//		//연결된 세션들을 보관
//		sessions.add(session);
//		
//		// 로그인 한 개별 사용자Id
//		String senderId = getId(session);
//		System.out.println(">>>>>>>>>"+senderId);
//		
//		// userSessionMap에 개별 사용자Id를 넣음
//		userSessionMap.put(senderId, session);
//	}
//	
//	
//	// 세션 로그인 사용자 Id 가져옴
//	private String getId (WebSocketSession session) {
//		Map<String, Object> httpSession = session.getAttributes();
//	    String userId = (String)httpSession.get("userId"); 
//	    if(userId == null) {
//	    	return session.getId();
//	    } else {
//	    	// 로그인 한 유저 반환
//	    	return userId;
//	    }
//	}	
//	
//	
//	// 웹소켓 연결후 서버단(소켓)으로 메세지가 도착했을때 해주어야할 일들을 정의
//	@Override    
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		/** 알림메시지 구현 **/
//		Map<String, Object> httpSession = session.getAttributes();
//		String logInuserId = (String)httpSession.get("userId"); 
//		
//		// 접속한 유저가 있는 경우
//		if(logInuserId != null) {
//			
//			/** 수신자에게 몇개의 메시지가 와있는지 DB에서 검색 **/
//			mypageDao mydao = sqlSession.getMapper(mypageDao.class);
//			System.out.println(message.getPayload());
//			session.sendMessage(new TextMessage(mydao.cntUncheckMsg(logInuserId)));
//			
//			// 해당 사용자 알림 데이터 마지막 데이터만 가져올 경우
////			NotiformVO selLstAlarm = notiService.selLstAlarm(logInuserId);
////			
////			WebSocketSession webSocketSession = userSessionMap.get(logInuserId);
////			
////			ObjectMapper jsonMapper = new ObjectMapper();
////			
////			// 해당 사용자의 알림 데이터 전체 가져오기(JSON으로 전환 후, TextMessage 변환)
////			String json = jsonMapper.writeValueAsString(selLstAlarm);
////			webSocketSession.sendMessage(new TextMessage(json));
//		}
//		
//		// protocol: cmd, 댓글작성자, 게시글작성자, index (reply,user2,user1,234)
//		String msg = message.getPayload();
////		if(msg != null) {
//		if(!StringUtils.isNullOrEmpty(msg)) {
//			String[] strs = msg.split(",");
//			
//			// protocol(cmd, sender, receiver, index)
//			if(strs != null) {
//				String cmd = strs[0];  			// 명령어 유형
//	            String sender = strs[1];  		// 발신인/댓글 작성자
//	            String receiver = strs[2];  	// 알림 받을 사용자ID(수신인/해당 글 작성자)
//	            String index = strs[3];  		// 메시지(-1)/답변 작성된 게시글 번호
//	            
//	            // 알림 받는 유저가 로그인 중인 경우
//	            WebSocketSession receiversession  = userSessionMap.get(receiver);
//	            
//	            // cmd = jobReply : 구인 게시글 댓글인 경우
//	            if("jobReply".equals(cmd) && receiversession != null) {
//	            	TextMessage tmpMsg = new TextMessage(sender + "님이 " + 
//                            "<a type='external' href='job_board_view.do?jobNo="+index+"&pageNum=1'>" 
//	            			+ index + "</a> 번 구인 게시글에 댓글을 남겼습니다.");
//	            	receiversession.sendMessage(tmpMsg);
//	            
//	            // cmd = commReply : 커뮤니티 게시글 댓글인 경우
//	            } else if("commReply".equals(cmd) && receiversession != null) {
//	            	TextMessage tmpMsg = new TextMessage(sender + "님이 " + 
//	            			"<a type='external' href='boardContent.do?commNo="+index+"&pageNum=1'>" 
//	            			+ index + "</a> 번 커뮤니티 게시글에 댓글을 남겼습니다.");
//	            	receiversession.sendMessage(tmpMsg);
//	            
//	            // cmd = message : 쪽지를 보낸 경우
//	            } else if("message".equals(cmd) && receiversession != null) {
//	                TextMessage tmpMsg = new TextMessage(sender + "님이 " +
//                            "<a type='external' href='messagebox_rcv.do?id="+receiver+"'>" 
//	                		+ receiver  + "</a>님에게 쪽지를 보냈습니다.");
//	                receiversession.sendMessage(tmpMsg);	            	
//	            }
//			}
//		}
//	}
//}
