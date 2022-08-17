package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.CoFreqVO;
import kr.or.ddit.dto.MainVO;

public interface MainService {

	// 환자 상태 출력
	Map<String, Object> mainMyPaintStatus(String dId) throws SQLException;

	// 환자 진료기록
	Map<String, Object> mainMyPaintDetail(String mNo, String dId) throws SQLException;

	//아이체크 해제했을 때
	List<MainVO> allPaintStatus(String dId)throws SQLException;

	// 즐겨 찾는 협진 리스트
	Map<String, Object> coFreqList (String dId) throws SQLException;

	// 특이사항 읽음 변경
	void issueYnChange(MainVO vo) throws SQLException;

	// 내가 참여중인 협진 리스트
	List<MainVO> myCodocMno (String dId) throws SQLException;

	// 자주 찾는 협진 리스트의 이름 추가
	Map<String, Object> selectCoFreqNameAdd(String dId) throws SQLException;

	List<CoFreqVO> selectDetailCoFreq(String dId)throws SQLException;

}
