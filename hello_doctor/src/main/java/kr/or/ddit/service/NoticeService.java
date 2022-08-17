package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ManagerNoticeVO;

public interface NoticeService {

	Map<String, Object> selectNoticeForPage(SearchCriteria cri) throws SQLException;

	ManagerNoticeVO detailNotice(String nNo) throws SQLException;

	// 공지사항 등록
	void insertNotice(ManagerNoticeVO noticeVO) throws SQLException;

	// 공지사항 삭제
	void deleteNotice(String nNo) throws SQLException;

	// 공지사항 수정
	void modifyNotice(ManagerNoticeVO noticeVO) throws SQLException;

	// 팝업 노출
	List<ManagerNoticeVO> popUpNotice() throws SQLException;

	// 팝업창 상세
	ManagerNoticeVO popUpNoticeByNo(String nNo) throws SQLException;


}
