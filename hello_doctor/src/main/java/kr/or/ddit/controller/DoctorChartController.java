package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;
import kr.or.ddit.service.DoctorService;

@Controller
public class DoctorChartController {
	@Autowired
	private DoctorService doctorService;


	@RequestMapping("doctorChart/chartform")
	public String chartForm(Model model,HttpSession session) throws Exception {
		String url = "doctorchart/chart";

		DoctorVO vo = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = vo.getdId();

		Map<String,Object> map = doctorService.coworkerList(dId);
		model.addAttribute("major", map.get("major"));
		model.addAttribute("coworker", map.get("coworker"));

		return url;
	}
}
