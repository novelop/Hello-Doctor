package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.CaseReplyDAO;
import kr.or.ddit.dao.Case_DAO;
import kr.or.ddit.dao.CooperMyDao;
import kr.or.ddit.dao.HistoryDAO;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.HistoryVO;
import kr.or.ddit.dto.LogVO;

public class HistoryServiceImpl implements HistoryService{
	private HistoryDAO historyDAO;
	private Case_DAO casedao;
	private CaseReplyDAO replydao;
	private CooperMyDao cooperMyDao;

	public void setCooperMyDao(CooperMyDao cooperMyDao) {
		this.cooperMyDao = cooperMyDao;
	}


	public void setHistoryDAO(HistoryDAO historyDAO) {
		this.historyDAO = historyDAO;
	}
	public void setCasedao(Case_DAO casedao) {
		this.casedao = casedao;
	}
	public void setReplydao(CaseReplyDAO replydao) {
		this.replydao = replydao;
	}

	@Override
	public List<HistoryVO> diagnosisHistory(String dId) throws SQLException {
		List<HistoryVO> diagnosis = historyDAO.diagnosisHistory(dId);
		
		return diagnosis;
	}

	@Override
	public List<HistoryVO> CooperationHistory(String dId) throws SQLException {
		List<HistoryVO> cooperation = historyDAO.CooperationHistory(dId);
	
		return cooperation;
	}

	@Override
	public List<HistoryVO> selectbyMno(String mNo) throws SQLException {
		List<HistoryVO> selectbyMno = historyDAO.selectbyMno(mNo);
		return null;
	}

	@Override
	public List<HistoryVO> selectbyComNo(String comNo) throws SQLException {

		return null;
	}

	@Override
	public List<HistoryVO> alarmList(String dId) throws SQLException {
		List<HistoryVO> alarm = historyDAO.alarmList(dId);
		return alarm;
	}

	@Override
	public List<HistoryVO> NoticeList(String dId) throws SQLException {
		List<HistoryVO> notice = historyDAO.NoticeList(dId);
		return notice;
	}

	@Override
	public List<HistoryVO> sendList(String dId) throws SQLException {
		List<HistoryVO> send = historyDAO.sendList(dId);
		System.out.println("서비스 보내기"+send);
		return send;
	}


	//공지사항 + 상세보기
	@Override
	public List<HistoryVO> Notice(String dId) throws SQLException {
		List<HistoryVO> notice = historyDAO.Notice(dId);
		return notice;
	}
	@Override
	public HistoryVO selectNotice(String nNo) throws SQLException {
		HistoryVO notice = historyDAO.selectNotice(nNo);
		return notice;
	}

	@Override
	public CaseVO selectCase(String disNo) throws SQLException {
		CaseVO selctCase = casedao.selectCaseByNo(disNo);
		return selctCase;
	}
	@Override
	public void readNotice(Map<String, Object> map) throws SQLException {
		 historyDAO.readNotice(map);
	}
	@Override
	public void readCooperation(String notiNo) throws SQLException {
		historyDAO.readCooperation(notiNo);
	}

	@Override
	public List<HistoryVO> LogHistory(String dId) throws SQLException {
		List<HistoryVO> log = historyDAO.LogList(dId);
		return log;
	}
	@Override
	public Map<String, Object> AllCooperation(SearchCriteria cri,String dId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<HistoryVO> list = historyDAO.AllCooperation(dId);
		int totalCount = list.size();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("list", list);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<HistoryVO> LikeList(String dId) throws SQLException {
		List<HistoryVO> likelist = historyDAO.LikeList(dId);
		return likelist;
	}

	@Override
	public List<HistoryVO> commentList(String dId) throws SQLException {
		List<HistoryVO> commentList = historyDAO.CommentList(dId);
		System.out.println("댓글서비스!"+commentList);
		return commentList;
	}
	@Override
	public Map<String, Object> AllDiagnosis(SearchCriteria cri, String dId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(7);
		List<HistoryVO> list = historyDAO.AllDiagnosis(dId,cri);

		int totalCount = historyDAO.diagnosisListCnt(dId,cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("list", list);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public ComRecoVO selecthistoryDetail(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		return historyDAO.selecthistoryDetail(coNo);
	}

	@Override
	public List<LogVO> logHistory(String dId) throws SQLException {
		List<LogVO> log = historyDAO.logHistory(dId);
		return log;
	}

}
