package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.CooperMyDao;
import kr.or.ddit.dto.ChartPicFileVO;
import kr.or.ddit.dto.CoDocApproveVO;
import kr.or.ddit.dto.CoDoctorListVO;
import kr.or.ddit.dto.CoFreqVO;
import kr.or.ddit.dto.CoSubTaskVO;
import kr.or.ddit.dto.CoTaskASubVO;
import kr.or.ddit.dto.ComComentVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.LastChartFileVO;
import kr.or.ddit.dto.LastPrescriptVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.MedFileVO;
import kr.or.ddit.dto.MyHistoryCommentVO;
import kr.or.ddit.dto.MyIssueVO;
import kr.or.ddit.dto.ReserveHistoryVO;
import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.util.MakeSequence;
import kr.or.ddit.dto.SelDocVO;

public class CooperMyServiceImpl implements CooperMyService {

	private CooperMyDao cooperMyDao;

	public void setCooperMyDao(CooperMyDao cooperMyDao) {
		this.cooperMyDao = cooperMyDao;
	}

	@Override
	public List<CoTaskASubVO> selectCoTaskList(String coNo) throws SQLException {
		return cooperMyDao.selectCoTaskList(coNo);
	}

	@Override
	public List<ReserveHistoryVO> selectHistoryList(String coNo) throws SQLException {

		return cooperMyDao.selectHistoryList(coNo);
	}

	@Override
	public ComRecoVO selectLast(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectLast(coNo);
	}

	@Override
	public List<LastPrescriptVO> selectLastPrescript(String mNo) throws SQLException {

		return cooperMyDao.selectLastPrescript(mNo);
	}

	@Override
	public List<MyIssueVO> myIssueList(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.myIssueList(coNo);
	}

	@Override
	public List<CoDoctorListVO> coDocList(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.coDocList(coNo);
	}

	@Override
	public List<LastChartFileVO> selectChartFile(String mNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectChartFile(mNo);
	}

	@Override
	public List<ChartPicFileVO> selectChartPicFile(String mNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectChartPicFile(mNo);
	}

	@Override
	public List<ReserveHistoryVO> selectDateHistory(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectDateHistory(map);
	}

	@Override
	public List<CoFreqVO> selectCoFreq(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectCoFreq(dId);
	}

