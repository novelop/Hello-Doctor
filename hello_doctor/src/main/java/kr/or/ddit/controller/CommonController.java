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
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.service.NotiService;

@Controller
public class CommonController {
	@Autowired
	private NotiService notiService;

	@RequestMapping("index")
	public String page(String page, Model model, HttpSession session) throws Exception {
		String url = "/common/indexPage";

		if(page == null || page.equals("")){
			page = "/main/index.do";
		}else {
			page = page.replaceAll("amp;", "&");
		}
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctorVO.getdId();

		Map<String,Object> map =  notiService.notiList(dId);

		model.addAttribute("page", page);
		model.addAttribute("noti",map.get("noti"));
		model.addAttribute("count",map.get("count"));
		System.out.println(page);
		return url;
	}

//	@RequestMapping("main/index")
//	public String indexpage() {
//		String url = "/main/index";
//
//		return url;
//	}
}
