package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.CaseRegistCommand;
import kr.or.ddit.command.ReplyPagingCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CaseFileVO;
import kr.or.ddit.dto.CaseReplyVO;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.RecomVO;
import kr.or.ddit.dto.ReplyRecomVO;
import kr.or.ddit.service.CaseReplyService;
import kr.or.ddit.service.CaseService;

@Controller
@RequestMapping("case")
public class CaseDiscussionController {

	@Autowired
	private CaseService service;
	@Resource(name="doctorFilePath")
	private String doctorFilePath;
	@Autowired
	private CaseReplyService replyService;
	@Resource(name="caseFilePath")
	private String caseFilePath;
	@RequestMapping("main")
	public ModelAndView main(CaseVO casevo, ModelAndView mnv, HttpServletRequest request) throws Exception{
		String url = "casediscussion/main";

		HttpSession session = request.getSession();
		DoctorVO doctorvo = (DoctorVO) session.getAttribute("doctorLogin");
		String MaName = doctorvo.getMaName();

		Map<String, Object> dataMap = service.mainBottomShow(casevo, MaName);
		System.out.println(dataMap);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST, produces ="text/plain;charset=utf-8")
	public String regist(CaseRegistCommand command, HttpServletRequest request, RedirectAttributes rttr)throws Exception {
		String url ="redirect:list.do?from=regist";

		System.out.println(command);
		service.insertCase(command);

		return url;

	}

	@RequestMapping("/registForm")
	public String registForm() {
		String url = "casediscussion/regist";
		return url;
	}
	@RequestMapping("/detail")
	public ModelAndView detail(String disNo, String from, ReplyPagingCommand command, ModelAndView mnv, HttpServletRequest request)throws SQLException {
		String url ="casediscussion/detail";

		HttpSession session = request.getSession();
		DoctorVO doctorvo = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorvo.getdId();
		RecomVO recomvo = new RecomVO();
		recomvo.setdId(dId);
		recomvo.setDisNo(disNo);
		recomvo = (RecomVO)service.recomSelect(recomvo);

		Map<String, Object> dataMap = replyService.listReply(command, disNo, dId);
		CaseVO casevo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if(from != null && from.equals("list")) {
			service.increaseViewCnt(disNo);
		}
		map = service.detailCase(disNo);


		mnv.addObject("map", map);
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("recomvo", recomvo);
		mnv.addObject("casevo", casevo);
		mnv.addObject("from", from);
		mnv.setViewName(url);


		return mnv;

	}

	@RequestMapping(value = "list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv, HttpServletRequest request, String from) throws Exception{
		String url = "casediscussion/list";

		if(from != null && from.equals("regist")) {
			 mnv.addObject("from", "regist");
		}
		HttpSession session = request.getSession();
		DoctorVO doctorvo = (DoctorVO) session.getAttribute("doctorLogin");
		String maName = doctorvo.getMaName();
		String dId = doctorvo.getdId();
		cri.setDId(dId);
		cri.setMaName(maName);
		cri.setPerPageNum(12);
		Map<String, Object> dataMap = service.getCaseListForPage(cri);
		System.out.println(dataMap);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("delete")
	public String delete(String disNo, RedirectAttributes rttr)throws Exception{
		String url = "redirect:list";
		service.deleteCase(disNo);
		rttr.addAttribute("from", "regist");
		return url;
	}

	@RequestMapping("comment")
	public String comment() {
		String url ="casediscussion/comment_regist";

		return url;

	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String disNo, ModelAndView mnv)throws SQLException{
		String url = "casediscussion/modify";

		CaseVO casevo = service.getCaseForModify(disNo);
		List<CaseFileVO> list = service.selectFile(disNo);
		System.out.println(list);
		mnv.addObject("list",list);
		mnv.addObject("casevo", casevo);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("modify")
	public String modify(CaseVO caseVO, CaseRegistCommand command, String disFileName, HttpServletRequest request, RedirectAttributes rttr)throws SQLException {
		String url ="redirect:list";
		System.out.println(command.getSubDName());
		System.out.println(command);
		service.deleteFile(disFileName);
		service.updateCase(command);
		service.modifyFile(command);
		rttr.addFlashAttribute("from", "regist");
		rttr.addAttribute("dis_no", command.getDisNo());


		return url;

	}



	@RequestMapping("test")
	public String test() {
		String url = "casediscussion/test";
		return url;
	}

	@ResponseBody
	@RequestMapping("likeUp")
	public ResponseEntity<Map<String, String>> likeUp(@RequestBody Map<String, String> map)throws SQLException{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.CREATED);
		String dId = map.get("dId");
		String disNo = map.get("disNo");
		RecomVO recomvo = new RecomVO();
		recomvo.setdId(dId);
		recomvo.setDisNo(disNo);
		service.recomInsert(recomvo);

		return entity;
	}
	@ResponseBody
	@RequestMapping("likeDown")
	public ResponseEntity<Map<String, String>> likeDown(@RequestBody Map<String, String> map)throws SQLException{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.CREATED);
		String dId = map.get("dId");
		String disNo = map.get("disNo");
		RecomVO recomvo = new RecomVO();
		recomvo.setdId(dId);
		recomvo.setDisNo(disNo);
		service.recomDelete(recomvo);

		return entity;
	}

