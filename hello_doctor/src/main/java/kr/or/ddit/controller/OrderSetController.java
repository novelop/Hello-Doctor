package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;
import kr.or.ddit.dto.MyOrderVO;
import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.service.DoctorService;
import kr.or.ddit.service.MyOrderService;
import kr.or.ddit.service.OrdersetService;


@Controller
@RequestMapping("/orderset")
public class OrderSetController {


	@Autowired
	private OrdersetService orderservice;
    @Autowired
    private MyOrderService myorderService;

    @Autowired
    private DoctorService doctorService;


	@RequestMapping("/main")
	public String main(HttpSession session, Model model) throws Exception {
		String url = "orderset/main";
		Map<String, Object> dataMap = orderservice.getMainOrderset(session);

		model.addAttribute("dataMap", dataMap);
		return url;
	}



	@RequestMapping("/orderset_list")
	public String orderset_list(HttpSession session, SearchCriteria cri ,Model model)throws Exception {
		String url = "orderset/orderset_list";
		Map<String, Object> dataMap = null;
		System.out.println(cri);

		dataMap = orderservice.getOrdersetList(session, cri);
		model.addAttribute("dataMap", dataMap);

		return url;
	}


	@RequestMapping("/orderset_registform")
	public String orderset_registform() {
		String url = "orderset/orderset_registform";
		return url;
	}

	@RequestMapping("/orderset_regist")
	public String orderset_regist( InsertOrderSetCommand vo ,HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:orderset_list.do";

		orderservice.insertOrderset(session,vo);

		rttr.addFlashAttribute("from", "regist");
		return url;
	}


	@RequestMapping("orderset_detail")
	public String orderset_detail(SearchCriteria cri,HttpSession session, String oNo, String from ,Model model) throws Exception {
		String url = "orderset/orderset_detail";
		Map<String, Object> dataMap = new HashMap<String, Object>();

		  if(from!=null && from.equals("list")) {
			  orderservice.increaseViewCnt(oNo);
			  model.addAttribute("from", from);
		  }

		dataMap = orderservice.getOrdersetDetail(session,oNo,cri);
		model.addAttribute("dataMap", dataMap);

		return url;
	}



	@RequestMapping("/orderset_modifyForm")
	public String orderset_modifyForm(HttpSession session, String oNo,Model model,SearchCriteria cri) throws Exception {
		String url = "orderset/orderset_modify";
		Map<String, Object> dataMap = new HashMap<String, Object>();

		dataMap = orderservice.getOrdersetDetail(session,oNo,cri);
		model.addAttribute("dataMap", dataMap);

		return url;
	}

	@RequestMapping("/orderset_modify")
	public String orderset_modify(InsertOrderSetCommand vo ,HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String oNo = vo.getoNo();
		String url = "redirect:orderset_detail.do";
		orderservice.UpdateOrderset(vo);
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("oNo",oNo);


		return url;
	}

	@RequestMapping("/orderset_remove")
	public String orderset_remove(String oNo ,HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String url = "redirect:orderset_list.do";
		orderservice.deleteOrderset(oNo);

		rttr.addFlashAttribute("from","remove");

		return url;
	}



	@RequestMapping("/ordersetFeedBack_regist")
	public String feedback_detail(OrdersetVO ordersetVO, RedirectAttributes rttr) throws SQLException {
		String oNo = ordersetVO.getoNo();
		String url = "redirect:orderset_detail.do?oNo="+oNo;

		orderservice.insertOrdersetFeedBack(ordersetVO);
		rttr.addFlashAttribute("from", "regist");

		return url;
	}



	@RequestMapping("/go_myorderset_registForm")
	public String go_myorderset_registForm(InsertOrderSetCommand vo, Model model, HttpServletRequest request, RedirectAttributes rttr) {
		String url = "orderset/myorderset_regist";
		model.addAttribute("from", "custom");
		if(vo != null && !vo.equals("")) {
		HttpSession session = request.getSession();
		session.setAttribute("drugSession", vo.getDrugList());
		}

		return url;

	}

	@RequestMapping("/myorderset_registForm")
	public String myorderset_registForm() {
		String url = "orderset/myorderset_regist";
		return url;

	}
	@RequestMapping("/myorderset_regist")
	public String myorderset_regist(InsertOrderSetCommand vo,HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:myorderset_list.do";
		//request.getAttribute("XSSoNoti");
		myorderService.insertMyOrderset(session, vo);
		rttr.addFlashAttribute("from", "regist");
		return url;
		
	}

