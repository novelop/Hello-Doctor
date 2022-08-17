package kr.or.ddit.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.or.ddit.command.MediRegistCommand;
import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.DocuOrderVO;
import kr.or.ddit.dto.MediRecoVO;
import kr.or.ddit.dto.MyOrderListVO;
import kr.or.ddit.dto.PatientVO;
import kr.or.ddit.service.MediRecoService;





@Controller
@RequestMapping("medi")
public class MediController {
	@Resource(name="recoFilePath")
	private String recoFilePath;
	@Autowired
	private MediRecoService mediRecoservice;

	@RequestMapping("form")
	public String main(HttpSession session, Model model) throws Exception {
		String url = "medi/mediForm";
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();



			Map<String, Object> map = mediRecoservice.selectAllReco(dId);

			model.addAttribute("patient", map.get("patient"));
			model.addAttribute("orderset", map.get("orderset"));

		return url;
	}
	@RequestMapping("chart")
	public String chart(Model model, HttpSession session) throws Exception {
		String url="medi/chart";
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
			Map<String,Object> map = mediRecoservice.selectOneReco(dId);

			 model.addAttribute("patient", map.get("patient"));
			 model.addAttribute("orderset", map.get("orderset"));
			 model.addAttribute("pastreco", map.get("pastreco"));
			 model.addAttribute("patientinfo", map.get("patientinfo"));
			 model.addAttribute("taNo", map.get("taNo"));

		return url;
	}
	@RequestMapping("cochart")
	public String cochart(String pNo, String taNo,Model model, HttpSession session ) throws Exception{
		String url="medi/chart";
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();

			Map<String,Object> map = mediRecoservice.selectOneReco(dId);

			 model.addAttribute("patient", map.get("patient"));
			 model.addAttribute("orderset", map.get("orderset"));
			 model.addAttribute("pastreco", map.get("pastreco"));
			 model.addAttribute("patientinfo", map.get("patientinfo"));
			 model.addAttribute("taNo", taNo);
		return url;

	}

	@RequestMapping("detailImg")
	public String detailImg(String mpNo,Model model ) {

		String url = "medi/detailImg";

		model.addAttribute("mpNo", mpNo);
		return url;

	}
	@RequestMapping("pastcooper")
	public String pastcooper() {
		String url = "medi/pastcooper";

		return url;

	}
	@RequestMapping("issueregist")
	public String issueregist() {
		String url = "medi/issueregist";

		return url;


	}
	@RequestMapping("automodify")
	public String automodify() {
		String url = "medi/automodify";

		return url;
	}
	@RequestMapping("webcapture")
	public String webcapture() {
		String url = "medi/webcapture";

		return url;
	}
	@RequestMapping(value = "regist", method = RequestMethod.POST, produces ="text/plain;charset=utf-8")
	public String regist(MediRegistCommand command, HttpSession session)throws Exception {
			String url = "redirect:chart.do";
			System.out.println(command);
			DoctorVO vo = (DoctorVO)session.getAttribute("doctorLogin");
			String dId =vo.getdId();
			String dName = vo.getdName();
			try {
			mediRecoservice.registChart(command, dId,dName);
			}catch (Exception e) {
				// TODO: handle exception
			}

			return url;
	}

	@RequestMapping("getFile")
	public String getFile(String mfNo, Model model)throws Exception {
		String url = "downloadFile";

		String FileName = mediRecoservice.getFile(mfNo);
		model.addAttribute("savedPath", recoFilePath);
		model.addAttribute("fileName", FileName);
		return url;

	}
	@RequestMapping("autoChoose")
	public String autoChoose(HttpSession session, Model model)throws Exception {
		String url = "medi/autoChoose";
		DoctorVO vo = (DoctorVO)session.getAttribute("doctorLogin");
		String dId = vo.getdId();
		List<DocuOrderVO> list = mediRecoservice.selectAllOrder(dId);
		model.addAttribute("docu", list);

		return url;

	}

}
