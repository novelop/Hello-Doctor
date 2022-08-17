package kr.or.ddit.restController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.service.NotiService;

@RestController
@RequestMapping("noti")
public class NotiRestController {

	@Autowired
	private NotiService notiService;


	@RequestMapping("notiList")
	public ResponseEntity<Map<String,Object>> noticeRead(HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctorVO.getdId();
		Map<String,Object> map =  notiService.notiList(dId);

		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK );

		return entity;

	}

}
