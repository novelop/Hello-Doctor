package kr.or.ddit.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ManagerDoctorListVO;
import kr.or.ddit.dto.ManagerNoticeVO;
import kr.or.ddit.exception.OverlapIp;
import kr.or.ddit.service.ManagerService;
import kr.or.ddit.service.MedicineService;
import kr.or.ddit.service.NoticeService;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	ManagerService managerService;

	@Autowired
	MedicineService medicineService;

	@Autowired
	NoticeService noticeService;

	@RequestMapping("/manager")
	public ModelAndView main(ModelAndView mnv) throws Exception{
		String url = "manager/manager";
		Map<String, Object>dataMap = managerService.mainMemberList();
		System.out.println(dataMap);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/med_admin")
	public ModelAndView med_admin(ModelAndView mnv, SearchCriteria cri) throws Exception {
		String url = "manager/med_admin";
		Map<String,Object> dataMap = medicineService.selectAllMedicine(cri);
		mnv.addObject("dList", medicineService.selectUpdateMedicine(cri));
		mnv.addObject("date", medicineService.selectModiDate());
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@ResponseBody
	@RequestMapping("insertDrug")
	public ResponseEntity<Map<String, String>> insertDrug(@RequestBody Map<String, String>map ) throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		medicineService.modifyY(map.get("meNo"));
		return entity;
	}

	@ResponseBody
	@RequestMapping("deleteDrug")
	public ResponseEntity<Map<String, String>> deleteDrug(@RequestBody Map<String, String>map ) throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		medicineService.modifyN(map.get("meNo"));
		return entity;
	}
	@RequestMapping("/medicine")
	public String medicine() {
		String url = "manager/medicine";
		return url;
	}

	@RequestMapping("/doctor")
	public ModelAndView doctor(ModelAndView mnv, String dId) throws Exception{
		String url = "manager/doctor";

		Map<String, Object> dataMap = managerService.doctorListForPage(dId);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/change")
	public ModelAndView change(String dId, ModelAndView mnv) throws Exception{
		String url = "manager/change";
		ManagerDoctorListVO doctorvo = managerService.doctorStatus(dId);
		mnv.addObject("doctorvo", doctorvo);
		mnv.setViewName(url);
		return mnv;
	}
	// 정직
	@ResponseBody
	@RequestMapping("/sus")
	public ResponseEntity<Map<String, String>> sus(@RequestBody Map<String, String> map)throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		ManagerDoctorListVO doctorvo = new ManagerDoctorListVO();
		doctorvo.setdId(map.get("dId"));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		doctorvo.setSusEndDate(format.parse(map.get("susEndDate")));
		doctorvo.setSusStartDate(format.parse(map.get("susStartDate")));

		managerService.susDoctor(doctorvo);
		return entity;
	}
	@ResponseBody
	@RequestMapping("/work")
	public ResponseEntity<Map<String, String>> work(@RequestBody Map<String, String>map)throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		String dId = map.get("dId");
		managerService.workDoctor(dId);
		return entity;
	}
	@ResponseBody
	@RequestMapping("/retire")
	public ResponseEntity<Map<String, String>> retire(@RequestBody Map<String, String>map)throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		ManagerDoctorListVO doctorvo = new ManagerDoctorListVO();
		doctorvo.setdId(map.get("dId"));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		doctorvo.setRetireDate(format.parse(map.get("retireDate")));
		managerService.retireDoctor(doctorvo);
		return entity;
	}
	@RequestMapping("/notice")
	public ModelAndView notice(ModelAndView mnv, SearchCriteria cri) throws Exception{
		String url = "manager/notice";
		Map<String, Object> dataMap = noticeService.selectNoticeForPage(cri);
		System.out.println(dataMap);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/regist")
	public String regist() {
		String url = "manager/regist";
		return url;
	}
	@RequestMapping("/disstatus")
	public String disstatus() {
		String url = "manager/disstatus";
		return url;
	}
	@RequestMapping("/ip_manager")
	public ModelAndView ip_manager(ModelAndView mnv, ManagerDoctorListVO ipCommand, String dId) throws Exception{
		String url = "manager/ip_manager";
//		Map<String, Object> dataMap = managerService.ipListForPage(ipCommand);
//		System.out.println(dataMap);
		ManagerDoctorListVO doctorvo = managerService.doctorStatus(dId);
		List<ManagerDoctorListVO> iplist = managerService.memberIp(dId);
		System.out.println(iplist);
		mnv.addObject("iplist", iplist);
		mnv.addObject("doctorvo", doctorvo);
//		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	// ip 추가
	@ResponseBody
	@RequestMapping("/ip_add")
	public ResponseEntity <Map<String, String>>ip_add(@RequestBody ManagerDoctorListVO doctorvo)throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		List<String> no = doctorvo.getNo();
		for(int i = 0; i < no.size(); i++) {
			doctorvo.setIpNo(no.get(i));
			managerService.ipInsert(doctorvo);
		}

		entity = new ResponseEntity<Map<String,String>>(HttpStatus.OK);
		return entity;
	}
//	// ip삭제
//	@ResponseBody
//	@RequestMapping("/deleteIp")
//	public ResponseEntity<Map<String, String>>deleteI(@RequestBody Map<String, String>map)throws Exception{
//		ResponseEntity<Map<String, String>> entity = null;
//		ManagerDoctorListVO doctorvo = new ManagerDoctorListVO();
//		doctorvo.setIpNo(map.get("ipNo"));
//		doctorvo.setdId(map.get("dId"));
//		managerService.deleteIp(doctorvo);
//		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
//
//		return entity;
//	}


	@RequestMapping("/regist_notice")
	public String registNotice(ManagerNoticeVO noticeVO) throws Exception{
		String url = "redirect:/manager/notice";
		noticeService.insertNotice(noticeVO);

		return url;
	}
	@RequestMapping("/registForm")
	public String registForm() {
		String url = "manager/regist_notice";
		return url;
	}
	@RequestMapping("/notice_detail")
	public ModelAndView notice_detail(String nNo, ModelAndView mnv, ManagerNoticeVO noticeVO) throws Exception{
		String url = "manager/notice_detail";

		noticeVO = noticeService.detailNotice(nNo);
		System.out.println(noticeVO);
		mnv.addObject("noticeVO", noticeVO);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/deleteNotice")
	public String deleteNotice(String nNo)throws SQLException{
		String url = "redirect:/manager/notice";
		noticeService.deleteNotice(nNo);
		return url;
	}

	@RequestMapping("modifyForm")
	public ModelAndView modifyNotice(String nNo, ModelAndView mnv)throws SQLException{
		String url = "manager/notice_modify";
		ManagerNoticeVO noticeVO =  noticeService.detailNotice(nNo);
		mnv.addObject("noticeVO", noticeVO);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("modify")
	public String modify(ManagerNoticeVO noticeVO)throws SQLException{
		String url = "redirect:/manager/notice";
		noticeService.modifyNotice(noticeVO);
		return url;
	}

	@RequestMapping("modifyIpForm")
	public ModelAndView modifyIpForm(String dId, ModelAndView mnv, ManagerDoctorListVO ipCommand)throws Exception{
		String url = "manager/modifyIp";
		ManagerDoctorListVO doctorvo = managerService.doctorStatus(dId);
		List<ManagerDoctorListVO> iplist = managerService.memberIp(dId);
		mnv.addObject("overIp", managerService.overIp(dId));
		mnv.addObject("iplist", iplist);
		mnv.addObject("doctorvo", doctorvo);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("modifyIp")
	public String modifyIp(ManagerDoctorListVO doctorvo, RedirectAttributes rttr)throws Exception{
		String url = "redirect:ip_manager";

			System.out.println(doctorvo.getIpNo2());
			if(doctorvo.getIpNo2() != null) {
				managerService.deleteIp(doctorvo.getdId());
				for(int i = 0; i < doctorvo.getIpNo2().size(); i++) {
					doctorvo.setIpNo(doctorvo.getIpNo2().get(i));
					System.out.println(doctorvo.getIpNo2().size());
					managerService.ipInsert(doctorvo);
					rttr.addAttribute("dId",doctorvo.getdId());

				}
			}
		return url;
	}

//	@RequestMapping("modifyOne")
//	public String modifyOne(ManagerDoctorListVO doctorvo)throws Exception, OverlapIp{
//		String url = "manager/modifyIp";
//		System.out.println(doctorvo.getIpNo2());
//		if(doctorvo.getIpNo2() != null) {
//			managerService.deleteIp(doctorvo.getdId());
//			for(int i = 0; i < doctorvo.getIpNo2().size(); i++) {
//				doctorvo.setIpNo(doctorvo.getIpNo2().get(i));
//				System.out.println(doctorvo.getIpNo2().size());
//				managerService.ipInsert(doctorvo);
//			}
//		}
//		return url;
//	}



	// ip삭제
	@ResponseBody
	@RequestMapping("deleteIp")
	public ResponseEntity<Map<String, String>>dIp(@RequestBody Map<String,String>map)throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		ManagerDoctorListVO doctorVO = new ManagerDoctorListVO();
		doctorVO.setIpNo(map.get("ipNo"));
		doctorVO.setdId(map.get("dId"));
		managerService.ipManagerDeleteIp(doctorVO);
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		return entity;
	}

	@RequestMapping("ip")
	public ModelAndView ip(ManagerDoctorListVO ipvo, ModelAndView mnv)throws Exception{
		String url = "manager/ip";
		Map<String, Object> dataMap = managerService.ipListForPage(ipvo);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;

	}

	@RequestMapping("ip_detail")
	public ModelAndView ip_detail(String ipNo, ModelAndView mnv)throws Exception{
		String url = "manager/ip_detail";
		mnv.addObject("ip", managerService.ipDetail(ipNo));
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("dUpdate")
	public ModelAndView drugUpdateList(ModelAndView mnv, RedirectAttributes rttr)throws Exception{
		String url = "manager/dUpdate";
//		mnv.addObject("dList", medicineService.selectUpdateMedicine(cri));
//		mnv.addObject("cnt", medicineService.modifyMedicine());
//		mnv.addObject("date", medicineService.selectModiDate());
//		rttr.addAttribute("from", "success");
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("update_medi")
	public String update_medi(RedirectAttributes rttr)throws Exception{
		String url = "redirect:med_admin";
		int cnt = medicineService.modifyMedicine();
		String date = medicineService.selectModiDate();
		rttr.addAttribute("from","sucess");
		rttr.addAttribute("cnt",cnt);
		rttr.addAttribute("date",date);
		System.out.println(date);
		return url;
	}
}

