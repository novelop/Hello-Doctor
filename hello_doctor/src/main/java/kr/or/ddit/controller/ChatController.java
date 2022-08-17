package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("chatForm")
	public String chatForm() {
		String url = "chat/chatForm";
		
		return url;
	}
	
	
}
