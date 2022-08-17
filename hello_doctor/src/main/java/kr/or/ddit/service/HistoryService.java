package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;

import kr.or.ddit.command.ReplyPagingCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.HistoryVO;
import kr.or.ddit.dto.LogVO;
import kr.or.ddit.dto.RecomVO;

public interface HistoryService {

	// 진료히스토리
	List<HistoryVO> diagnosisHistory(String dId) throws SQLException;
	// 협진히스토리
	List<HistoryVO> CooperationHistory(String dId) throws SQLException;

	//진료히스토리 상세보기
	List<HistoryVO> selectbyMno(String mNo) throws SQLException;
	//협진히스토리 상세보기
	List<HistoryVO> selectbyComNo(String comNo) throws SQLException;

	// 알림 -1
	List<HistoryVO> alarmList(String dId) throws SQLException;
	//받음요청기록
	List<HistoryVO> sendList(String dId) throws SQLException;

	// 공지사항
	List<HistoryVO> NoticeList(String dId) throws SQLException;

	// 좋아요
	List<HistoryVO> LikeList(String dId) throws SQLException;
	List<HistoryVO> commentList(String dId) throws SQLException;


	// 로그히스토리
	List<HistoryVO> LogHistory(String dId) throws SQLException;

	//진짜로그
	List<LogVO> logHistory(String dId) throws SQLException;


	public CaseVO selectCase(String disNo) throws SQLException;

	//공지사항게시판
	List<HistoryVO> Notice(String dId) throws SQLException;

	//공지사항상세보기
	public HistoryVO selectNotice(String nNo) throws SQLException;

	//읽음표시
	public void readNotice(Map<String, Object> map) throws SQLException;

	//협진요청 읽음표시
	public void readCooperation(String notiNo) throws SQLException;


	//협진전체보기
	Map<String, Object> AllCooperation(SearchCriteria cri,String dId) throws SQLException;
	//진료히스토리전체보기
	Map<String, Object> AllDiagnosis(SearchCriteria cri,String dId) throws SQLException;


	ComRecoVO selecthistoryDetail (String coNo)throws SQLException;


}
