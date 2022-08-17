package kr.or.ddit.restController;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.SchedulerVO;
import kr.or.ddit.dto.SchedulerVO2;
import kr.or.ddit.service.SchedulerService;

@RestController
@RequestMapping("/scheduler")
public class SchedulerRestController {

	HttpSession session = null;
	@Autowired
	private SchedulerService service;

	//협진스케줄러 오른쪽
	@RequestMapping(value="/schedulerMain")
	public ResponseEntity<List<SchedulerVO>> CooperationScheduler(HttpSession session) throws Exception{
		ResponseEntity<List<SchedulerVO>> entity = null;
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctorVO.getdId();
		List<SchedulerVO> list = service.Cooperation(dId);

		entity	= new ResponseEntity<List<SchedulerVO>>(list, HttpStatus.OK);

		return entity;

	}
	@RequestMapping(value="/CoScheduler")
	public ResponseEntity<List<SchedulerVO2>> CoScheduler( @RequestBody Map<String,String> map) throws Exception{
		ResponseEntity<List<SchedulerVO2>> entity = null;
		String coNo = map.get("coNo");
		List<SchedulerVO2> list = service.selectCoScheduler(coNo);
		System.out.println("contorller"+list);
		entity	= new ResponseEntity<List<SchedulerVO2>>(list, HttpStatus.OK);
		return entity;

	}
	@RequestMapping(value="/selectMyCoScheduler")
	public ResponseEntity<List<SchedulerVO2>> selectMyCoScheduler( @RequestBody Map<String,String> map, HttpSession session) throws Exception{
		ResponseEntity<List<SchedulerVO2>> entity = null;
		SchedulerVO vo = new SchedulerVO();
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctorVO.getdId();
		String coNo = map.get("coNo");
		vo.setdId(dId);
		vo.setCoNo(coNo);
		List<SchedulerVO2> list = service.selectMyCoScheduler(vo);
		System.out.println("contorller"+list);
		entity	= new ResponseEntity<List<SchedulerVO2>>(list, HttpStatus.OK);
		return entity;

	}
	@RequestMapping("/delete")
	public String delete(@RequestBody List<Map<String,Object>>param) throws Exception{
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",Locale.KOREA);

		String url = "scheduler/delete";
		return url;
	}
	@RequestMapping("/searchselectbox")
	public ResponseEntity<List<CoMedVO>> searchselectbox(@RequestBody Map<String,String> map, HttpSession session ) throws Exception{
		ResponseEntity<List<CoMedVO>> entity	 = null;

		DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctorVO.getdId();
		String pName = map.get("pName");
		CoMedVO vo = new CoMedVO();
		vo.setdId(dId);
		vo.setpName(pName);

		List<CoMedVO> list = service.searchselectbox(vo);
		entity = new ResponseEntity<List<CoMedVO>>(list , HttpStatus.OK);
		return entity;
	}


}
