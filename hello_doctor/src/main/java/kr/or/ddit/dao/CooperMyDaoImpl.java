package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ChartPicFileVO;
import kr.or.ddit.dto.CoDocApproveVO;
import kr.or.ddit.dto.CoDoctorListVO;
import kr.or.ddit.dto.CoFreqVO;
import kr.or.ddit.dto.CoSubTaskVO;
import kr.or.ddit.dto.CoTaskASubVO;
import kr.or.ddit.dto.ComComentVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.LastChartFileVO;
import kr.or.ddit.dto.LastPrescriptVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.MedFileVO;
import kr.or.ddit.dto.MyHistoryCommentVO;
import kr.or.ddit.dto.MyIssueVO;
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.dto.ReserveHistoryVO;
import kr.or.ddit.dto.SelDocVO;
import kr.or.ddit.util.TimeMaximum;

public class CooperMyDaoImpl implements CooperMyDao {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<CoTaskASubVO> selectCoTaskList(String coNo) throws SQLException {
		//해당협진에서 진료리스트
		List<CoTaskASubVO> coTaskSubList = session.selectList("CooperMain-Mapper.selectCoTaskList",coNo);

		/*
		 * //확인용 for(CoTaskASubVO vo : coTaskSubList) {
		 * System.out.println("dao에서 하위업무 리스트 있는지 없는지 체크  "+vo.getSubTaskList());
		 *
		 * }
		 */

        for(CoTaskASubVO vo : coTaskSubList) {
        	HashMap<String,String> map = new HashMap<String, String>();
            map.put("coNo", vo.getCoNo());
            map.put("taNo", vo.getTaNo());
            //하위업무있는지 없는지 구하기
            List<CoSubTaskVO> coSubTaskList = session.selectList("CooperMain-Mapper.selectSubTaskList",map);
            if(coSubTaskList !=null && !coSubTaskList.isEmpty()) {//하위업무가있으면
            	//vo의 List<CoSubTaskVo> subTaskList의 변수에 setting해주기
            	vo.setSubTaskList(coSubTaskList);
            	System.out.println("taNo:"+vo.getTaNo()+"하위업무리스트"+vo.getSubTaskList());
            	//하위업무중에서 Y인것의 갯수(count) 구하고vo에setting 해주기!
            	vo.setSubTaskCount(session.selectOne("CooperMain-Mapper.selectSubYCount",map));

            	System.out.println("Y인것의 갯수"+vo.getSubTaskCount());
            }


        }

		return coTaskSubList;
	}

	@Override
	public List<ReserveHistoryVO> selectHistoryList(String coNo) throws SQLException {
		List<ReserveHistoryVO> result = session.selectList("CooperMain-Mapper.selectHistoryList",coNo);
		for(ReserveHistoryVO vo : result ) {
			vo.setAgo(TimeMaximum.formatTimeString(vo.getComDate()));
			}

		return result;
	}

	@Override
	public ComRecoVO selectLast(String coNo) throws SQLException { //가장 최근 진료기록 구하기
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectLast",coNo);
	}

	@Override
	public List<LastPrescriptVO> selectLastPrescript(String mNo) throws SQLException {

		return session.selectList("CooperMain-Mapper.selectLastPrescript",mNo);
	}

	@Override
	public List<MyIssueVO> myIssueList(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectMyIssueList",coNo);
	}

	@Override
	public List<CoDoctorListVO> coDocList(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.coDocList",coNo);
	}

	@Override
	public List<LastChartFileVO> selectChartFile(String mNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectChartFile",mNo);
	}

	@Override
	public List<ChartPicFileVO> selectChartPicFile(String mNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectChartPicFile",mNo);
	}

	@Override
	public List<ReserveHistoryVO> selectDateHistory(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectDateHistory",map);
	}

	@Override
	public List<CoFreqVO> selectCoFreq(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectCoFreq",dId);
	}

