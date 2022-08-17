package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	
	@RequestMapping("indexPage")
	public String indexpage() {
		String url = "/common/indexPage";
		return url;
	}
	
	
	@RequestMapping("common/index")
	public String index() {
		String url = "/main/index";
		return url;
	}
	
}
