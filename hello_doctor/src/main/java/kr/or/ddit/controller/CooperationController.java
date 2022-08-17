package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.CoRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.ChartPicFileVO;
import kr.or.ddit.dto.CoDocApproveVO;
import kr.or.ddit.dto.CoFreqVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.CoSubTaskVO;
import kr.or.ddit.dto.CoTaskASubVO;
import kr.or.ddit.dto.CoTaskVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.DidApproveVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.JoinCooperVO;
import kr.or.ddit.dto.LastChartFileVO;
import kr.or.ddit.dto.LastPrescriptVO;
import kr.or.ddit.dto.MajorVO;
import kr.or.ddit.dto.MyHistoryCommentVO;
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.dto.SelDocVO;
import kr.or.ddit.service.CoMedService;
import kr.or.ddit.service.CooperMainService;
import kr.or.ddit.service.CooperMyService;
import kr.or.ddit.service.DoctorService;
import kr.or.ddit.service.MainService;
import kr.or.ddit.service.MediRecoService;
import kr.or.ddit.service.NotiService;
import kr.or.ddit.service.NoticeService;
import kr.or.ddit.service.SchedulerService;

import kr.or.ddit.util.MakeSequence;

@Controller
@RequestMapping("/cooperation") // 대분류
public class CooperationController {

	private static final Logger log = LoggerFactory.getLogger(CooperationController.class);
	HttpSession session = null;

	@Resource(name = "recoFilePath")
	private String recoFilePath;
	@Autowired
	private CooperMainService service;
	@Autowired
	private CooperMyService myService;

	@Autowired
	private CoMedService coMedService;

	@Autowired
	private MediRecoService mediRecoService;
	@Autowired
	private SchedulerService schedulerService;
	@Autowired
	private DoctorService doctorService;

	@Autowired
	private CooperMainService cooperMainService;

	@Autowired
	private NotiService notiService;


	@RequestMapping("/test")
	public String test() {
		String url = "cooperation/test";

		return url;
	}

	@RequestMapping("/request") // 기능
	public String request() {
		String url = "cooperation/request";
		return url;
	}

	@RequestMapping("/requestDeny") // 기능
	public String request_deny() {
		String url = "cooperation/requestDeny";
		return url;
	}

	@RequestMapping("/requestPermit") // 기능
	public String request_permit() {
		String url = "cooperation/requestPermit";
		return url;
	}

	@RequestMapping("/detail")
	public ModelAndView cooperdetail(String coNo, ModelAndView mnv, HttpServletRequest request) throws SQLException {
		String url = "cooperation/cooperdetail";
		// System.out.println("coNo ==>"+coNo);
		// ta_status 1:승인 0:미승인
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();

		Map<String, Object> map = myService.cooperdetail(dId, coNo);
		mnv.addObject("coTaskList", map.get("coTaskList"));
		mnv.addObject("myTaskList",map.get("myTaskList"));
		mnv.addObject("historyList", map.get("historyList"));
		System.out.println("detail==>"+map.get("historyList"));
		mnv.addObject("selectLast", map.get("selectLast"));
		mnv.addObject("chartPicList", map.get("chartPicList"));
		mnv.addObject("chartFileList", map.get("chartFileList"));
		mnv.addObject("lastPreList", map.get("lastPreList"));
		mnv.addObject("myIssueList", map.get("myIssueList"));
		System.out.println("특이사항동기리스트 ==>"+map.get("myIssueList"));
		mnv.addObject("coDocList", map.get("coDocList"));
		mnv.addObject("logHistory", map.get("logHistory"));

		System.out.println("detail==>"+map.get("coDocList"));

		mnv.addObject("coFreqList", map.get("coFreqList"));
		mnv.addObject("medFileList", map.get("medFileList"));
		mnv.addObject("coNo", coNo);
		mnv.addObject("dId", dId);
		mnv.addObject("coDoc",map.get("coDoc"));

		mnv.setViewName(url);
		return mnv;

	}

//전체진료에서 체크박스 눌렀을 때!
	@ResponseBody
	@RequestMapping(value = "/myTaskChecked", method = RequestMethod.POST)
	public ResponseEntity<List<CoTaskASubVO>> myTaskChecked(HttpServletRequest request, String coNo)
			throws SQLException {

		System.out.println("mytaskchecked오나요?");
		System.out.println("controller coNo:" + coNo);
		ResponseEntity<List<CoTaskASubVO>> entity = null; // 해당 협진의 전체진료

		// 해당 협진의 전체진료
		List<CoTaskASubVO> coTaskList = myService.selectCoTaskList(coNo);
		System.out.println("협진번호:" + coNo + "전체진료리스트:" + coTaskList);
		// 진행도 구하기
		for (CoTaskASubVO vo : coTaskList) {
			if (vo.getSubTaskList() != null && !vo.getSubTaskList().isEmpty()) { // 하위업무가있으면
				// 전체 갯수
				int totalSubTask = vo.getSubTaskList().size();
				System.out.println("controller전체갯수:" + totalSubTask);
				System.out.println("controllery인것의 갯수 " + vo.getSubTaskCount());
				// 진행도
				double progress = ((double) vo.getSubTaskCount() / totalSubTask) * 100;

				System.out.println("소숫점" + progress);
				System.out.println("controller진행도" + progress);
				vo.setProgressPercentage((int) progress);
				System.out.println(vo.getProgressPercentage());
			}
		}

		// 세션id랑 리스트의 vo와 같으면 리스트를 넘겨준다. session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		List<CoTaskASubVO> myTaskCheckedList = new ArrayList<CoTaskASubVO>();

		for (CoTaskASubVO vo : coTaskList) {
			if (vo.getdId().equals(dId)) { // 세션 id랑 같으면
				myTaskCheckedList.add(vo);
				System.out.println("taDate==>" + vo.getTaDate());
				System.out.println("진행도==>" + vo.getProgressPercentage());
			}
		}
		System.out.println("myTaskCheckedList" + myTaskCheckedList);
		for(CoTaskASubVO vo : myTaskCheckedList) {
			//세션로그인 아이디 vo에 저장해서 script로 비교해서 색깔다르게 하기 !
			vo.setVodId(dId);
		}
		entity = new ResponseEntity<List<CoTaskASubVO>>(myTaskCheckedList, HttpStatus.OK);
		return entity;
	}



