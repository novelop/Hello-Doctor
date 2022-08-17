package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("findid")
public class FindId {
	
	@RequestMapping("/")
	public String findid() {
		String url = "findid/findid";
		return url;
	}
	
}
