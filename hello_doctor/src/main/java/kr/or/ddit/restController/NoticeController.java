package kr.or.ddit.restController;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.service.HistoryService;

@RestController
@RequestMapping("notice")
public class NoticeController {

	@Autowired HistoryService service;

	@RequestMapping("noticeRead")
	public ResponseEntity<String> noticeRead(@RequestBody Map<String, Object>map) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			service.readNotice(map);
			entity = new ResponseEntity<String>("성공",HttpStatus.OK);
			System.out.println("확인");

		} catch (Exception e) {
			System.out.println("확인불가");
			entity = new ResponseEntity<String>("실패",HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}

}
