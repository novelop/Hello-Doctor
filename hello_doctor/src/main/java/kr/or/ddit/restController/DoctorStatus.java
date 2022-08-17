package kr.or.ddit.restController;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.dao.DoctorDAO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.service.DoctorService;


@RestController
@RequestMapping("doctorstatus")
public class DoctorStatus {

	@Autowired
	private DoctorService doctorService;

	@Autowired
	private DoctorDAO doctorDao;



	@RequestMapping("/")
	public String main() throws Exception{
		String url ="main/index";

		return url;
	}


	@RequestMapping( value = "num" ,method = RequestMethod.POST)
	public  ResponseEntity<Integer>  status(@RequestBody Map<String,String> map, HttpSession session)  throws Exception{

		ResponseEntity<Integer> entity = null;

		DoctorVO vo = new DoctorVO();


		int status = Integer.parseInt(map.get("status"));
		DoctorVO doc = (DoctorVO)session.getAttribute("doctorLogin");
		System.out.println("doc의 "+doc.getStatus());
		String dId = doc.getdId();
		vo.setdId(dId);
		vo.setStatus(status);



		System.out.println("vovovovovovovoovovovovovov"+dId);
		//상태업데이트하기
		doctorService.profileChange(vo);

		vo = doctorService.selectDoctorVO(dId);

		System.out.println("상태바꾸고 "+vo.getStatus());
        System.out.println("상태바꾸고"+vo.getdId());
        System.out.println("상태바꾸고"+vo.getdName());

		session.setAttribute("doctorLogin", vo);

		entity = new ResponseEntity<Integer>(status,HttpStatus.OK);



		return entity;


	}

	@RequestMapping(value = "idfind",method = RequestMethod.POST)
	public ResponseEntity<String> idfind(@RequestBody Map<String, String>map) throws Exception{

		ResponseEntity<String> entity = null;

		String idfirst=  map.get("idfirstRnum");
		String idsecond=  map.get("idsecondRnum");


		String dName=  map.get("myname");
		String residentNum = idfirst+"-"+idsecond;

		System.out.println("myname"+dName);
		System.out.println("str"+residentNum);


		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("dName", dName);
		dataMap.put("residentNum", residentNum);


		     String id=  doctorDao.findId(dataMap);

		     System.out.println("id"+id);


		if(id!=null) {
		entity = new ResponseEntity<String>(id,HttpStatus.OK);

		}else {
		entity = new ResponseEntity<String>("",HttpStatus.OK);
		}
		System.out.println("entity"+entity);


		return entity;


	}


	@RequestMapping(value = "passfind",method = RequestMethod.POST)
	public ResponseEntity<String> passfind(@RequestBody Map<String, String>map) throws Exception{

		ResponseEntity<String> entity = null;

		String passfirstRnum=  map.get("passfirstRnum");
		String passsecondRnum=  map.get("passsecondRnum");


		String dId=  map.get("passId");
		String dName=  map.get("passName");
		String residentNum = passfirstRnum+"-"+passsecondRnum;



		System.out.println("myname"+dName);
		System.out.println("str"+residentNum);


		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("dId", dId);
		dataMap.put("dName", dName);
		dataMap.put("residentNum", residentNum);


		    String mail=  doctorDao.sendMail(dataMap);
		     System.out.println("mail"+mail);


		if(mail!=null) {
		entity = new ResponseEntity<String>(mail,HttpStatus.OK);

		}else {
		entity = new ResponseEntity<String>("",HttpStatus.OK);
		}
		System.out.println("entity"+entity);
		return entity;
	}
}