	@RequestMapping("/replyRegist")
	public String replyRegist(CaseReplyVO replyvo, RedirectAttributes rttr, HttpServletRequest request)throws SQLException{
		String disNo = replyvo.getDisNo();
		HttpSession session = request.getSession();
		DoctorVO doctorvo = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorvo.getdId();
		String url = "redirect:detail.do?disNo="+disNo+"&dId="+dId;
		replyService.registReply(replyvo);
		return url;
	}

	@ResponseBody
	@RequestMapping("/updateReply")
	public ResponseEntity<Map<String, String>> updateReply(@RequestBody Map<String, String>map)throws SQLException{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		CaseReplyVO replyvo = new CaseReplyVO();
		String disRplyNo = map.get("disRplyNo");
		String disContent = map.get("disContent");
		replyvo.setDisRplyNo(disRplyNo);
		replyvo.setDisContent(disContent);
		replyService.updateReply(replyvo);
		return entity;
	}

	@ResponseBody
	@RequestMapping("/deleteReply")
	public ResponseEntity<Map<String,String>> deleteReply(@RequestBody Map<String, String>map)throws SQLException{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);

		String disRplyNo = map.get("disRplyNo");
		replyService.deleteReply(disRplyNo);
		return entity;
	}

	@ResponseBody
	@RequestMapping("/replyLikeUp")
	public ResponseEntity<Map<String, String>> replyLikeUp(@RequestBody Map<String, String>map, HttpServletRequest request)throws SQLException{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		ReplyRecomVO replyRecomVO = new ReplyRecomVO();
		String disRplyNo = map.get("disRplyNo");
		replyRecomVO.setDisRplyNo(disRplyNo);
		HttpSession session = request.getSession();
		DoctorVO doctorvo = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorvo.getdId();
		replyRecomVO.setdId(dId);

		replyService.caseRecomInsert(replyRecomVO);
		return entity;
	}
	@ResponseBody
	@RequestMapping("/replyLikeDown")
	public ResponseEntity<Map<String, String>> replyLikeDown(@RequestBody Map<String, String>map, HttpServletRequest request)throws SQLException{
		ResponseEntity<Map<String, String>> entity = null;
		entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		ReplyRecomVO replyRecomVO = new ReplyRecomVO();
		String disRplyNo = map.get("disRplyNo");
		replyRecomVO.setDisRplyNo(disRplyNo);
		HttpSession session = request.getSession();
		DoctorVO doctorvo = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorvo.getdId();
		replyRecomVO.setdId(dId);

		replyService.caseRecomDelete(replyRecomVO);
		return entity;
	}

	@RequestMapping("getFile")
	public String getFile(String disNo, String disFileNo,Model model)throws Exception{
		String url = "downloadFile";
		CaseFileVO filevo = new CaseFileVO();
		filevo.setDisNo(disNo);
		filevo.setDisFileNo(disFileNo);
		String fileName = service.getFile(filevo);

		model.addAttribute("savedPath", caseFilePath);
		model.addAttribute("fileName", fileName);
		return url;
	}

	@RequestMapping("getPic")
	public  ResponseEntity<byte[]> getPic(String disNo, String disFileNo)throws Exception{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		CaseFileVO filevo = new CaseFileVO();
		filevo.setDisNo(disNo);
		filevo.setDisFileNo(disFileNo);
		System.out.println(disNo);
		System.out.println(disFileNo);
		try {
			String temp  = service.getFile(filevo);

			in = new FileInputStream(new File(caseFilePath, temp ));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} finally {
			in.close();
		}

		return entity;
	}



	}