	@Override
	public int insertReserve(CoTaskASubVO coTaskASubVO) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.insertReserve",coTaskASubVO);
	}

	@Override
	public int taNoSEQ() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectCoTaskSeqNext");
	}

	@Override
	public int tnNoSEQ() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectTaskApproveSeqNext");
	}

	@Override
	public int insertTaskApprove(CoDocApproveVO coDocApproveVO) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.insertTaskApprove",coDocApproveVO);
	}

	@Override
	public int SubNoSEQ() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectSubTaskSeqNext");
	}

	@Override
	public int insertSubTask(CoSubTaskVO coSubTaskVO) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.insertSubTask",coSubTaskVO);
	}

	@Override
	public CoTaskASubVO selectReserveDetail(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectReserveDetail",taNo);
	}

	@Override
	public List<CoSubTaskVO> selectSub(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectSub",taNo);
	}

	@Override
	public int coTaskTaStatus(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.coTaskTaStatus",taNo);
	}

	@Override
	public int taskApproveTnYn(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.taskApproveTnYn",taNo);
	}

	@Override
	public ComRecoVO selecthistoryDetail(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selecthistoryDetail",taNo);
	}

	@Override
	public List<MyHistoryCommentVO> historyCommentList(String mNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.historyCommentList",mNo);
	}

	@Override
	public int comCoNoSeqNext() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.comCoNoSeqNext");
	}

	@Override
	public int insertReply(MyHistoryCommentVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.insertReply",vo);
	}

	@Override
	public int replyUpdate(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.replyUpdate",map);
	}

	@Override
	public MyHistoryCommentVO selectReply(String comCoNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectReply",comCoNo);
	}

	@Override
	public int replyRemove(String comCoNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.replyRemove",comCoNo);
	}

	@Override
	public List<MedFileVO> selectAllCoFile(String coNo) throws SQLException {

		return session.selectList("CooperMain-Mapper.selectAllCoFile", coNo);
	}

	@Override
	public SelDocVO selectDoc(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectDoc",dId);
	}

	@Override
	public List<CoTaskASubVO> task(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectTaskList", map);
	}

	@Override
	public int taskdIdUpdate(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("CooperMain-Mapper.taskdIdUpdate",map);
	}

	@Override
	public void updateReserve(CoTaskASubVO vo) throws SQLException {
			session.insert("CooperMain-Mapper.updateReserve", vo);
	}

	@Override
	public void updateTaskApprove(CoDocApproveVO vo) throws SQLException {
		session.insert("CooperMain-Mapper.updateTaskApprove", vo);
	}

	@Override
	public void deleteTaskApprove(String taNo) throws SQLException {
		session.update("CooperMain-Mapper.deleteTaskApprove", taNo);
	}

	@Override
	public void inviteDoc(Map<String, String> map) throws SQLException {
		session.update("CooperMain-Mapper.inviteDoc",map);
	}

	@Override
	public void deleteCoTask(String taNo) throws SQLException {
		session.update("CooperMain-Mapper.deleteCoTask", taNo);
	}

	@Override
	public List<String> selectCodId(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectCodId", coNo);
	}

	@Override
	public void coExit(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		session.update("CooperMain-Mapper.coExit",map);
	}

	@Override
	public void insertLog(LogHistoryVO vo) throws SQLException {
		session.insert("LogHistory-Mapper.insertLog", vo);
	}

	@Override
	public int makeLogSeq() throws SQLException {
		int result = session.selectOne("LogHistory-Mapper.makeLogSeq");

		return result;
	}

	@Override
	public ComComentVO selectAllComComent(String coComNo) throws SQLException {
		ComComentVO result = session.selectOne("CooperMain-Mapper.selectAllComComent",coComNo);
		return result;
	}

	@Override
	public List<LogHistoryVO> selectAllLog(String coNo) throws SQLException {
		List<LogHistoryVO> result = session.selectList("CooperMain-Mapper.selectAllLog",coNo);
		return result;
	}

	@Override
	public List<IssueVO> detailAllIssue(String coNo) throws SQLException {
		List<IssueVO> result =session.selectList("CooperMain-Mapper.detailAllIssue", coNo);
		return result;
	}

	@Override
	public List<IssueVO> mainAllIssue(String dId) throws SQLException {
		List<IssueVO> result =session.selectList("CooperMain-Mapper.selectIssueList", dId);
		return result;
	}

	@Override
	public String selectCodoc(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectCodoc",coNo);
	}

	@Override
	public List<MyHistoryCommentVO> selectAllComment(String dId) throws SQLException {
		List<MyHistoryCommentVO> result = session.selectList("CooperMain-Mapper.selectAllComment", dId);
		return result;
	}

	@Override
	public void notiRead(NotiVO vo) throws SQLException {
		session.update("CooperMain-Mapper.notiRead", vo);

	}

	@Override
	public List<CoFreqVO> selectDetailCoFreq(String dId) throws SQLException {
		List<CoFreqVO> result = session.selectList("CooperMain-Mapper.selectDetailCoFreq", dId);
		return result;
	}

}
