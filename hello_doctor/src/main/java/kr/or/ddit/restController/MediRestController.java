package kr.or.ddit.restController;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MyOrderListVO;
import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.service.DiseaseService;
import kr.or.ddit.service.MediRecoService;
import kr.or.ddit.service.MyOrderService;
import kr.or.ddit.util.MakeFileName;

@RestController
@RequestMapping("medi")
public class MediRestController {
	@Resource(name="recoFilePath")
	private String recoFilePath;
		@Autowired
		private MyOrderService myOrderService;

		@Autowired
		private MediRecoService mediRecoService;

		@Autowired
		private DiseaseService diseaseService;
	@RequestMapping("orderlist")
	public ResponseEntity<List<OrdersetVO>> orderlist(@RequestBody Map<String,String> vo) throws Exception{
		ResponseEntity<List<OrdersetVO>> entity = null;
		String moNo = vo.get("moNo");
		System.out.println(moNo);
		List<OrdersetVO> list = myOrderService.orderdruglist(moNo);
		entity =  new ResponseEntity<List<OrdersetVO>>(list, HttpStatus.OK);

		return entity;
	}
	@RequestMapping("pastchart")
	public ResponseEntity<Map<String,Object>> pastchart(@RequestBody Map<String,String> vo)throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;


		return entity;
	}
	@RequestMapping("searchdisease")
	public ResponseEntity<List<String>> searchdisease(@RequestBody Map<String,String> vo)throws Exception{
		ResponseEntity<List<String>> entity = null;
			String deKo = vo.get("deKo");
			List<String> list = null;
			try {
			list = diseaseService.searchdisease(deKo);
			}catch (Exception e) {
				// TODO: handle exception
			}

				entity = new ResponseEntity<List<String>>(list, HttpStatus.OK);
			return entity;
	}
	@RequestMapping("searchmedicine")
	public ResponseEntity<List<String>> searchmedicine(@RequestBody Map<String,String> vo)throws Exception{
		ResponseEntity<List<String>> entity = null;
		String meName = vo.get("meName");
		List<String> list = null;

		try {
			list = diseaseService.searchmedicine(meName);

		} catch (Exception e) {
			// TODO: handle exception
		}
		entity = new ResponseEntity<List<String>>(list, HttpStatus.OK);
		return entity;
	}
	@RequestMapping("docuinput")
	public ResponseEntity<String> docuinput(HttpSession session)throws Exception{

		ResponseEntity<String> entity = null;
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
		String result = mediRecoService.docuinput(dId);
		entity =  new ResponseEntity<String>(result, HttpStatus.OK);

		return entity;

	}
	@RequestMapping("pastreco")
	public ResponseEntity<Map<String, Object>> pastreco(@RequestBody Map<String,String> vo)throws Exception{

		ResponseEntity<Map<String, Object>> entity = null;
		String mNo = vo.get("mNo");
		Map<String, Object> map = mediRecoService.pastreco(mNo);

		entity =  new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		return entity;

	}


	@RequestMapping("durCheck")
	public ResponseEntity<String> durCheck(@RequestBody List<String> list)throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println(list);
		String result = mediRecoService.durCheck(list);
		entity = new ResponseEntity<String>(result , HttpStatus.OK);

		return entity;
	}
	@RequestMapping("watingList")
	public ResponseEntity<List<ChartFormVO>> watingList(HttpSession session)throws Exception{
		ResponseEntity<List<ChartFormVO>> entity = null;
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
		Map<String,Object> map = mediRecoService.selectAllReco(dId);
		List<ChartFormVO> list = (List<ChartFormVO>) map.get("patient");
		list.remove(0);


		entity = new ResponseEntity<List<ChartFormVO>>(list , HttpStatus.OK);

		return entity;
	}

	@RequestMapping("overDose")
	public ResponseEntity<Boolean> overDose(@RequestBody Map<String,String> map)throws Exception{
		ResponseEntity<Boolean> entity = null;
		String drugNm = map.get("drugNm");
		String temp = map.get("quantity");
		int quantity = Integer.parseInt(temp);
		boolean result = true;
		try {
			 result = mediRecoService.overDose(drugNm, quantity);
		} catch (Exception e) {
			// TODO: handle exception
		}
		entity = new ResponseEntity<Boolean>(result, HttpStatus.OK);

		return entity;
	}

	@RequestMapping("getPic")
	public  ResponseEntity<byte[]> getPic(String mpNo)throws Exception{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;

		try {
			String temp  = mediRecoService.getPic(mpNo);
			System.out.println(recoFilePath);
			System.out.println(temp);
			in = new FileInputStream(new File(recoFilePath, temp ));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} finally {
			// TODO: handle finally clause
			in.close();
		}

		return entity;
	}
}
