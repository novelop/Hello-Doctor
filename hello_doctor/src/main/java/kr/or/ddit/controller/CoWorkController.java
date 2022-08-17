package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.service.CoMedService;

@Controller
@RequestMapping("/colist")
public class CoWorkController {
	HttpSession session = null;

	@Autowired
	private CoMedService service;


	//협진메인(전체리스트)
	@RequestMapping("/coworklist")
	public String coopermainlist(HttpSession session,  SearchCriteria cri, Model model) throws SQLException {
		String url = "colist/coworklist";
		Map<String, Object> dataMap = null;
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		cri.setdId(dId);

		dataMap = service.getCooperationMainList(cri);
//		System.out.println(dataMap);
		model.addAttribute("dataMap",dataMap);

		return url;
	}

	//협진메인(진행중리스트)
	@RequestMapping("/proceedingCooperation")
	public String proceedingCooperation(SearchCriteria cri, Model model, HttpSession session,String chkSelectMine) throws SQLException{
		String url = "colist/proceedingCooperation";
		Map<String, Object> dataMap = null;
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		cri.setDId(dId);
		if(chkSelectMine !=null && chkSelectMine.equals("")) {
			cri.setChkSelectMine(chkSelectMine);
		}
		dataMap = service.proceedingCooperation(cri);
		model.addAttribute("dataMap",dataMap);
		return url;

	}

	//협진메인(완료리스트)
	@RequestMapping("/completeCooperation")
	public String completeCooperation(SearchCriteria cri, Model model, HttpSession session, String chkSelectMine) throws SQLException{
		String url = "colist/completeCooperation";
		Map<String, Object> dataMap = null;
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		cri.setDId(dId);
		if(chkSelectMine != null && chkSelectMine.equals("")) {
			cri.setChkSelectMine(chkSelectMine);
		}

		dataMap = service.completeCooperation(cri);
		model.addAttribute("sessiondId",dId);
		model.addAttribute("dataMap",dataMap);
		return url;
	}

	//사용자의 전공과 일치하는 협진리스트
	@RequestMapping("/myCooperation")
	public ModelAndView myCooperation(SearchCriteria cri,HttpServletRequest request,  ModelAndView mnv) throws SQLException{
		String url = "colist/myCooperation";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String myMaNo = doctorLogin.getMaNo();

		System.out.println(myMaNo);
		Map<String, Object> dataMap= null;
		dataMap = service.myCooperation(myMaNo,cri);
		System.out.println("리스트==>"+dataMap.get("myCooperation"));
		mnv.addObject("dataMap",dataMap);

		mnv.setViewName(url);

		return mnv;
	}



	//내가 했던 협진
	@RequestMapping("/iCooperation")
	public ModelAndView iCooperation(SearchCriteria cri, HttpServletRequest request, ModelAndView mnv) throws SQLException{
			String url = "colist/iCooperation";
			session = request.getSession();
			DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
			String dId = doctorLogin.getdId();

			Map<String, Object> dataMap = service.iCooperation(cri, dId);
			mnv.addObject("dataMap",dataMap);
			mnv.setViewName(url);
			return mnv;

		}


	//진행중인 협진리스트 중 사용자의 전공과 일치하는 협진리스트
	@RequestMapping("/myCooperationProceeding")
	public String myCooperationProceeding(SearchCriteria cri, HttpServletRequest request, Model model) throws SQLException{
		String url = "colist/myCooperationProceeding";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getMaNo();
		Map<String, Object> dataMap = null;
		dataMap = service.myCooperation_proceeding(dId, cri);
		model.addAttribute("dataMap",dataMap);
		return url;
	}

	//완료된 협진리스트 중 사용자의 전공과 일치하는 협진리스트
	@RequestMapping("/myCooperationComplete")
	public String myCooperationComplete(SearchCriteria cri, HttpServletRequest request, Model model) throws SQLException{
		String url = "colist/myCooperationComplete";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getMaNo();
		Map<String, Object> dataMap = null;
		dataMap = service.myCooperation_complete(dId, cri);
		model.addAttribute("dataMap",dataMap);
		return url;
	}

}