	// 전체진료에서 체크박스 언체크!했을 때
	@ResponseBody
	@RequestMapping(value = "/myTaskUnChecked", method = RequestMethod.POST)
	public ResponseEntity<List<CoTaskASubVO>> myTaskUnChecked(HttpServletRequest request, String coNo)
			throws SQLException {
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		System.out.println("mytaskUnchecked오나요?");
		System.out.println("controller coNo:" + coNo);
		ResponseEntity<List<CoTaskASubVO>> entity = null; // 해당 협진의 전체진료

		// 해당 협진의 전체진료
		List<CoTaskASubVO> coTaskList = myService.selectCoTaskList(coNo);
		System.out.println("협진번호:" + coNo + "전체진료리스트:" + coTaskList);

		// 진행도 구하기
		for (CoTaskASubVO vo : coTaskList) {
			if (vo.getSubTaskList() != null && !vo.getSubTaskList().isEmpty()) { // 하위업무가있으면
				// 전체 갯수
				int totalSubTask = vo.getSubTaskList().size();
				System.out.println("controller전체갯수:" + totalSubTask);
				System.out.println("controllery인것의 갯수 " + vo.getSubTaskCount());
				// 진행도
				double progress = ((double) vo.getSubTaskCount() / totalSubTask) * 100;

				System.out.println("소숫점" + progress);
				System.out.println("controller진행도" + progress);
				vo.setProgressPercentage((int) progress);
				System.out.println(vo.getProgressPercentage());
			}
//세션Id저장해주기
			vo.setVodId(dId);
		}

		System.out.println("myTaskUnCheckedList" + coTaskList + "개수" + coTaskList.size());
		entity = new ResponseEntity<List<CoTaskASubVO>>(coTaskList, HttpStatus.OK);
		return entity;
	}

	@RequestMapping("/main")
	public String main() {
		String url = "cooperation/main";
		return url;
	}

	class SortByFreq implements Comparator<JoinCooperVO> {

		@Override
		public int compare(JoinCooperVO o1, JoinCooperVO o2) {
			// TODO Auto-generated method stub
			return -(o1.getCoFreqYn()).compareTo((String)o1.getCoFreqYn());
		}
	}

