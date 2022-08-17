package kr.or.ddit.restController;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.command.OtherDoctorCommand;
import kr.or.ddit.dto.CoworkerVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;
import kr.or.ddit.service.DoctorService;

@RestController
@RequestMapping("doctor")
public class DoctorRestController {

	@Autowired
	private DoctorService doctorService;

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


	@RequestMapping("/idCheck")
	public ResponseEntity<String> idCheck(DoctorVO vo) throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println("doctorRestController idCheck!!");

		System.out.println("vovovovovovovovoid"+vo.getdId());

		DoctorVO doctor = doctorService.getDoctor(vo);


		if(doctor != null) {
			entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		}

		return entity;

	}

	@Resource(name="doctorFilePath")
	private String doctorFilePath;

	@RequestMapping("getPic")
	public  ResponseEntity<byte[]> getPic(String dId)throws Exception{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		try {
			DoctorVO vo =doctorService.selectDoctorVO(dId);

			in = new FileInputStream(new File(doctorFilePath, vo.getdPic()));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {

			in.close();
		}
		return entity;
	}

	@RequestMapping("addCoworker")
	public ResponseEntity<MajorVO> addCoworker(@RequestBody Map<String,String> vo, HttpSession session) throws Exception{
		ResponseEntity<MajorVO>  entity = null;
		CoworkerVO coworkerVO = new CoworkerVO();
		DoctorVO doctor = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
		String doId = vo.get("dId");
		coworkerVO.setMydId(dId);
		coworkerVO.setCodId(doId);

		MajorVO result = doctorService.addCoworker(coworkerVO);
		entity = new ResponseEntity<MajorVO>(result, HttpStatus.OK);
		return entity;
	}

	@RequestMapping("deleteCoworker")
	public ResponseEntity<String> deleteCoworker(@RequestBody Map<String,String> vo, HttpSession session) throws Exception{
		ResponseEntity<String>  entity = null;
		CoworkerVO coworkerVO = new CoworkerVO();
		DoctorVO doctor = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
		String doId = vo.get("dId");
		coworkerVO.setMydId(dId);
		coworkerVO.setCodId(doId);

		 doctorService.deleteCoworker(coworkerVO);
		entity = new ResponseEntity<String>("성공", HttpStatus.OK);
		return entity;
	}



}