	@Override
	public int insertReserve(CoTaskASubVO coTaskASubVO) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.insertReserve(coTaskASubVO);
	}

	@Override
	public int taNoSEQ() throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.taNoSEQ();
	}

	@Override
	public int tnNoSEQ() throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.tnNoSEQ();
	}

	@Override
	public int insertTaskApprove(CoDocApproveVO coDocApproveVO) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.insertTaskApprove(coDocApproveVO);
	}

	@Override
	public int SubNoSEQ() throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.SubNoSEQ();
	}

	@Override
	public int insertSubTask(CoSubTaskVO coSubTaskVO) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.insertSubTask(coSubTaskVO);
	}

	@Override
	public CoTaskASubVO selectReserveDetail(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectReserveDetail(taNo);
	}

	@Override
	public List<CoSubTaskVO> selectSub(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectSub(taNo);
	}


	@Override
	public int coTaskTaStatus(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.coTaskTaStatus(taNo);
	}

	@Override
	public int taskApproveTnYn(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.taskApproveTnYn(taNo);
	}


	@Override
	public ComRecoVO selecthistoryDetail(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selecthistoryDetail(taNo);
	}

	@Override
	public List<MyHistoryCommentVO> historyCommentList(String mNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.historyCommentList(mNo);
	}

	@Override
	public Map<String, Object> cooperdetail(String dId, String coNo) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();

		// 해당 협진의 전체진료
		List<CoTaskASubVO> selectCoTaskList = cooperMyDao.selectCoTaskList(coNo);
		//dId는 로그인 세션 Id//나만의 task보내기 !
		List<CoTaskASubVO> myTaskList = new ArrayList<CoTaskASubVO>();
		for(CoTaskASubVO vo : selectCoTaskList) {
			if(vo.getdId().equals(dId)) {
					myTaskList.add(vo);
			}
		}
		map.put("myTaskList", myTaskList);

		// 진행도 구하기
		for (CoTaskASubVO vo : selectCoTaskList) {
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
		map.put("coTaskList", selectCoTaskList);

		// 진료히스토리 구하기
		List<ReserveHistoryVO> historyList = cooperMyDao.selectHistoryList(coNo);
		map.put("historyList", historyList);

		// 해당협진 환자의 가장 최근 진료기록
		ComRecoVO selectLast = cooperMyDao.selectLast(coNo);
		map.put("selectLast", selectLast);
		try {
			String mNo = selectLast.getmNo();
			// 의료사진
			List<ChartPicFileVO> chartPicList = cooperMyDao.selectChartPicFile(mNo);
			map.put("chartPicList", chartPicList);
			// 가장최근진료기록에 대한 의료기록 파일정보
			List<LastChartFileVO> chartFileList = cooperMyDao.selectChartFile(mNo);
			map.put("chartFileList", chartFileList);
			// 처방전
			List<LastPrescriptVO> lastPreList = cooperMyDao.selectLastPrescript(mNo);
			System.out.println("처방전==>" + lastPreList);
			map.put("lastPreList", lastPreList);

		} catch (Exception e) {
			map.put("chartPicList", null);
			map.put("chartFileList", null);
			map.put("lastPreList", null);
		}

		// 특이사항리스트
		List<MyIssueVO> myIssueList = cooperMyDao.myIssueList(coNo);
		map.put("myIssueList", myIssueList);
		// 의료진 눌렀을 때 리스트 띄우기
		List<CoDoctorListVO> coDocList = cooperMyDao.coDocList(coNo);
		for (CoDoctorListVO vo : coDocList) {
			// 1:진료중 2:수술 3:자리비움 0:로그아웃
			if (vo.getStatus() == 0)
				vo.setStatusResult("로그아웃");
			if (vo.getStatus() == 1)
				vo.setStatusResult("진료중");
			if (vo.getStatus() == 2)
				vo.setStatusResult("수술중");
			if (vo.getStatus() == 3)
				vo.setStatusResult("자리비움");
		}
		map.put("coDocList", coDocList);
		// 자주찾는 협진 리스트
		List<CoFreqVO> coFreqList = cooperMyDao.selectDetailCoFreq(dId);
		for (CoFreqVO vo : coFreqList) {
			vo.setpRnum(vo.getpRnum().substring(0, 8));
		}
		map.put("coFreqList", coFreqList);
		// 파일 리스트
		List<MedFileVO> medFileList = cooperMyDao.selectAllCoFile(coNo);
		if (medFileList != null && !medFileList.isEmpty()) {
			for (MedFileVO vo : medFileList) {
				String fileName = MakeFileName.parseFileNameFromUUID(vo.getMfFilename(), "\\&\\&");
				vo.setMfFilename(fileName);
			}
		}
		map.put("medFileList", medFileList);
		// 로그 조회
		List<LogHistoryVO> logHistoryList = cooperMyDao.selectAllLog(coNo);
		map.put("logHistory", logHistoryList);

		//coDoc구하기
		String coDoc = cooperMyDao.selectCodoc(coNo);
		map.put("coDoc", coDoc);

		return map;
	}

	@Override
	public int comCoNoSeqNext() throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.comCoNoSeqNext();
	}

	@Override
	public int insertReply(MyHistoryCommentVO vo,String dName) throws SQLException {
		int result = cooperMyDao.insertReply(vo);
		LogHistoryVO logHistoryVO = new LogHistoryVO();

		int seq = cooperMyDao.makeLogSeq();
		String hiNo = MakeSequence.makeSequence("LOG", seq);
		logHistoryVO.setHiNo(hiNo);
		logHistoryVO.setCoNo(vo.getCoNo());
		logHistoryVO.setdName(dName);
		logHistoryVO.setHiCla(2);
		logHistoryVO.setHiContent("진료 기록에 코멘트를 등록하였습니다.");
		logHistoryVO.setHiReference(vo.getComNo());
		cooperMyDao.insertLog(logHistoryVO);

		return result;
	}

	@Override
	public int replyUpdate(Map<String, String> map,String dName) throws SQLException {
		int result = cooperMyDao.replyUpdate(map);
		ComComentVO vo = cooperMyDao.selectAllComComent(map.get("comCoNo"));
		System.out.println(vo);
		LogHistoryVO logHistoryVO = new LogHistoryVO();
		int seq = cooperMyDao.makeLogSeq();
		String hiNo = MakeSequence.makeSequence("LOG", seq);
		logHistoryVO.setHiNo(hiNo);
		logHistoryVO.setCoNo(vo.getCoNo());
		logHistoryVO.setdName(dName);
		logHistoryVO.setHiCla(3);
		logHistoryVO.setHiContent("진료 기록에 코멘트를 수정하였습니다.");
		logHistoryVO.setHiReference(vo.getComNo());
		cooperMyDao.insertLog(logHistoryVO);


		return result ;
	}

	@Override
	public MyHistoryCommentVO selectReply(String comCoNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectReply(comCoNo);
	}

	@Override
	public int replyRemove(String comCoNo,String dName) throws SQLException {
		int result = cooperMyDao.replyRemove(comCoNo);

		ComComentVO vo = cooperMyDao.selectAllComComent(comCoNo);

		LogHistoryVO logHistoryVO = new LogHistoryVO();
		int seq = cooperMyDao.makeLogSeq();
		String hiNo = MakeSequence.makeSequence("LOG", seq);
		logHistoryVO.setHiNo(hiNo);
		logHistoryVO.setCoNo(vo.getCoNo());
		logHistoryVO.setdName(dName);
		logHistoryVO.setHiCla(4);
		logHistoryVO.setHiContent("진료 기록에 코멘트를 삭제하였습니다.");
		logHistoryVO.setHiReference(vo.getComNo());
		cooperMyDao.insertLog(logHistoryVO);


		return result;

	}

	@Override
	public SelDocVO selectDoc(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectDoc(dId);
	}

	@Override
	public List<CoTaskASubVO> task(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.task(map);
	}

	@Override
	public int taskdIdUpdate(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.taskdIdUpdate(map);
	}

	@Override
	public List<CoTaskASubVO> selectMyTaskList(String SessiondId, String coNo) throws SQLException {
		// 해당 협진의 전체진료
		List<CoTaskASubVO> selectCoTaskList = cooperMyDao.selectCoTaskList(coNo);
		// for문 돌려서 내거인것만 가져오기
		List<CoTaskASubVO> selectMyTaskList = new ArrayList<CoTaskASubVO>();
		for (CoTaskASubVO vo : selectCoTaskList) {
			if (vo.getdId().equals(SessiondId)) {
				selectMyTaskList.add(vo);
			}
		}
		return selectMyTaskList;
	}

	@Override
	public void reserveModify(CoTaskASubVO coTaskASubVO) throws SQLException {

		if (coTaskASubVO.getdId().equals(coTaskASubVO.getCoDoc())) {
			coTaskASubVO.setTaStatus(1); // 내가 주치의인경우
		} else {
			coTaskASubVO.setTaStatus(0);// 내가 주치의가아닌경우
		}

		if (coTaskASubVO.getSubName() != null && coTaskASubVO.getSubDate() != null) {
			List<String> subName = coTaskASubVO.getSubName();
			List<String> subDate = coTaskASubVO.getSubDate();
			List<CoSubTaskVO> subTaskList = new ArrayList<CoSubTaskVO>();
			for (int i = 0; i < subName.size(); i++) {
				CoSubTaskVO subTask = new CoSubTaskVO();
				subTask.setTaNo(coTaskASubVO.getTaNo());
				subTask.setSubName(subName.get(i));
				subTask.setSubDate(subDate.get(i));
				subTask.setCoNo(coTaskASubVO.getCoNo());
				subTask.setdId(coTaskASubVO.getdId());
				subTaskList.add(subTask);
			}
			coTaskASubVO.setSubTaskList(subTaskList);
		}

		// 협진예약에 insert!
		// sequence불러오기
		int No = cooperMyDao.taNoSEQ();
		System.out.println("시퀀스taNo==>" + No);
		String taNo = MakeSequence.makeSequence("TA", No);
		coTaskASubVO.setTaNo(taNo);
		System.out.println("coTaskASubVO==>" + coTaskASubVO);
		cooperMyDao.updateReserve(coTaskASubVO);
		// 주치의가 예약한게 아닌경우에 해당! //주치의가 업무등록을 한경우에는 업무승인테이블에 인서트 되지 않는다!
		if (coTaskASubVO.getTaStatus() == 0) {
			// 업무승인에 insert!
			String tnNo = MakeSequence.makeSequence("TN", cooperMyDao.tnNoSEQ());
			CoDocApproveVO coDocApp = new CoDocApproveVO();
			coDocApp.setTnNo(tnNo);
			coDocApp.setTaNo(taNo);
			cooperMyDao.updateTaskApprove(coDocApp);

		}
		List<CoSubTaskVO> subTaskList = coTaskASubVO.getSubTaskList();
		// 하위업무검사에 insert!//하위검사가 있을때
		if (coTaskASubVO.getSubTaskList() != null && !coTaskASubVO.getSubTaskList().isEmpty()) {
			for (CoSubTaskVO subTask : subTaskList) {
				String subNo = MakeSequence.makeSequence("SUB", cooperMyDao.SubNoSEQ());
				subTask.setSubNo(subNo);
				subTask.setTaNo(taNo);
				cooperMyDao.insertSubTask(subTask);
			}
		}
	}

	@Override
	public void reserveDelete(String taNo) throws SQLException {

		cooperMyDao.deleteTaskApprove(taNo);

	}

	@Override
	public void inviteDoc(Map<String, String> dataMap) throws SQLException {
		// TODO Auto-generated method stub
			cooperMyDao.inviteDoc(dataMap);
	}

	@Override
	public void deleteCoTask(String taNo) throws SQLException {
		cooperMyDao.deleteCoTask(taNo);

	}

	@Override
	public List<String> selectCodId(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return cooperMyDao.selectCodId(coNo);
	}

	@Override
	public void coExit(Map<String, String> map) throws SQLException {
			cooperMyDao.coExit(map);
	}

	@Override
	public List<IssueVO> detailAllIssue(String coNo) throws SQLException {
	List<IssueVO>result = cooperMyDao.detailAllIssue(coNo);
		return result;
	}

	@Override
	public List<IssueVO> mainAllIssue(String dId) throws SQLException {
		List<IssueVO>result = cooperMyDao.mainAllIssue(dId);
		return result;
	}

	@Override
	public List<MyHistoryCommentVO> selectAllComment(String dId) throws SQLException {
		List<MyHistoryCommentVO> result = cooperMyDao.selectAllComment(dId);

		return result;
	}

}