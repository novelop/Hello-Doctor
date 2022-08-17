package kr.or.ddit.restController;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.command.OtherDoctorCommand;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;
import kr.or.ddit.dto.ReserveHistoryVO;
import kr.or.ddit.service.CooperMainService;
import kr.or.ddit.service.CooperMyService;
import kr.or.ddit.service.DoctorService;
import kr.or.ddit.service.MediRecoService;

@RestController
@RequestMapping("cooperation")
public class CooperationRestController {

	@Resource(name="doctorFilePath")
	private String doctorFilePath;


	@Resource(name="recoFilePath")
	private String recoFilePath;

	@Autowired
	private MediRecoService mediRecoService;
	@Autowired
	private CooperMyService myService;
	@Autowired
	private CooperMainService mainService;

	@Autowired
	private DoctorService doctorService;

//의료진 사진 얻기
	@RequestMapping("getPic")
	public  ResponseEntity<byte[]> getPic(String dPic)throws Exception{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		try {
			System.out.println(doctorFilePath);
			in = new FileInputStream(new File(doctorFilePath, dPic));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {

			in.close();
		}
		return entity;
	}


	@RequestMapping("getChartPic")
	public  ResponseEntity<byte[]> getChartPic(String mpNo)throws Exception{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		try {
			System.out.println();
			System.out.println(mpNo);
			String temp = mediRecoService.getPic(mpNo);
			in = new FileInputStream(new File(recoFilePath,temp ));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {

			in.close();
		}
		return entity;
	}


	@RequestMapping("/historySearch")
	public ResponseEntity<List<ReserveHistoryVO>> historySearch(HttpServletRequest request, String coNo,String date)throws Exception{
		ResponseEntity<List<ReserveHistoryVO>> entity = null;
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("coNo", coNo);
		map.put("taDate", date);
		List<ReserveHistoryVO> historyList = myService.selectDateHistory(map);
		System.out.println("historyVO"+historyList);
		if(historyList .isEmpty() || historyList == null) {
			entity = new ResponseEntity<List<ReserveHistoryVO>>(HttpStatus.BAD_REQUEST);
		}else {
		entity = new ResponseEntity<List<ReserveHistoryVO>>(historyList,HttpStatus.OK);
		}

		return entity;
	}

	@RequestMapping("/restartHistory")
	public ResponseEntity<List<ReserveHistoryVO>> restartHistory(HttpServletRequest request, String coNo)throws Exception{
		ResponseEntity<List<ReserveHistoryVO>> entity = null;
		// 진료히스토리 구하기
				List<ReserveHistoryVO> historyList = myService.selectHistoryList(coNo);
				System.out.println("초기화historyVO"+historyList);
				if(historyList .isEmpty()) {
					entity = new ResponseEntity<List<ReserveHistoryVO>>(historyList,HttpStatus.BAD_REQUEST);
				}else {
				entity = new ResponseEntity<List<ReserveHistoryVO>>(historyList,HttpStatus.OK);
				}
		return entity;

	}


	@RequestMapping("majorDoctors")
	public ResponseEntity<List<MajorVO>> majorDoctors(@RequestBody Map<String,String> vo, HttpSession session) throws Exception{
		ResponseEntity<List<MajorVO>> entity = null;
		MajorVO majorVO = new MajorVO();
		DoctorVO doctorVO = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorVO.getdId();
		String maNo = vo.get("maNo");
		majorVO.setdId(dId);
		majorVO.setMaNo(maNo);
		List<MajorVO> list = doctorService.majorDoctors(majorVO);
		System.out.println("majorDoctors==>"+list);
		//지금 이미 이 협진에 참여하고있는 사람이라면 list에서 빼줘야한다!
		System.out.println("majofDoctors==>"+vo.get("dId"));
		System.out.println("majorDoctors==>"+vo.get("coNo"));

		List<String> coNoIds = myService.selectCodId(vo.get("coNo"));
		for(int i=0; i<list.size();i++) {
			String madId = list.get(i).getdId();
			for(String coNoId : coNoIds) {
				if(madId.equals(coNoId)) {
						list.remove(i);
				}
			}
		}

   System.out.println("이미협진하고있는 의사들 뺀 List==>"+list);
		entity = new ResponseEntity<List<MajorVO>>(list, HttpStatus.OK);


		return entity;
	}
	@RequestMapping("simpleProfile")
	public ResponseEntity<MajorVO> simpleProfile(@RequestBody Map<String,String> vo) throws Exception{
		ResponseEntity<MajorVO> entity = null;
		String dId = vo.get("dId");
		MajorVO result = doctorService.simpleProfile(dId);

		entity = new ResponseEntity<MajorVO>(result, HttpStatus.OK);

		return entity;
	}
	@RequestMapping("simpleProfile2")
	public ResponseEntity<List<MajorVO>> simpleProfile(@RequestBody List<String> list) throws Exception{
		ResponseEntity<List<MajorVO>> entity = null;

		List<MajorVO> result = doctorService.simpleProfile2(list);

		entity = new ResponseEntity<List<MajorVO>>(result, HttpStatus.OK);

		return entity;
	}

	@RequestMapping("detailProfile")
	public ResponseEntity<Map<String,Object>> detailProfile(@RequestBody Map<String,String> vo, HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>>  entity = null;
		OtherDoctorCommand command = new OtherDoctorCommand();
		DoctorVO doctor = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
		String doId = vo.get("dId");
		command.setdId(dId);
		command.setDoId(doId);

		Map<String, Object> map = doctorService.detailDoctor(command);
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		return entity;
	}

@RequestMapping("coExit") //협진 탈퇴
public ResponseEntity<String> coExit( @RequestBody Map<String,String> map ) throws SQLException{
	ResponseEntity<String> entity = null;
	System.out.println("왜 여기 안오나요!");
	System.out.println("map==>"+map.get("dId"));
	System.out.println(map.get("coNo"));
	try {
	myService.coExit(map);
	entity = new ResponseEntity<String>("성공",HttpStatus.OK);
	}catch(Exception e) {
		entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
	return entity;
}

@RequestMapping("freqRegist")//자주찾는협진등록
public ResponseEntity<String> freqRegist(@RequestBody Map<String,String>map)throws SQLException{
	ResponseEntity<String> entity = null;
	System.out.println("freqRegist==>"+map.get("dId"));
	System.out.println("freqRegist==>"+map.get("coNo"));
	try {
	mainService.FreqRegist(map);
	entity = new ResponseEntity<String>("성공",HttpStatus.OK);
	}catch(Exception e) {
		entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
return entity;

}

@RequestMapping("freqCancel")//자주찾는협진등록
public ResponseEntity<String> freqCancel(@RequestBody Map<String,String>map)throws SQLException{
	ResponseEntity<String> entity = null;
	System.out.println("freqCancel==>"+map.get("dId"));
	System.out.println("freqCancel==>"+map.get("coNo"));

	try {
	mainService.RreqCancel(map);
	entity = new ResponseEntity<String>("성공",HttpStatus.OK);
	}catch(Exception e) {
		entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}
return entity;

}

@RequestMapping("rejectSubmit")//주치의가 거절사유를 입력한 경우
public ResponseEntity<String>rejectSubmit(@RequestBody Map<String,String>map)throws SQLException{
	ResponseEntity<String> entity = null;

	int checkRemove = mainService.checkRemove(map.get("taNo"));
	if(checkRemove ==3) {//삭제의 경우==>tastatus를 4로한다 !
		mainService.updateRemoveReject(map.get("taNo"));
		entity = new ResponseEntity<String>("성공",HttpStatus.OK);
		return entity;
	}else {
	try {
		mainService.rejectRegist(map);//거절사유를 입력하고 tn_yn을 'Y'로 바꿔줌
		mainService.rejectStatus(map);//tastatus를 2으로 바꿔줌(거절)
		entity = new ResponseEntity<String>("성공",HttpStatus.OK);
	}catch(Exception e) {
		entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}

	return entity;
}
}

@RequestMapping("updateComedStatus")//요청받은 사람의 상태변경
public ResponseEntity<String>updateComedStatus(@RequestBody Map<String,Object>map,HttpSession session)throws SQLException{
	ResponseEntity<String> entity = null;
//	String mysetting = map.get("mysetting");
//	String notiNo = map.get("notiNo");
//	String coNo = map.get("coNo");

	DoctorVO doctor = (DoctorVO)session.getAttribute("doctorLogin");
	String dId = doctor.getdId();
	map.put("dId",dId);

	try{
		mainService.updateComed(map);
		entity= new ResponseEntity<String>("성공",HttpStatus.OK);

	}catch(Exception e) {
		entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	}


	return entity;
}

}
