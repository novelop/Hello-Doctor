package kr.or.ddit.restController;

import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import kr.or.ddit.service.HistoryService;

@RestController
@RequestMapping("cooperation")
public class HistoryRestController {

	@Autowired HistoryService service;

	@RequestMapping("readCooperation")
	ResponseEntity<String> readCooperation(@RequestBody Map<String, String> notiNo) throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println("왜"+notiNo);

		try {
			service.readCooperation(MapUtils.getString(notiNo, "notiNo", "lll"));
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
