package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dao.DoctorDAO;
import kr.or.ddit.util.SentEmailJava;


@Controller
@RequestMapping("mail")
public class MailController {

	@Autowired
	private DoctorDAO doctorDao;

	@RequestMapping("send")
	public String send(String email, String dId) throws EmailException {
		String sendurl = "login/mailForm";

		System.out.println("email"+email);
		System.out.println("did"+dId);


		String url ="http://localhost/ddit/mail/pass?dId="+dId;

		SentEmailJava.mailSend(email,url);

//		System.out.println("mail 전송 !"+email);

		return sendurl;
	}

	@RequestMapping(value = "pass")
	public String pass() throws EmailException {
		String url = "findid/passmodify";



		return url;
	}



	@ResponseBody
	@RequestMapping(value = "passmodify",method = RequestMethod.POST)
	public ResponseEntity<String> passmodify(@RequestBody Map<String,String>map) throws Exception{
		ResponseEntity<String> entity = null;
		String dId = map.get("passId");
		String pwd = map.get("pass");

		Map<String, String> dataMap = new HashMap<String, String>();

		dataMap.put("dId", dId);
		dataMap.put("pwd", pwd);

		try {
		  doctorDao.modifyPass(dataMap);
		  entity = new ResponseEntity<String>("",HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();

		}

		return entity;


	}

}
