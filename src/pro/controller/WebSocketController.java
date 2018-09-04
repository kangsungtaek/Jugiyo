package pro.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import pro.service.OrderService;
import pro.vo.StoreVo;

@Component("alert")
public class WebSocketController extends TextWebSocketHandler {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	Gson gson;
	
	@Autowired
	@Qualifier("ws")
	HashMap<String, WebSocketSession> webSessions;
	
	@Autowired
	OrderService orderService;
 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("??");
		Map<String, Object> attrs = session.getAttributes();
		System.out.println(attrs);
		StoreVo svo = (StoreVo)session.getAttributes().get("storeVo");
		System.out.println("사장님 로그인: " + svo.getName());
		webSessions.put(svo.getId(), session);
		System.out.println(webSessions);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		StoreVo svo = (StoreVo)session.getAttributes().get("storeVo");
		System.out.println("사장님 로그아웃" + svo.getName());
		webSessions.remove(svo.getId(), session);
	}
}
