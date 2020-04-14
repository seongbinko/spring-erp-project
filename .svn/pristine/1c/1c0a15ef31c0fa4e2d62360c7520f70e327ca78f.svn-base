package kr.co.jhta.erp.web.socket;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class MessageNotificationSocketHandler extends TextWebSocketHandler {
	private Map<Integer, WebSocketSession> sessions = Collections.synchronizedMap(new HashMap<Integer, WebSocketSession>());
	
	public void alarmMessage(int userNo, String message) {
		try {
			WebSocketSession session = sessions.get(userNo);
			if (session != null) {
				session.sendMessage(new TextMessage(message));
			}
		} catch (Exception e) {
			sessions.remove(userNo);
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.put(getSessionUserId(session), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(getSessionUserId(session));
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		sessions.remove(getSessionUserId(session));
	}
	
	private Integer getSessionUserId(WebSocketSession session) {
		Map<String, Object> attributes = session.getAttributes();
		return (Integer) attributes.get("LOGIN_USER_NO");
	}
}
