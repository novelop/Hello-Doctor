package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.HistoryVO;
import kr.or.ddit.dto.LogVO;

public interface HistoryDAO {

	//진료히스토리
	List<HistoryVO> diagnosisHistory(String dId) throws SQLException;
	//협진히스토리
	List<HistoryVO> CooperationHistory(String dId) throws SQLException;

	//진료히스토리 상세보기
	List<HistoryVO> selectbyMno(String mNo) throws SQLException;
	//협진히스토리 상세보기
	List<HistoryVO> selectbyComNo(String comNo) throws SQLException;

	//알림
	List<HistoryVO> alarmList(String dId) throws SQLException;
	//알림 보낸거
	List<HistoryVO> sendList(String dId) throws SQLException;
	//협진요청 온거 상세


	//협진요청 읽은거 표시
	public void readCooperation(String notiNo) throws SQLException;

	//협진요청 응답-> 요청현황으로 보내기



	//공지사항
	List<HistoryVO> NoticeList(String dId) throws SQLException;

	//좋아요
	List<HistoryVO> LikeList(String dId) throws SQLException;
	//댓글
	List<HistoryVO> CommentList(String dId) throws SQLException;

	//로그히스토리
	List<HistoryVO> LogList(String dId) throws SQLException;
	//Case Discussion 상세보기
	List<CaseVO> selectCase() throws SQLException;



	//공지사항 게시판
	List<HistoryVO> Notice(String dId) throws SQLException;
	//읽음표시
	public void readNotice(Map<String, Object> map) throws SQLException;
	//공지사항 상세보기
	public HistoryVO selectNotice(String nNo) throws SQLException;





	//진료히스토리 전체보기
	List<HistoryVO> AllDiagnosis(String dId,SearchCriteria cri) throws SQLException;
	//협진히스토리 전체보기
	List<HistoryVO> AllCooperation(String dId) throws SQLException;

    //진료 히스토리 전체갯수
	int diagnosisListCnt(String dId,SearchCriteria cri)throws SQLException;



	ComRecoVO selecthistoryDetail(String coNo)throws SQLException;

	//로그인-로그아웃로그
	List<LogVO> logHistory(String dId)throws SQLException;


}
