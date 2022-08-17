package kr.or.ddit.restController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.service.MyOrderService;

@RestController
@RequestMapping("myOrderset")
public class MyOrdersetRestController {
	@Autowired
	private MyOrderService myOrderService;
	
	
}
