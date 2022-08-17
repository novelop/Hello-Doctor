//package kr.or.ddit.restController;
//
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import kr.or.ddit.dto.MyOrderListVO;
//import kr.or.ddit.service.MedicineService;
//
//@RestController
//@RequestMapping("manager")
//public class ManagerRestController {
//	@Autowired
//	private MedicineService medicineservice;
//
//
//	@RequestMapping("modifyN")
//	public ResponseEntity<String> modifyN(@RequestBody Map<String,String> vo) throws Exception{
//		ResponseEntity<String> entity = null;
//		String meNo = vo.get("meNo");
//
//		try{medicineservice.modifyN(meNo);
//		entity =  new ResponseEntity<String>("성공", HttpStatus.OK);
//		}catch (Exception e) {
//
//			entity =  new ResponseEntity<String>("실패", HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//	@RequestMapping("modifyY")
//	public ResponseEntity<String> modifyY(@RequestBody Map<String,String> vo) throws Exception{
//		ResponseEntity<String> entity = null;
//		String meNo = vo.get("meNo");
//
//		try{medicineservice.modifyY(meNo);
//		entity =  new ResponseEntity<String>("성공", HttpStatus.OK);
//		}catch (Exception e) {
//
//			entity =  new ResponseEntity<String>("실패", HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//
//
//}
