package kr.or.ddit.restController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.service.OrdersetService;

@RestController
@RequestMapping("orderset")
public class OrdersetRestController {

	@Autowired
	private OrdersetService ordersetService;

	@RequestMapping("drugList")
	public ResponseEntity<List<OrdersetVO>> drugList(@RequestBody Map<String,String> map) throws Exception{
		ResponseEntity<List<OrdersetVO>>  entity = null;

		String keyword = map.get("keyword");
		System.out.println(keyword);

		List<OrdersetVO> drugList = ordersetService.searchDrugList(keyword);

		entity = new ResponseEntity<List<OrdersetVO>>(drugList,HttpStatus.OK);
		return entity;
	}
	@RequestMapping("update_recom")
	public ResponseEntity<Map<String,String>> update_recom(@RequestBody Map<String,String> map) throws Exception{
		ResponseEntity<Map<String,String>>  entity = null;
		Map<String,String> dataMap = new HashedMap<String,String>();

		String recoCnt = map.get("recoCnt");

		String rStatus = null;
		try {
			rStatus = 	ordersetService.updateRecommand(map);

		} catch (Exception e) {
			// TODO: handle exception
		}


		System.out.println("recoCnt  "+recoCnt);

		if(rStatus.equals("1")) {
		   dataMap.put("rStatus", rStatus);
		   dataMap.put("recoCnt", Integer.toString(Integer.parseInt(recoCnt)+1));
		}else {
			dataMap.put("rStatus", rStatus);
		   	dataMap.put("recoCnt", Integer.toString(Integer.parseInt(recoCnt)-1));
		}

		entity = new ResponseEntity<Map<String,String>>(dataMap,HttpStatus.OK);

		return entity;
	}

	@RequestMapping("update_feedback")
	public ResponseEntity<Map<String,String>> update_feedback(@RequestBody Map<String,String> map) throws Exception{
		ResponseEntity<Map<String,String>>  entity = null;
		Map<String,String> dataMap = new HashedMap<String,String>();

		dataMap = ordersetService.updateOrdersetFeedBack(map);

		entity = new ResponseEntity<Map<String,String>>(dataMap,HttpStatus.OK);

		return entity;
	}

	@RequestMapping("delete_feedback")
	public ResponseEntity<Map<String,String>> delete_feedback(@RequestBody Map<String, String> map) throws Exception{
		ResponseEntity<Map<String,String>>  entity = null;
		Map<String,String> dataMap = new HashedMap<String,String>();
		String fbNo = map.get("fbNo");
		System.out.println("ddddddddddddddddddddddddd"+fbNo );

		ordersetService.deleteOrdersetFeedBack(fbNo);
		dataMap.put("result", "1");
		entity = new ResponseEntity<Map<String,String>>(dataMap,HttpStatus.OK);

		return entity;
	}
	@RequestMapping("doctorShare")
	public ResponseEntity<String> doctorShare(@RequestBody Map<String, Object> map, HttpSession session) throws Exception{
		ResponseEntity<String> entity = null;
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctorVO.getdId();
		String oNo = (String)map.get("oNo");
		List<Map<String,String>> list =(List<Map<String,String>>)map.get("list");
		try {
		ordersetService.orderSetShare(dId, oNo, list);
		entity = new ResponseEntity<String>("성공",HttpStatus.OK);
		System.out.println("성공");

		}catch (Exception e) {
			System.out.println("실패...");
			entity = new ResponseEntity<String>("실패",HttpStatus.BAD_REQUEST);
			// TODO: handle exception
		}
		System.out.println(entity);
		return entity;
	}
	
	@RequestMapping("medicineCheck")
	public ResponseEntity<String> medicineCheck(@RequestBody Map<String, String> map) throws Exception{
		ResponseEntity<String> entity = null;
	    String meName = map.get("meName");
	    
	    System.out.println(meName);
	    
		String result = ordersetService.selectMedicine(meName);
		
		  if(result != null && !result.equals("")){
			  entity = new ResponseEntity<String>("성공",HttpStatus.OK);
		  }else {
			  entity = new ResponseEntity<String>("실패",HttpStatus.BAD_REQUEST);
		  }
		System.out.println(entity);
		
		
		return entity;
	}
	
	

}
