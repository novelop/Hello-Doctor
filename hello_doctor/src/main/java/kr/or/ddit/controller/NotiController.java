package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.service.CaseReplyService;
import kr.or.ddit.service.NotiService;
import kr.or.ddit.util.HttpSessionConfigurator;


@Controller
@ServerEndpoint(value = "/notiSocket", configurator = HttpSessionConfigurator.class)
public class NotiController {

	private static final List<Session> sessionList = new ArrayList<Session>();


	@OnOpen  // socket 연결 시
	public void onOpen(Session session){
		System.out.println("open session : " + session.getId());
		try{
			final Basic basic = session.getBasicRemote();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}




	@OnMessage
	public void onMessage (String message, Session session){
		try {
			//메세지 보낸 사람에게 표시됨
			final Basic basic = session.getBasicRemote();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// 다른 사람에게 메세지 보내기
		sendAllSessionToMessage(session,message);
	}

	@OnError
	public void onError(Throwable e, Session session){
		System.out.println(e.getMessage() + "by session : " + session.getId());
	}
	@OnClose
	public void onClose(Session session){
		System.out.println("Session : "+ session.getId() + " closed");
		sessionList.remove(session);
	}

	private void sendAllSessionToMessage(Session self,String msg){ // 연결된 모든 사용자에게 메세지 전달
		try {
			for(Session s : NotiController.sessionList){
				if(!self.getId().equals(s.getId())){
					s.getBasicRemote().sendText(msg);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
