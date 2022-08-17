package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.PatientVO;
import kr.or.ddit.dto.ReservationVO;
import kr.or.ddit.dto.SubTaskVO;
import kr.or.ddit.service.PatientService;

@Controller
@RequestMapping("patient")
public class PatientController {

	@Autowired
	private PatientService patientService;


	@RequestMapping("main")
	public String main(Model model) throws Exception {
		String url = "patient/main";

		List<PatientVO> patientList = patientService.selectAllPatient();
		model.addAttribute("patient", patientList);
		return url;
	}
	@RequestMapping("registForm")
	public String registForm() throws Exception {
		String url = "patient/registForm";

		return url;
	}
	@RequestMapping("patientRegist")
	public String patientRegist(PatientVO vo,Model model) throws Exception {
		String url ="patient/registForm";

		patientService.insertPatient(vo);
		model.addAttribute("from", "regist");
		return url;
	}
	@RequestMapping("reservationForm")
	public String reservationForm(String pNo,Model model) throws Exception {
		String url ="patient/reservationForm";

		List<DoctorVO> doctorList = patientService.selectAllDoc();

		model.addAttribute("pNo", pNo);
		model.addAttribute("doctor", doctorList);
		return url;
	}
	@RequestMapping("reserveRegist")
	public String reserveRegist(ReservationVO vo,Model model) throws Exception {
		String url ="patient/reservationForm";
		System.out.println("reservation"+ vo);
		patientService.reserveMed(vo);

		model.addAttribute("from", "regist");

		return url;
	}
	@RequestMapping("labotaryForm")
	public String labotaryForm(Model model) throws Exception {
		String url ="patient/labotaryForm";

		List<SubTaskVO> list = patientService.selectAllSubTask();

		model.addAttribute("subTask", list);

		return url;
	}
	@ResponseBody
	@RequestMapping("labotaryRegist")
	public ResponseEntity<String> labotaryRegist(@RequestBody Map<String,String> map) throws Exception {
		ResponseEntity<String>  entity = null;
		String subNo = map.get("subNo");
		patientService.completeSubTask(subNo);
		entity = new ResponseEntity<String>(HttpStatus.OK);

		return entity;
	}




}
