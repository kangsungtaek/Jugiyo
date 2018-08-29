package pro.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class OrderService {
	
	@Autowired
	Gson gson;
	
	@Autowired
	@Qualifier("ws")
	HashMap<String, WebSocketSession> webSessions;
	
	public void sendToOne(Map data, String target) {
		System.out.println(webSessions);
		
		System.out.println("sendToOne.."+ webSessions.containsKey(target));
		TextMessage msg = new TextMessage(gson.toJson(data));
		if (webSessions.containsKey(target)) {
			try {
				webSessions.get(target).sendMessage(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
