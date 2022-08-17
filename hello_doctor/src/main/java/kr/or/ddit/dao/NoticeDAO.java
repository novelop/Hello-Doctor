package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ManagerNoticeVO;

public interface NoticeDAO {

	List<ManagerNoticeVO> selectNoticeForPage(SearchCriteria cri)throws SQLException;
	int countNoticeForPage(SearchCriteria cri)throws SQLException;

	// 공지사항 등록
	void insertNotice(ManagerNoticeVO noticeVO)throws SQLException;
	// 공지사항 시퀀스 호출
	int noticeSeq()throws SQLException;
	// 공지사항 상세 조회
	ManagerNoticeVO detailNotice(String nNo)throws SQLException;
	// 공지사항 삭제
	void deleteNotice(String nNo)throws SQLException;
	// 공지사항 수정
	void modifyNotice(ManagerNoticeVO noticeVO)throws SQLException;
	// 팝업 노출
	List<ManagerNoticeVO> popUpNotice()throws SQLException;
	// 팝업창 상세
	ManagerNoticeVO popUpNoticeByNo(String nNo)throws SQLException;



}
