package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.HistoryVO;
import kr.or.ddit.dto.LogVO;

public class HistoryDAOImpl implements HistoryDAO{
	private SqlSession session;
	private HistoryDAO historyDAO;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setHistoryDAO(HistoryDAO historyDAO) {
		this.historyDAO = historyDAO;
	}


	@Override
	public List<HistoryVO> diagnosisHistory(String dId) throws SQLException {
		RowBounds row = new RowBounds(0,8);
		List<HistoryVO> diagnosisHistory = session.selectList("History-Mapper.diagnosisList",dId,row);
		System.out.println("난 다오(진료히스토리)"+diagnosisHistory);
		return diagnosisHistory;
	}

	@Override
	public List<HistoryVO> CooperationHistory(String dId) throws SQLException {
		RowBounds row = new RowBounds(0,8);
		List<HistoryVO> CooperationHistory= session.selectList("History-Mapper.CooperationList",dId,row);
		System.out.println("왜 한개만 나와"+CooperationHistory);
		return CooperationHistory;
	}

	@Override
	public List<HistoryVO> selectbyMno(String mNo) throws SQLException {
		List<HistoryVO> diagnosis = session.selectOne("History-Mapper.selectDiagnosisHistory",mNo);
		return diagnosis;
	}

	@Override
	public List<HistoryVO> selectbyComNo(String comNo) throws SQLException {
		List<HistoryVO> Cooperation = session.selectOne("History-Mapper.selectCooperationHistory",comNo);
		return Cooperation;
	}

	@Override
	public List<HistoryVO> alarmList(String dId) throws SQLException {
		RowBounds row = new RowBounds(0,5);
		List<HistoryVO> alarmList = session.selectList("History-Mapper.alarmListFirst",dId,row);
		return alarmList;
	}

	@Override
	public List<HistoryVO> sendList(String dId) throws SQLException {
		RowBounds row = new RowBounds(0,8);
		List<HistoryVO> sendList = session.selectList("History-Mapper.sending",dId,row);
		return sendList;
	}

	@Override
	public List<HistoryVO> NoticeList(String dId) throws SQLException {
		RowBounds row = new RowBounds(0,6);
		List<HistoryVO> NoticeList = session.selectList("History-Mapper.NoticeList",dId,row);
		//System.out.println("공지다오"+NoticeList);

		return NoticeList;
	}

	@Override
	public List<HistoryVO> LikeList(String dId) throws SQLException {
		RowBounds row = new RowBounds(0,5);
		List<HistoryVO> likeList = session.selectList("History-Mapper.LikeList",dId,row);
		return likeList;
	}


	@Override
	public List<CaseVO> selectCase() throws SQLException {
		List<CaseVO> list = session.selectList("Case-Mapper.selectCase");
		return list;
	}

	@Override
	public List<HistoryVO> Notice(String dId) throws SQLException {
		List<HistoryVO> notice = session.selectList("History-Mapper.NoticeBoard",dId);
		return notice;
	}

	@Override
	public HistoryVO selectNotice(String nNo) throws SQLException {
		return session.selectOne("History-Mapper.selectNotice",nNo);
	}

	@Override
	public void readNotice(Map<String, Object> map) throws SQLException {
		 session.update("History-Mapper.updateNotice",map);
	}

	@Override
	public void readCooperation(String notiNo) throws SQLException {
		session.update("History-Mapper.updateCooperation",notiNo);
		System.out.println("사라져라"+notiNo);
	}

	@Override
	public List<HistoryVO> LogList(String dId) throws SQLException {
		List<HistoryVO> logList = session.selectList("History-Mapper.logHistory",dId);
		return logList;
	}


	@Override
	public List<HistoryVO> CommentList(String dId) throws SQLException {
		RowBounds row = new RowBounds(1,5);
		List<HistoryVO> commentList = session.selectList("History-Mapper.commentList",dId,row);

		return commentList;
	}

	@Override
	public List<HistoryVO> AllDiagnosis(String dId,SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds row = new RowBounds(offset,limit);
		cri.setDId(dId);
		List<HistoryVO> AllDiagnosis = session.selectList("History-Mapper.diagnosisHistory",cri,row);
		return AllDiagnosis;
	}

	@Override
	public List<HistoryVO> AllCooperation(String dId) throws SQLException {
		List<HistoryVO> AllCooperation = session.selectList("History-Mapper.AllCooperation",dId);
		System.out.println("협진모두dao"+AllCooperation);
		return AllCooperation;
	}

	@Override
	public int diagnosisListCnt(String dId,SearchCriteria cri) throws SQLException {
		cri.setDId(dId);
		return session.selectOne("History-Mapper.diagnosisListCnt",cri);
	}

	@Override
	public ComRecoVO selecthistoryDetail(String coNo) throws SQLException {

		return session.selectOne("History-Mapper.selectCooperationHistory",coNo);
	}

	@Override
	public List<LogVO> logHistory(String dId) throws SQLException {
		RowBounds row = new RowBounds(0,8);
		List<LogVO> logHistory = session.selectList("History-Mapper.loginlog",dId,row);
		return logHistory;
	}

}
