package kr.or.ddit.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import kr.or.ddit.dto.MedPicVO;
import kr.or.ddit.service.RegistService;
import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.util.MakeSequence;
import kr.or.ddit.util.Sendsms;
import kr.or.ddit.util.SentEmailJava;

@Controller
@RequestMapping("regist")
public class RegistController {

	@Autowired
	private RegistService service;
	@Resource(name="doctorFilePath")
	private String doctorFilePath;
	@RequestMapping("/")
	public String main() {
		String url="regist/regist";
		return url;
	}

	@RequestMapping("mailform")
	public String mailform() {
		String url ="regist/mailauthe";

		return url;
	}


	@ResponseBody
	@RequestMapping(value="phoneform",method = RequestMethod.POST)
	public ResponseEntity<String> phoneform(@RequestBody Map<String,String> vo, RedirectAttributes rttr) throws Exception{
		ResponseEntity<String> entity = null;

		String res = "";
		String arr[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

		for(int i = 0; i < 5+1; i++) {
			int rnd = (int) (Math.random()*10);
			if(i == 0) {
				if(rnd == 9) continue;
			}
			res += arr[rnd];
		}

		String number =vo.get("number");

		System.out.println("나의 폰번호"+vo.get("number"));

		System.out.println("인증번호"+res );

		Sendsms.sendSMS(number, res);

		entity = new ResponseEntity<String>(res, HttpStatus.OK);


		return entity;

	}

	// 전화번호 인증요청
	@RequestMapping(value ="phonecheck")
	public String  phonecheck() {
		String url  = "regist/phoneCheck";

		System.out.println("btn 클릭시  tel 도착 완료!");


		return url;

	}


	@ResponseBody
	@RequestMapping(value="emailform",method = RequestMethod.POST)
	public ResponseEntity<String> emailform(@RequestBody Map<String,String> vo, RedirectAttributes rttr) throws Exception{
		ResponseEntity<String> entity = null;

		String res = "";
		String arr[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

		for(int i = 0; i < 5+1; i++) {
			int rnd = (int) (Math.random()*10);
			if(i == 0) {
				if(rnd == 9) continue;
			}
			res += arr[rnd];
		}

		String email =vo.get("email");

		System.out.println("나의 이메일"+vo.get("email"));

		System.out.println("이메일 인증번호"+res );

		SentEmailJava.registmailSend(email,res);


		entity = new ResponseEntity<String>(res, HttpStatus.OK);


		return entity;

	}


	// 이메일 인증 요청
	@RequestMapping(value ="emailcheck")
	public String  emailcheck() {
		String url  = "regist/emailcheck";

		System.out.println("btn 클릭시 mail도착 완료!");


		return url;

	}


	@RequestMapping("doctorChart")
	public String doctorChart() {
		String url = "regist/doctorChart";

		return url;
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST , produces ="text/plain;charset=utf-8")
	public String doctorChart(DoctorRegistCommand doctorReq, RedirectAttributes rttr ) throws Exception{
		System.out.println(doctorReq);
		String url = "redirect:../login/loginForm";
		String fileName = null;
			try {
				DoctorVO doctor = doctorReq.toDoctorVO();



				// 프로필 등록
				if (doctorReq.getFile() != null && !doctorReq.getFile().isEmpty()) {
					fileName = MakeFileName.toUUIDFileName(doctorReq.getFile().getOriginalFilename(),
							"&&");

					doctor.setdPic(fileName);
					System.out.println("setdpic~~~!!"+fileName);
					File storedFile = new File(doctorFilePath, fileName);

					storedFile.mkdirs();

					doctorReq.getFile().transferTo(storedFile);

				}else {
					doctor.setdPic("basicprofile.png");
				}

				System.out.println("dname???"+doctor.getdName());
				System.out.println("전공이름"+doctor.getMaName());
				System.out.println("주민번호"+doctor.getResidentNum());
				System.out.println("전화번호"+doctor.getTel());

				System.out.println("doctorvovovo"+doctor);

				rttr.addFlashAttribute("regist","success");

				service.insertDoctor(doctor);

			} catch (Exception e) {
				rttr.addFlashAttribute("regist","fail");
			}


		return url;
	}

	@ResponseBody
	@RequestMapping("major")
	public ResponseEntity<List<String>> major(@RequestBody Map<String,String> vo) throws Exception{
		String word = vo.get("word");
		ResponseEntity<List<String>> entity = null;
		List<String> result = null;

		try {
			result = service.registMajorList(word);
		}catch (Exception e) {
			// TODO: handle exception
		}

		entity = new ResponseEntity<List<String>>(result, HttpStatus.OK);

		return entity;
	}





}
