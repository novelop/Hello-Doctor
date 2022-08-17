package kr.or.ddit.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.DoctorRegistCommand;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.service.DoctorService;

@Controller
@RequestMapping("myinfo")
public class MyInformation {

	@Autowired
	DoctorService doctorService;

	@Resource(name="doctorFilePath")
	private String doctorFilePath;


	@RequestMapping("main")
	public String main() {
		String url = "myinfo/main";

		return url;


	}


	@RequestMapping(value="modify",method = RequestMethod.POST, produces ="text/plain;charset=utf-8")
	public String modify( DoctorRegistCommand doctorReq, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/myinfo/main.do";

		System.out.println("modify~~~~"+doctorReq);


		doctorService.docinfomodify(doctorReq, doctorFilePath);

		rttr.addFlashAttribute("modify","success");


		return url;

	}


	@ResponseBody
	@RequestMapping(value = "passmodify",method = RequestMethod.POST)
	public ResponseEntity<String> passmodify(@RequestBody Map<String, Object> map, HttpSession session) throws SQLException{

		ResponseEntity<String> entity= null;

		DoctorVO vo = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = vo.getdId();

		String pwd = (String) map.get("pwd");
		String newpwd= (String) map.get("newpwd");
		String newpwdcheck = (String) map.get("newpwdcheck");

		System.out.println("myinfodId"+dId);
		System.out.println("myinfodoctor"+vo);

		String pwdcheckresult = doctorService.checkpwd(dId,pwd);
		vo.setNewpwd(newpwd);
		vo.setPwd(pwd);

		String newpwdcheckresult = doctorService.docpwdmodify(vo, newpwdcheck);



		if(pwdcheckresult.equals("pwdfail")) {
			entity = new ResponseEntity<String>("pwdfail", HttpStatus.OK);
		}

		if(newpwdcheckresult.equals("pwdsame")) {
			entity = new ResponseEntity<String>("pwdsame", HttpStatus.OK);
		}else if(newpwdcheckresult.equals("newpwdfail")) {
			entity = new ResponseEntity<String>("newpwdfail", HttpStatus.OK);

		}





		System.out.println("비밀번호"+pwd);
		System.out.println("새 비밀번호"+newpwd);
		System.out.println("새 비밀번호확인"+newpwdcheck);


		return entity;




	}

	@ResponseBody
	@RequestMapping(value = "otpmodify",method = RequestMethod.POST )
	public ResponseEntity<String> otpmodify(@RequestBody Map<String, Object> map, HttpSession session  ) throws Exception{

		System.out.println("otpmodify 도착!");

		System.out.println("로그인 선택한 값"+map.get("logincheck"));


		ResponseEntity<String> entity = null;

		DoctorVO vo = (DoctorVO) session.getAttribute("doctorLogin");


		String otpcheck = (String)map.get("logincheck");

		vo.setOtpCheck(otpcheck);

		String otpresult =doctorService.docloginmodify(vo);


		if(otpresult.equals("otpdisabled")) {
			entity = new ResponseEntity<String> ("otpdisabled",HttpStatus.OK);

		}else {
			entity = new ResponseEntity<String> ("otpactivate",HttpStatus.OK);

		}




		return entity;

	}

	@ResponseBody
	@RequestMapping(value = "telmodify",method = RequestMethod.POST )
	public ResponseEntity<String> telmodify (@RequestBody Map<String, Object>map,HttpSession session) throws Exception{

		ResponseEntity<String> entity =null;

		System.out.println("telmodify도착");

		System.out.println(map.get("firsttel"));
		System.out.println(map.get("secondtel"));
		System.out.println(map.get("threetel"));


		String firsttel = (String)map.get("firsttel");
		String secondtel = (String)map.get("secondtel");
		String threetel = (String)map.get("threetel");

		DoctorVO vo = (DoctorVO) session.getAttribute("doctorLogin");

		vo.setTel(firsttel+secondtel+threetel);

		System.out.println("세팅한 전화번호"+vo.getTel());

		doctorService.doctelmodify(vo);

		entity = new ResponseEntity<String>("telmodify",HttpStatus.OK);

		return entity;

	}




}
