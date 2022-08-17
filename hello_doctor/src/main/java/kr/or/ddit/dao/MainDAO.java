package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.CoFreqVO;
import kr.or.ddit.dto.MainVO;

public interface MainDAO {

	// 메인 나의 환자 상태 리스트
	List<MainVO> mainMyPaintStatus (String dId) throws SQLException;

	// 나의 환자 진료기록 출력
	MainVO mainMyPaintDetail(String mNo) throws SQLException;

	// 환자 특이사항
	MainVO mainPaintIssue(String mNo) throws SQLException;
	//아이체크 해제했을 때
	List<MainVO> allPaintStatus(String dId)throws SQLException;

	//로그인한 의사의 자주찾는 의사 리스트
	List<CoFreqVO> selectCoFreq(String dId)throws SQLException;

	// 메인 환자 정보
	MainVO mainPaienInfo(String mNo) throws SQLException;

	// 메인 특이사항 클릭시 issNo 가져옴
	MainVO mainIssueYN(MainVO vo) throws SQLException;

	// 특이사항 클릭시 읽음 여부 변경
	void issueYnChange(MainVO vo) throws SQLException;

	// 내가 참여 중인 협진 리스트
	List<MainVO> myCodocMno (String dId) throws SQLException;

	// 로그인한 의사의 자주찾는 의사리스트 이름 추가
	List<CoFreqVO> selectCoFreqNameAdd(String dId) throws SQLException;

}