	@RequestMapping("/coopermain")
	public ModelAndView coopermain(ModelAndView mnv, HttpServletRequest request, SearchCriteria cri)
			throws SQLException {
		String url = "cooperation/coopermain";
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();

		// 참여중인 협진리스트
		Map<String, Object> dataMap = service.selectCooperList(dId, cri);
		List<JoinCooperVO> cooList = (List<JoinCooperVO>) dataMap.get("cooList");


//		//해당 id가 자주찾는 협진
//		List<CoFreqVO> coFreqList = myService.selectCoFreq(dId);
//		System.out.println("coFreqList==>"+coFreqList);
//		for (JoinCooperVO Joinvo : cooList) {
//			Joinvo.setpRnum(Joinvo.getpRnum().substring(0, 8));
//			String joinCono = Joinvo.getCoNo();
//			for(CoFreqVO Freqvo: coFreqList) {
//				if(joinCono.equals(Freqvo.getCoNo())) {
//					Joinvo.setCoFreqYn("Y");
//				}
//			}
//		}
//		for(JoinCooperVO vo: cooList) {
//			if(vo.getCoFreqYn()==null) {
//				vo.setCoFreqYn("N");
//			}
//		}
//		System.out.println("최종확인==>"+cooList);
//		Collections.sort(cooList, new SortByFreq());
//		System.out.println("dataMap.cooList==>"+cooList);
//		dataMap.put("cooList", cooList);

		mnv.addObject("dataMap", dataMap);
		// 특이사항
		List<IssueVO> issueList = service.selectIssueList(dId);
		for (IssueVO vo : issueList) {
			vo.setpRnum(vo.getpRnum().substring(0, 8));
		}
		mnv.addObject("issueList", issueList);
		// 내가 올린 진료에 달린 코멘트 리스트
		List<MyHistoryCommentVO> historyCommentList = service.selectHistoryComment(dId);
		System.out.println("cooperMain==>"+historyCommentList);
		mnv.addObject("historyCommentList", historyCommentList);
		// 내가받은 협진요청
		List<NotiVO> notiList = service.selectNoti(dId);
		//내가한 협진요청
		List<NotiVO> notiReqList = service.selectRequestNoti(dId);

		// 응답코드 : 0이면 거절 1이면 수락 2이면 보류
		for (NotiVO vo : notiList) {
			if (vo.getResponse() == 0)
				vo.setMysetting("거절");
			if (vo.getResponse() == 1)
				vo.setMysetting("수락");
			if (vo.getResponse() == 2)
				vo.setMysetting("보류");
		}
		for(NotiVO vo: notiReqList) {
			if (vo.getResponse() == 0)
				vo.setMysetting("거절");
			if (vo.getResponse() == 1)
				vo.setMysetting("수락");
			if (vo.getResponse() == 2)
				vo.setMysetting("보류");
		}
		mnv.addObject("notiList", notiList);
		mnv.addObject("notiReqList",notiReqList);
		// 내가 주치의 일 때 승인 요청 의료행위들//받은요청
		List<CoDocApproveVO> approveList = service.selectapproveList(dId);
		System.out.println();
		System.out.println("내가주치의일 때 승인요청 받은 의료행위들" + approveList);
		// tn_status가 1:등록 2:수정 3:삭제
		for (CoDocApproveVO vo : approveList) {
			if (vo.getTnStatus() == 1)
				vo.setTnStatusResult("등록");
			if (vo.getTnStatus() == 2)
				vo.setTnStatusResult("수정");
			if (vo.getTnStatus() == 3)
				vo.setTnStatusResult("삭제");

			vo.setpRnum(vo.getpRnum().substring(0, 8));
		}
		mnv.addObject("approveList", approveList);
		//내가 주치의일때 처리완료한 리스트
		List<CoDocApproveVO>approveCompleteList = service.selectapproveComplete(dId);
		for (CoDocApproveVO vo : approveCompleteList) {
			if (vo.getTnStatus() == 1)
				vo.setTnStatusResult("등록");
			if (vo.getTnStatus() == 2)
				vo.setTnStatusResult("수정");
			if (vo.getTnStatus() == 3)
				vo.setTnStatusResult("삭제");

			if (vo.getTaStatus() == 0)
				vo.setTaStatusResult("미승인");
			if (vo.getTaStatus() == 1)
				vo.setTaStatusResult("수락");
			if (vo.getTaStatus() == 2)
				vo.setTaStatusResult("거절");
			if(vo.getTaStatus()==3) {
				vo.setTaStatusResult("수락");
			}
			if(vo.getTaStatus()==4) {
				vo.setTaStatusResult("삭제완료");
			}
			vo.setpRnum(vo.getpRnum().substring(0, 8));
		}

		for(CoDocApproveVO vo: approveCompleteList) {
			System.out.println("tastatus:"+vo.getTaStatus()+"taStatusResult=>"+vo.getTaStatusResult());

		}

		mnv.addObject("approveCompleteList",approveCompleteList);


		//// 내가 주치의가 아닌 경우 요청한 사항들에 대한 결과값(업무) 환자정보 주상병 주치의 상태(수락 ,거절) //보낸 요청
		List<DidApproveVO> myApproveList = service.selectmyapproveList(dId);
		System.out.println("내가 일반의료진일때 승인 요청한 의료행위들 " + myApproveList);
		// ta_status 1:승인 0:미승인 2:거절
		for (DidApproveVO vo : myApproveList) {
			if (vo.getTaStatus() == 0)
				vo.setTaStatusResult("미승인");
			if (vo.getTaStatus() == 1)
				vo.setTaStatusResult("수락");
			if (vo.getTaStatus() == 2)
				vo.setTaStatusResult("거절");
			if(vo.getTaStatus()==3) {
				vo.setTaStatusResult("수락");
			}
			if(vo.getTaStatus()==4) {
				vo.setTaStatusResult("삭제완료");
			}
			vo.setpRnum(vo.getpRnum().substring(0, 8));
		}
		mnv.addObject("myApproveList", myApproveList);
		System.out.println("coopermainMyApprove==>"+myApproveList);
		mnv.addObject("dId", dId);

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/significantDetail")
	public String significant_detail(String issNo,HttpServletRequest request,Model model) throws SQLException {
		String url = "cooperation/significantDetail";
		System.out.println("특이사항번호==>"+issNo);
		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();

		List<IssueVO> issueList = service.selectIssueList(dId);
		IssueVO returnVO = new IssueVO();

		for(IssueVO vo:issueList) {
			if(vo.getIssNo()!=null) {
			if(vo.getIssNo().equals(issNo)) returnVO = vo;
			}
		}
        //주치의의 이름 구하기
		String coDocName = service.selectCodocName(returnVO.getCoDoc());
		returnVO.setCoDocName(coDocName);
		System.out.println("returnVO==>"+returnVO);
		model.addAttribute("issVO",returnVO);



		return url;
	}

	@RequestMapping("/cooperationRegist")
	public String cooperation_regist(String pNo, String result, Model model) throws SQLException {
		String url = "cooperation/cooperationRegist";

		Map<String, Object> map = mediRecoService.coRegistForm(pNo);
		model.addAttribute("pastreco", map.get("pastreco"));
		model.addAttribute("patientinfo", map.get("patientinfo"));
		if (result != null) {
			if (result.equals("success")) {
				model.addAttribute("result", "success");
			} else if (result.equals("fail")) {
				model.addAttribute("result", "fail");
			}
		}

		return url;
	}

	@RequestMapping("/reservationform")
	public String reservationform(String coNo,String coDoc,Model model) {
		String url = "cooperation/reservationform";
		model.addAttribute("coNo",coNo);
		model.addAttribute("coDoc",coDoc);
		System.out.println("coDoc==>"+coDoc);
		return url;
	}

	@RequestMapping("/reservationModify")
	public String reservationModify(HttpSession session,String taNo, Model model ) throws Exception {
		String url = "cooperation/reservationModify";
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		CoMedVO comedvo = new CoMedVO();
		Map<String, Object> map = mediRecoService.reservationDetail(taNo);

		model.addAttribute("coTask", map.get("coTask"));
		model.addAttribute("subCoTask", map.get("subCoTask"));
		CoTaskVO coTaskVO = (CoTaskVO)map.get("coTask");
		String coNo = coTaskVO.getCoNo();
		Map<String, Object> map2 = schedulerService.TodayMyList(dId);
		List<CoMedVO> selectbox = (List<CoMedVO>)map2.get("selectbox");
		for(CoMedVO vo :selectbox ) {
			if(vo.getCoNo().equals(coNo)) {
				comedvo.setCoNo(vo.getCoNo());
				comedvo.setCoDoc(vo.getCoDoc());
				comedvo.setpName(vo.getpName());
				comedvo.setCoDisease(vo.getCoDisease());
			}
		}
		model.addAttribute("comedvo",comedvo);
		return url;
	}

	@RequestMapping("/cooperationProgress")
	public String cooperation_progress() {
		String url = "cooperation/cooperationProgress";
		return url;
	}

	@RequestMapping("/cooperationRecruit")
	public String cooperation_recruit() {
		String url = "cooperation/cooperationRecruit";
		return url;
	}

	@RequestMapping("/cooperationRequest")
	public String cooperation_request(String notiNo, String mysetting,Model model) throws Exception {
		String url = "cooperation/cooperationRequest";


		Map<String,Object> map =  cooperMainService.cooperationRequest(notiNo);

		model.addAttribute("noti", map.get("notiVO"));
		model.addAttribute("doctor", map.get("doctorList"));
		model.addAttribute("mysetting",mysetting);
		model.addAttribute("notiNo",notiNo);
		System.out.println("noti==>"+map.get("notiVO"));
		System.out.println("doctor==>"+map.get("doctorList"));

		return url;
	}

	@RequestMapping("/cooperationRequestCheck")
	public String cooperationRequestCheck(String notiNo, String mysetting,Model model) throws Exception {
		String url = "cooperation/cooperationRequestCheck";


		Map<String,Object> map =  cooperMainService.cooperationRequest(notiNo);

		model.addAttribute("noti", map.get("notiVO"));
		model.addAttribute("doctor", map.get("doctorList"));

		model.addAttribute("mysetting",mysetting);
		model.addAttribute("notiNo",notiNo);
		System.out.println("noti==>"+map.get("notiVO"));
		System.out.println("doctor==>"+map.get("doctorList"));

		return url;
	}

	@RequestMapping("/reservationDetail")
	public String reservationDetail(String taNo,String from, Model model) throws Exception {
		String url = "cooperation/reservationDetail";

		Map<String, Object> map = mediRecoService.reservationDetail(taNo);
		if(from != null && !from.equals("")) {
			model.addAttribute("from", "delete");
		}
		model.addAttribute("coTask", map.get("coTask"));
		model.addAttribute("subCoTask", map.get("subCoTask"));
		model.addAttribute("dName", map.get("dName"));

		return url;
	}


	@RequestMapping("/reserveDetail")
	public String reserveDetail(String taNo,Model model)throws Exception{
		String url =  "cooperation/reserveDetail";
		// 진료상세!
		CoTaskASubVO reserveDetail = myService.selectReserveDetail(taNo);
		// 하위업무구하기!
		List<CoSubTaskVO> selectSub = myService.selectSub(taNo);
		System.out.println("특정진료상세보기에서 ==>"+reserveDetail);
		System.out.println("특정진료 상세보기에서 ==>" + selectSub);

        model.addAttribute("reserveDetail", reserveDetail);
		model.addAttribute("selectSub", selectSub);
		return url;
	}




	@RequestMapping("/historyDetail")
	public String history_detail(String comNo,Model model,HttpSession session) throws SQLException {
		String url = "cooperation/historyDetail";
		//현재로그인한 사람 정보가져오기
		DoctorVO vo = (DoctorVO) session.getAttribute("doctorLogin");
		model.addAttribute("vo",vo);

		//진료기록가져오기
	ComRecoVO historyDetail =	myService.selecthistoryDetail(comNo);
	model.addAttribute("historyDetail",historyDetail);
	try {
		String mNo = historyDetail.getmNo();
		// 의료사진
		List<ChartPicFileVO> chartPicList = myService.selectChartPicFile(mNo);
		model.addAttribute("chartPicList", chartPicList);
		// 가장최근진료기록에 대한 의료기록 파일정보
		List<LastChartFileVO> chartFileList = myService.selectChartFile(mNo);
		model.addAttribute("chartFileList", chartFileList);
		// 처방전
		List<LastPrescriptVO> lastPreList = myService.selectLastPrescript(mNo);
		System.out.println("처방전==>" + lastPreList);
		model.addAttribute("lastPreList", lastPreList);
		//해당진료의 댓글 list
		List<MyHistoryCommentVO> commentList = myService.historyCommentList(mNo);
		model.addAttribute("commentList",commentList);
		System.out.println("commentList==>"+commentList);

	}catch(Exception e) {
     model.addAttribute("chartPicList", null);
      model.addAttribute("chartFileList", null);
      model.addAttribute("lastPreList", null);
      model.addAttribute("commentList",null);
	}


		return url;
	}



	@RequestMapping("replyRegist")
	public String replyRegist(MyHistoryCommentVO vo,RedirectAttributes rttr, HttpSession session) throws Exception{
		String url="redirect:/cooperation/historyDetail.do";
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
		String dName = doctorVO.getdName();
		String taNo = vo.getTaNo();
		System.out.println("replyRegist==>"+taNo);
	//	rttr.addAttribute("taNo",taNo);
		rttr.addAttribute("comNo",vo.getComNo());
		System.out.println("replyRegistvo==>"+vo);
		int seq = myService.comCoNoSeqNext();
		String comCoNo = MakeSequence.makeSequence("COMCO",seq);
		vo.setComCoNo(comCoNo);
		try {
			int cnt = myService.insertReply(vo,dName);
			if(cnt ==1) {
				System.out.println("댓글 인서트 성공!");
			}else {
				System.out.println("댓글 인서트 실패!");
			}

		}catch(Exception e) {
				url="cooperation/replyFail";
		}

		return url;
	}

@ResponseBody
@RequestMapping(value="/replyUpdate",method=RequestMethod.POST)
public ResponseEntity<MyHistoryCommentVO>replyUpdate(@RequestBody Map<String,String> map, HttpSession session)throws Exception{
	ResponseEntity<MyHistoryCommentVO> entity = null;
	System.out.println("map.getcomConNO==>"+map.get("comCoNo"));
	System.out.println("map.getcomContent==>"+map.get("comContent"));
	String comCoNo = map.get("comCoNo");
//업데이트 보내기~
	DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
	String dName = doctorVO.getdName();
try{
	int cnt = myService.replyUpdate(map,dName);
	System.out.println("replyUpdate결과 ==>"+cnt);
	//historyvo 가져오기!
	MyHistoryCommentVO comment = myService.selectReply(comCoNo);
	entity = new ResponseEntity<MyHistoryCommentVO>(comment,HttpStatus.OK);

}catch(Exception e) {
entity = new ResponseEntity<MyHistoryCommentVO>(HttpStatus.BAD_REQUEST);
}
return entity;
}

@ResponseBody
@RequestMapping(value="/replyRemove",method=RequestMethod.POST)
public ResponseEntity<Map<String,String>> replyRemove(@RequestBody Map<String, String> map,HttpSession session)throws Exception{
	ResponseEntity<Map<String,String>>  entity = null;
	Map<String,String> dataMap = new HashMap<String,String>();
    String comCoNo = map.get("comCoNo");
    System.out.println("replyRemove==>"+comCoNo);
    DoctorVO doctorVO = (DoctorVO)session.getAttribute("doctorLogin");
	String dName = doctorVO.getdName();
    int cnt = myService.replyRemove(comCoNo, dName);
    if(cnt==1) {
    	dataMap.put("result", "1");
		entity = new ResponseEntity<Map<String,String>>(dataMap,HttpStatus.OK);
    }else {
    	entity = new ResponseEntity<Map<String,String>>(HttpStatus.BAD_REQUEST);
    }

    return entity;

}
	@RequestMapping("/doctorInvite")
	public String doctor_invite(Model model) throws Exception {
		String url = "cooperation/doctorInvite";

		List<MajorVO> list = doctorService.majorList();
		model.addAttribute("major", list); //동기에서 메이져리스트 뽑는다!
		System.out.println("doctorInvite==>"+list);
		return url;
	}



	@RequestMapping("/doctorInvite2") //협진상세에서 초대할 때!
	public String doctor_invite2(Model model,String coNo,String dId) throws Exception {
		String url = "cooperation/doctorInvite2";

		System.out.println("docInvite2 coNo==>"+coNo);
		System.out.println("docInvite2 dId==>"+dId);
		List<MajorVO> list = doctorService.majorList();
		model.addAttribute("major", list); //동기에서 메이져리스트 뽑는다!
		model.addAttribute("dId",dId);//초대하는 사람dId(로그인세션dId)
		model.addAttribute("coNo",coNo);//어떤 협진에 대해서 초대하는가

		System.out.println("doctorInvite==>"+list);
		return url;
	}

	@ResponseBody
	@RequestMapping(value="/doctorInviteFunc", method=RequestMethod.POST)
	public ResponseEntity<String>doctorInviteFunc(@RequestBody Map<String,Object>map)throws Exception{
		ResponseEntity<String> entity = null;
		Map<String,String> dataMap = null;
		String coNo = (String) map.get("coNo");
		String dId = (String) map.get("dId");//요청한 사람!
		List<String> addDoc = (List<String>) map.get("addDoc");//요청을 당한 사람 리스트

		try {

		for(String Id : addDoc) {
				dataMap = new HashMap<String, String>();
				dataMap.put("dId", Id);
				dataMap.put("coNo", coNo);
				myService.inviteDoc(dataMap);
		}
		entity = new ResponseEntity<String>("Hi",HttpStatus.OK);

		}catch(Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("entity==>"+entity);




return entity;
	}




//@RequestMapping("/chartform")
//public String chartForm(Model model,HttpSession session) throws Exception {
//	String url = "cooperation/chart";
//
//	DoctorVO vo = (DoctorVO)session.getAttribute("doctorLogin");
//	String dId = vo.getdId();
//
//	Map<String,Object> map = doctorService.coworkerList(dId);
//	model.addAttribute("major", map.get("major"));
//	model.addAttribute("coworker", map.get("coworker"));
//
//	return url;
//}








	@RequestMapping("/doctorDetail")
	public String doctor_detail(String dId,String coNo,Model model,HttpServletRequest request) throws SQLException {
		String url = "cooperation/doctordetail";
     SelDocVO docDetail = myService.selectDoc(dId);
     Map<String,String> map = new HashMap<String, String>();
     map.put("dId", dId);
     map.put("coNo", coNo);
    List<CoTaskASubVO> taskList = myService.task(map);
    session = request.getSession();
	DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
	String sessiondId = doctorLogin.getdId(); //로그인dId
    model.addAttribute("docDetail",docDetail);

    System.out.println("docDetail==>"+docDetail);

    model.addAttribute("taskList",taskList);
    model.addAttribute("coNo",coNo);
    model.addAttribute("dId",dId);//해당의료진의dId(리스트에서 내가 누른 의료진)
    model.addAttribute("sessiondId",sessiondId);
		return url;
	}

	@RequestMapping("/takeover") //인수인계폼으로 이동(인수인계할 리스트 나열)
	public String takeover(String coNo , String dId,HttpServletRequest request,Model model,String from) throws SQLException  {
		String url = "cooperation/takeover";

		session = request.getSession();
		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String sessiondId = doctorLogin.getdId(); //로그인dId
		//나의 진료 구하기
		//Map<String, Object> map = myService.cooperdetail(sessiondId, coNo);


		if(from !=null) {
			model.addAttribute("from","success");
		}
		List<CoTaskASubVO> selectMyTaskList  = myService.selectMyTaskList(sessiondId, coNo);
		String dName = cooperMainService.selectCodocName(dId);

		model.addAttribute("coTaskList",selectMyTaskList);
		model.addAttribute("dId",dId);//선택된 의료진의 dId
		model.addAttribute("dName",dName);//선택된 의료진의 dName
		model.addAttribute("coNo",coNo);

		System.out.println("takeovercoTaskList==>"+selectMyTaskList);
		return url;
	}


	@RequestMapping("/takeoverRegist")//인수인계 등록!
	public String takeoverRegist(@RequestParam(value="taNo",required=true)List<String>taNos,String dId,String coNo
			,RedirectAttributes rttr
			)throws SQLException{

		String url = "redirect:takeover.do";
		System.out.println("takeover배열==>"+taNos);
System.out.println("인계를 요청받은 의료진 Id"+dId);
System.out.println("coNo==>"+coNo);
Map<String,String> map = new HashMap<String, String>();
for(String taNo: taNos) {
	map.put("dId", dId);
	map.put("taNo",taNo);
	myService.taskdIdUpdate(map);
}

rttr.addAttribute("coNo",coNo);
rttr.addAttribute("dId",dId);
rttr.addAttribute("from","Regist");



		return url;
	}




	@RequestMapping("/cooperover")
	public String cooperover() {
		String url = "cooperation/cooperover";
		return url;
	}

//등록
	@RequestMapping("/approveRegistDetail")
	public String approve_regist_detail(String taNo,String tnNo, Model model,HttpSession session) throws Exception {
		String url = "cooperation/approveReservationDetail";
       //진료상세!
//		CoTaskASubVO reserveDetail =  myService.selectReserveDetail(taNo);
//		model.addAttribute("reserveDetail",reserveDetail);
//		//하위업무구하기!
//       List<CoSubTaskVO> selectSub = myService.selectSub(taNo);
//       model.addAttribute("tnNo",tnNo);
//       model.addAttribute("selectSub",selectSub);
//       System.out.println("특정진료 상세보기에서 ==>"+selectSub);
   	DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
	String dId = doctorLogin.getdId();
	CoMedVO comedvo = new CoMedVO();
	Map<String, Object> map = mediRecoService.reservationDetail(taNo);

	model.addAttribute("reserveDetail", map.get("coTask"));
	model.addAttribute("selectSub", map.get("subCoTask"));
	CoTaskVO coTaskVO = (CoTaskVO)map.get("coTask");
	String coNo = coTaskVO.getCoNo();
	Map<String, Object> map2 = schedulerService.TodayMyList(dId);
	List<CoMedVO> selectbox = (List<CoMedVO>)map2.get("selectbox");
	for(CoMedVO vo :selectbox ) {
		if(vo.getCoNo().equals(coNo)) {
			comedvo.setCoNo(vo.getCoNo());
			comedvo.setCoDoc(vo.getCoDoc());
			comedvo.setpName(vo.getpName());
			comedvo.setCoDisease(vo.getCoDisease());
		}
	}
	model.addAttribute("comedvo",comedvo);
	model.addAttribute("tnNo",tnNo);




		return url;
	}
//주치의가 수 락 버튼을 눌렀을 경우
	@RequestMapping("reserveYes")
	public String reserveYes(String taNo)throws SQLException{
			String url = "cooperation/reserveYes";
			//해당 taNo가 레퍼런스를 가지는지 안가지는지 체크
			String  taReference =cooperMainService.checkReferTaNo(taNo); //수정의 경우라면 referencetaNo를 가진다!
			//삭제의 경우 해당 taNo를 가진 approve에서 tn_status가 3이고 tn_yn이 'N'이다//해당 업무의 tn_status가 3이면 삭제인것!
			int checkRemove = cooperMainService.checkRemove(taNo);
			if(checkRemove ==3) {//삭제의 경우==>tastatus를 4로한다 !
					cooperMainService.updateRemoveStatus(taNo);
				return url;
			}else {
			try {
			myService.coTaskTaStatus(taNo);
			myService.taskApproveTnYn(taNo);
			if (taReference != null) {// 수정의 경우 레퍼런스 tano
				cooperMainService.updateReferStatus(taReference);
			}
		} catch (Exception e) {
			url = "cooperation/reserveFail";
		}
			return url;
		}
	}


	// 수정
	@RequestMapping("/approveModifyDetail")
	public String approve_modify_detail() {
		String url = "cooperation/approveModifyDetail";
		return url;
	}

	// 삭제
	@RequestMapping("/approveDeleteDetail")
	public String approve_delete_detail() {
		String url = "cooperation/approveDeleteDetail";
		return url;
	}

	// 협진 생성
	@RequestMapping("regist")
	public String regist(CoRegistCommand command, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:cooperationRegist.do";
		DoctorVO vo = (DoctorVO) session.getAttribute("doctorLogin");
		try {
			String dId = vo.getdId();
			command.setdId(dId);
			coMedService.coRegist(command);
			rttr.addFlashAttribute("result", "success");
		} catch (Exception e) {
			rttr.addFlashAttribute("result", "fail");
		}
		return url;
	}
	//의료행위(진료)생성
		@RequestMapping("reserveRegist") //받은 것 regist하는 것!
		public String reserveRegist(CoTaskASubVO coTaskASubVO ,HttpSession session, RedirectAttributes rttr)throws Exception{
			//String url = "redirect:detail.do";
			String url = "cooperation/myreserveSuccess";
			try {
			//System.out.println("reserveREgist 오나요");
			DoctorVO vo = (DoctorVO) session.getAttribute("doctorLogin");
			coTaskASubVO.setdId(vo.getdId());
			//주치의가 직접 예약하는 경우에는 승인받을 필요없이 바로 승인으로 처리된다~!
			 //ta_status 1:승인 0:미승인
			if(coTaskASubVO.getdId().equals(coTaskASubVO.getCoDoc())) {
				coTaskASubVO.setTaStatus(1); //내가 주치의인경우
			}else {
				coTaskASubVO.setTaStatus(0);//내가 주치의가아닌경우
			}

			if(coTaskASubVO.getSubName() !=null &&coTaskASubVO.getSubDate()!=null) {
					List<String>subName = coTaskASubVO.getSubName();
					List<String> subDate = coTaskASubVO.getSubDate();
					List<CoSubTaskVO> subTaskList = new ArrayList<CoSubTaskVO>();
				for(int i =0;i<subName.size() ;i++) {
					CoSubTaskVO subTask = new CoSubTaskVO();
					subTask.setTaNo(coTaskASubVO.getTaNo());
					subTask.setSubName(subName.get(i));
					subTask.setSubDate(subDate.get(i));
					subTask.setCoNo(coTaskASubVO.getCoNo());
					subTask.setdId(vo.getdId());
					subTaskList.add(subTask);
				}
				coTaskASubVO.setSubTaskList(subTaskList);
	}

			System.out.println("제대로 셋팅이 되었나?"+coTaskASubVO);
			//협진예약에 insert!
			//sequence불러오기
			int No = myService.taNoSEQ();
			System.out.println("시퀀스taNo==>"+No);
	        String taNo = MakeSequence.makeSequence("TA",No);
			coTaskASubVO.setTaNo(taNo);
			System.out.println("coTaskASubVO==>"+coTaskASubVO);
	        int cnt = myService.insertReserve(coTaskASubVO);
	        if(cnt ==1) {
	        	System.out.println("예약인서트성공");
	        }else {
	        	System.out.println("인서트실패");
	        }
			// 주치의가 예약한게 아닌경우에 해당! //주치의가 업무등록을 한경우에는 업무승인테이블에 인서트 되지 않는다!
			if (coTaskASubVO.getTaStatus() == 0) {
				// 업무승인에 insert!
				String tnNo = MakeSequence.makeSequence("TN", myService.tnNoSEQ());
				CoDocApproveVO coDocApp = new CoDocApproveVO();
				coDocApp.setTnNo(tnNo);
				coDocApp.setTaNo(taNo);
				cnt = myService.insertTaskApprove(coDocApp);
				if (cnt == 1) {
					System.out.println("업무승인인서트성공");
				} else {
					System.out.println("인서트실패");
				}
			}
			List<CoSubTaskVO> subTaskList = coTaskASubVO.getSubTaskList();
	        //하위업무검사에 insert!//하위검사가 있을때
			if(coTaskASubVO.getSubTaskList() !=null &&!coTaskASubVO.getSubTaskList().isEmpty()) {
				for(CoSubTaskVO subTask: subTaskList) {
					String subNo = MakeSequence.makeSequence("SUB", myService.SubNoSEQ());
					subTask.setSubNo(subNo);
					subTask.setTaNo(taNo);
					System.out.println("subTask확인==>"+subTask);
				cnt=myService.insertSubTask(subTask);
				if(cnt==1) {
					System.out.println("하위업무 인서트 성공!");
				}else {
					System.out.println("하위업무 인서트 실패!");
				}

				}

			}

			}catch(Exception e) {
					url= "cooperation/myreserveFail";
			}


	return url;
		}

//의료행위(진료)수정
	@RequestMapping("reserveModify")
	public String reserveModify(CoTaskASubVO coTaskASubVO ,HttpSession session, RedirectAttributes rttr)throws Exception{
		//String url = "redirect:detail.do";
		String url = "redirect:reservationModify.do";
		DoctorVO vo = (DoctorVO) session.getAttribute("doctorLogin");
		coTaskASubVO.setdId(vo.getdId());
		myService.reserveModify(coTaskASubVO);

		rttr.addAttribute("taNo",coTaskASubVO.getTaNo());
		rttr.addAttribute("from", "modify");

		return url;
	}
//의료행위(진료)삭제
	@RequestMapping("reservationDelete")
	public String reservationDelete(String  taNo, String coDoc, RedirectAttributes rttr)throws Exception{
		String url = "redirect:reservationDetail.do";
		if(coDoc != null && !coDoc.equals("")) {
			myService.deleteCoTask(taNo);
		}else {
		myService.reserveDelete(taNo);}
		rttr.addAttribute("taNo", taNo);
		rttr.addAttribute("from", "delete");

		return url;
	}
	@RequestMapping("reserveDelete") //받은 것 regist하는 것!
	public String reserveDelete(String taNo)throws Exception{
		String url = "cooperation/myreserveSuccess";
		myService.reserveDelete(taNo);
		return url;
	}








	@RequestMapping("getFile")
	public String getFile(String mfNo, Model model) throws Exception {
		String url = "downloadFile";

		String FileName = mediRecoService.getFile(mfNo);
		model.addAttribute("savedPath", recoFilePath);
		model.addAttribute("fileName", FileName);

		return url;

	}
	@RequestMapping("detailImg")
	public String detailImg(String mpNo,Model model ) {

		String url = "cooperation/detailImg";

		model.addAttribute("mpNo", mpNo);
		return url;

	}
	@RequestMapping("issueAllList")
	public String issueAllList(String coNo,Model model ) throws Exception {

		String url = "cooperation/issueListForm";
		List<IssueVO> list = myService.detailAllIssue(coNo);
		model.addAttribute("issue", list);


		return url;
	}
	@RequestMapping("mainAllIssue")
	public String mainAllIssue(HttpSession session,Model model ) throws Exception {

		String url = "cooperation/issueMainListForm";

		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		List<IssueVO> list = myService.mainAllIssue(dId);
		model.addAttribute("issue", list);

		return url;
	}

	@RequestMapping("commentMainListForm")
	public String selectAllComment(HttpSession session,Model model ) throws Exception {

		String url = "cooperation/commentMainListForm";

		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		List<MyHistoryCommentVO> list = myService.selectAllComment(dId);
		model.addAttribute("comment", list);

		return url;
	}

	//협진 요청 전체 조회
	@RequestMapping("notiAllList")
	public String notiAllList(HttpSession session, Model model) throws Exception{

		String url = "cooperation/coRequestListForm";

		DoctorVO doctorLogin = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctorLogin.getdId();
		List<NotiVO> noti = notiService.notiAllList(dId);

		model.addAttribute("noti", noti);

		return url;
	}



}
