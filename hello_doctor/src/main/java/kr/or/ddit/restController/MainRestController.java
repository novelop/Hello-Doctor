package kr.or.ddit.restController;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.dao.MainDAO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MainVO;
import kr.or.ddit.service.MainService;

@RestController
@RequestMapping("restmain")
public class MainRestController {

	@Autowired
	private MainService mainService;




	@RequestMapping("mypatient")
 ResponseEntity<Map<String, Object>> mypatient(@RequestBody Map<String, String> map, HttpServletRequest request) throws Exception{

		ResponseEntity<Map<String, Object>> entity = null;
		DoctorVO vo  = (DoctorVO)request.getSession().getAttribute("doctorLogin");
		String dId = vo.getdId();

		Map<String, Object> dataMap = new HashMap<String, Object>();
		String mNo= map.get("mNo");

		System.out.println("mNO"+mNo);

		dataMap=mainService.mainMyPaintDetail(mNo,dId);

		System.out.println("restMain!#~~~~~~~"+dataMap);


		entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);

		return entity;

	}

	@RequestMapping("AllPaintStatus")//아이체크했을때(모든환자들-주치의아닌 환자들 포함)
	public ResponseEntity<List<MainVO>>AllPaintStatus(HttpServletRequest request)throws Exception{
		ResponseEntity<List<MainVO>> entity = null;
		DoctorVO vo  = (DoctorVO)request.getSession().getAttribute("doctorLogin");
		String dId = vo.getdId();


		try {
		List<MainVO> allPaintStatus = mainService.myCodocMno(dId);
		for(MainVO vo2 : allPaintStatus) {
			vo2.setpRnum(vo2.getpRnum().substring(0,8));
		}

		System.out.println("allPainStatus"+allPaintStatus);
		entity = new ResponseEntity<List<MainVO>>(allPaintStatus,HttpStatus.OK);
		}catch(Exception e) {
			entity= new ResponseEntity<List<MainVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping("MyPaintStatus")//아이체크 풀었을 때!
	public ResponseEntity<List<MainVO>> MyPaintStatus(HttpServletRequest request)throws Exception{
		ResponseEntity<List<MainVO>> entity = null;

		DoctorVO vo  = (DoctorVO)request.getSession().getAttribute("doctorLogin");
		String dId = vo.getdId();

		Map<String, Object> dataMap = null;

		// 홈에서 나의 환자 상태 리스트 출력..
		try{
			dataMap= mainService.mainMyPaintStatus(dId);
		List<MainVO> myPaintList= (List<MainVO>) dataMap.get("myPaintList");


		entity  = new ResponseEntity<List<MainVO>>(myPaintList,HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<List<MainVO>>(HttpStatus.BAD_REQUEST);
		}


		return entity;
	}

	// 특이사항 읽음 여부
	@RequestMapping(value = "ynchange", method = RequestMethod.POST)
	public ResponseEntity<String> ynchange(@RequestBody Map<String, String> map,HttpServletRequest request) throws Exception{
		System.out.println("ynchange 도착!!!!!");
		ResponseEntity<String> entity = null;

		DoctorVO vo  = (DoctorVO)request.getSession().getAttribute("doctorLogin");
		MainVO mainvo = new MainVO();
		String dId = vo.getdId();

		System.out.println("issNO!@!#@!"+map.get("issNo"));

		String issNo =map.get("issNo");

		mainvo.setIssNo(issNo);
		mainvo.setdId(dId);

		mainService.issueYnChange(mainvo);


		entity = new ResponseEntity<String>("N",HttpStatus.OK);


		return entity;
	}

}
