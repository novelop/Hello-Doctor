package kr.or.ddit.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.command.SensCommand;
import kr.or.ddit.util.Sendsms;

@Controller
@RequestMapping("sens")
public class SendsmsController {


	@RequestMapping("form")
	public String form() {
		String url = "form";
		return url;
	}

	@RequestMapping("send")
	public String sends(SensCommand sensCommand) {
		Sendsms sendsms = new Sendsms();
		String url = "success";
		String ph = sensCommand.getPh();
		String content = sensCommand.getContent();

		sendsms.sendSMS(ph, content);

		return url;

	}

}
