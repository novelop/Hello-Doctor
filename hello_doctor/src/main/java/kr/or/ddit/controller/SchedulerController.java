package kr.or.ddit.controller;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.SchedulerVO;
import kr.or.ddit.service.SchedulerService;

@Controller
@RequestMapping("/scheduler")
public class SchedulerController {

	HttpSession session = null;

	@Autowired
	private SchedulerService service;

	private static final Logger log = LoggerFactory.getLogger(SchedulerController.class);


	@RequestMapping("/main")
	public ModelAndView main(HttpServletRequest request, ModelAndView mnv) throws Exception{
		String url = "scheduler/main";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();


		Map<String, Object> map = service.TodayMyList(dId);
		mnv.addObject("result",map.get("result"));
		mnv.addObject("selectbox",map.get("selectbox"));
		mnv.setViewName(url);

		return mnv;
	}


	@RequestMapping("/registForm")
	public String regist(String date, Model model, HttpServletRequest request) throws Exception{
		String url = "scheduler/regist";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		Map<String, Object> map = service.TodayMyList(dId);
		model.addAttribute("selectbox",map.get("selectbox"));
		System.out.println("controller" +map.get("selectbox"));

		model.addAttribute("date", date);

		return url;
	}
	@RequestMapping("/registForm2")
	public String regist2(String date,String coNo, Model model, HttpServletRequest request) throws Exception{
		String url = "scheduler/regist2";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		CoMedVO comedvo = new CoMedVO();

		Map<String, Object> map = service.TodayMyList(dId);
		List<CoMedVO> selectbox = (List<CoMedVO>)map.get("selectbox");

		for(CoMedVO vo :selectbox ) {
			if(vo.getCoNo().equals(coNo)) {
				comedvo.setCoNo(vo.getCoNo());
				comedvo.setCoDoc(vo.getCoDoc());
				comedvo.setpName(vo.getpName());
				comedvo.setCoDisease(vo.getCoDisease());
			}
		}
		model.addAttribute("comedvo",comedvo);

		model.addAttribute("date", date);

		return url;
	}
	@RequestMapping("/detailList")
	public String detailList() throws Exception{
		String url = "scheduler/detailList";
		return url;
	}
	@RequestMapping("/detail")
	public String detail() throws Exception{
		String url = "scheduler/detail";
		return url;
	}
	@RequestMapping("/modify")
	public String modify() throws Exception{
		String url = "scheduler/modify";
		return url;
	}



}