	@RequestMapping("/myorderset_delete")
	public String myorderset_delete(String moNo, RedirectAttributes rttr) throws Exception {
		String url = "redirect:myorderset_list.do";
		myorderService.deleteMyOrderset(moNo);
		rttr.addFlashAttribute("from", "delete");
		return url;
	}
	
	@RequestMapping("/myorderset_uploadForm")
	public String myorderset_uploadForm() {
		String url = "orderset/myorderset_upload";
		
		return url;
	}
	@RequestMapping("/myorderset_upload")
	public String myorderset_upload(HttpSession session,MyOrderVO vo, RedirectAttributes rttr) throws Exception {
		//String moNo = vo.getMoNo();
		String url = "redirect:orderset_detail.do";
		String oNo = myorderService.uploadMyOrderset(session, vo);
		rttr.addFlashAttribute("from", "upload");
		//rttr.addAttribute("moNo",moNo);
		rttr.addAttribute("oNo",oNo);
		return url;
	}

	@RequestMapping("/myorderset_modifyForm")
	public String myorderset_modifyForm(HttpSession session, String moNo,Model model) throws Exception {
		String url = "orderset/myorderset_modify";
		Map<String,Object> dataMap = myorderService.getMyOrdersetDetail(session, moNo);
		model.addAttribute("dataMap",dataMap );
		
		return url;

	}
	
	@RequestMapping("/myorderset_modify")
	public String myorderset_modify(InsertOrderSetCommand vo, RedirectAttributes rttr) throws Exception {
		String moNo = vo.getMoNo();
		String url = "redirect:myorderset_detail.do";
		myorderService.UpdateMyOrderset(vo);
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("moNo",moNo);
		return url;
		
	}
	@RequestMapping("/myorderset_detail")
	public String myorderset_detail(HttpSession session, String moNo, Model model) throws Exception {
		String url = "orderset/myorderset_detail";
		
		Map<String,Object> dataMap =myorderService.getMyOrdersetDetail(session, moNo);
		model.addAttribute("dataMap",dataMap );
		
		return url;
	}
	
	@RequestMapping("/myorderset_updateResult")
	public String myorderset_updateResult(MyOrderVO vo, RedirectAttributes rttr) throws Exception {
		String moNo = vo.getMoNo();
		String getResult = vo.getRmcheck();
		String url = "redirect:myorderset_detail.do?moNo="+moNo;
		myorderService.updateResult(vo);
		
		if(getResult!=null  && getResult.equals("1")) {
			rttr.addFlashAttribute("from", "update");
		}else {
			rttr.addFlashAttribute("from", "regist");
		}
		
		return url;
	}
	
	@RequestMapping("/myorderset_list")
	public String myorderset_list(SearchCriteria cri,  HttpSession session, Model model) throws SQLException {
		String url = "orderset/myorderset_list";
		DoctorVO doctor = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
		cri.setDId(dId);
		Map<String,Object> map = myorderService.myOrderList(cri);
		model.addAttribute("myOrderList", map.get("myOrderList"));
		model.addAttribute("pageMaker", map.get("pageMaker"));

		return url;

	}


	@RequestMapping("/regist_customize")
	public String regist_customize(String oNo, Model model) throws Exception {
		String url = "orderset/regist_customize";
		List<OrdersetVO> drugList = orderservice.selectDrugList(oNo);
		model.addAttribute("drugList",drugList);
		return url;
	}

	@RequestMapping("/share")
	public String share(Model model) throws Exception {
		String url = "orderset/doctorShare";

		 List<MajorVO> list =doctorService.majorList();
		 model.addAttribute("major", list);

		return url;
	}
	
	@RequestMapping("/MainShareList")
	public String MainShareList(SearchCriteria cri, String dId, Model model) throws Exception {
		String url = "orderset/MainShareList";
		Map<String,Object> map =orderservice.selectShareOrderset(cri, dId);
		 model.addAttribute("dataMap", map);
		
		return url;
	}
	@RequestMapping("/MainReplyList")
	public String MainReplyList(SearchCriteria cri, String dId, Model model) throws Exception {
		String url = "orderset/MainReplyList";
		Map<String,Object> map = orderservice.selectFeedbackMainList(cri ,dId);
		 model.addAttribute("dataMap", map);
		
		return url;
	}
	



}
