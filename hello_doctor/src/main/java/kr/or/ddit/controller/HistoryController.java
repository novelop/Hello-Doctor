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

import kr.or.ddit.dto.ChartPicFileVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.HistoryVO;
import kr.or.ddit.dto.LastChartFileVO;
import kr.or.ddit.dto.LastPrescriptVO;
import kr.or.ddit.dto.LogVO;
import kr.or.ddit.dto.MyHistoryCommentVO;
import kr.or.ddit.dto.ReserveHistoryVO;
import kr.or.ddit.service.CaseReplyService;
import kr.or.ddit.service.CooperMainService;
import kr.or.ddit.service.CooperMyService;
import kr.or.ddit.service.HistoryService;
import kr.or.ddit.service.MediRecoService;

@Controller
@RequestMapping("/history")
public class HistoryController {

	HttpSession session = null;
	@Autowired
	private CooperMyService myService;

	@Autowired
	private CaseReplyService replyService;

	@Autowired
	private MediRecoService mediRecoservice;

	@Autowired
	private HistoryService service;

	@Autowired
	private CooperMainService cooperMainService;

	@RequestMapping("/main") //기능
	public ModelAndView request(HttpServletRequest request, ModelAndView mnv) throws SQLException{
		String url = "history/main";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		System.out.println(dId);

		//진료히스토리
		List<HistoryVO> diagnosis = service.diagnosisHistory(dId);
		mnv.addObject("diagnosis",diagnosis);
		//협진히스토리
		List<HistoryVO> Cooperation = service.CooperationHistory(dId);
		mnv.addObject("Cooperation",Cooperation);
		//공지사항
		List<HistoryVO> noticeList = service.NoticeList(dId);
		mnv.addObject("noticeList",noticeList);
		//알림 -협진요청받은것
		List<HistoryVO> comingalarm = service.alarmList(dId);
		mnv.addObject("comingalarm",comingalarm);
		//협진요청 보낸기록
		List<HistoryVO> sending = service.sendList(dId);
		mnv.addObject("sending",sending);

		//좋아요
		List<HistoryVO> likeList = service.LikeList(dId);
		System.out.println("좋아요!"+likeList);
		mnv.addObject("likeList",likeList);

		//댓글
		List<HistoryVO> commentList = service.commentList(dId);
		System.out.println("댓글!"+commentList);
		mnv.addObject("commentList",commentList);

		//로그
		List<HistoryVO> logList = service.LogHistory(dId);
		mnv.addObject("logList",logList);

		List<LogVO> log = service.logHistory(dId);
		mnv.addObject("log",log);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/diagnosis_history") //기능
	public ModelAndView diagnosis_history(SearchCriteria cri,HttpServletRequest request, ModelAndView mnv)throws SQLException{
		String url = "history/diagnosis_history";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();

		Map<String, Object> dataMap = service.AllDiagnosis(cri, dId);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/cooperation_history") //기능
	public ModelAndView cooperation_history(SearchCriteria cri,HttpServletRequest request, ModelAndView mnv) throws SQLException{
		String url = "history/cooperation_history";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		System.out.println(dId);

		Map<String, Object> dataMap = service.AllCooperation(cri, dId);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/mylog2") //기능
	public String mylog(){
		String url = "history/mylog2";
		return url;
	}

	@RequestMapping("notice")
	public ModelAndView notice(HttpServletRequest request, ModelAndView mnv)throws SQLException {
		String url = "history/notice";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		System.out.println(dId);

		List<HistoryVO> NotcieBoard = service.Notice(dId);
		mnv.addObject("NotcieBoard",NotcieBoard);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("notice_detail")
	public String noticeDetail(String nNo,Model model) throws SQLException{
		String url="history/notice_detail";

		HistoryVO noticeDetail = service.selectNotice(nNo);
		model.addAttribute("noticeDetail",noticeDetail);
		return url;

	}

	@RequestMapping("/cooperationRequest")
	public String cooperationReceive(String notiNo, String mysetting,Model model) throws SQLException{
		String url="cooperation/cooperationRequest";

		Map<String,Object> map =  cooperMainService.cooperationRequest(notiNo);

		model.addAttribute("noti", map.get("notiVO"));
		model.addAttribute("doctor", map.get("doctorList"));

		model.addAttribute("mysetting",mysetting);
		model.addAttribute("notiNo",notiNo);
		System.out.println("noti==>"+map.get("notiVO"));
		System.out.println("doctor==>"+map.get("doctorList"));

		return url;
	}




}
