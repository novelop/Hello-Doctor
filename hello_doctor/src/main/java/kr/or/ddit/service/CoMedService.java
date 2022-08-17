package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CoRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CoMedVO;

public interface CoMedService {

	Map<String,Object> iCooperation(SearchCriteria cri,String dId) throws SQLException;

	//전체 협진리스트 주치의 의료진들...
	Map<String, Object> getCooperationMainList(SearchCriteria cri) throws SQLException;
	//사용자의 전공과 일치하는 협진리스트
	Map<String, Object> myCooperation(String dId,SearchCriteria cri) throws SQLException;


	// 진행중인 협진리스트 주치의 의료진들...
	Map<String, Object> proceedingCooperation(SearchCriteria cri) throws SQLException;
	//사용자의 전공과 일치하는 협진리스트
	Map<String, Object> myCooperation_proceeding(String dId,SearchCriteria cri) throws SQLException;


	// 완료된 협진리스트
	Map<String, Object> completeCooperation(SearchCriteria cri) throws SQLException;
	//사용자의 전공과 일치하는 협진리스트
	Map<String, Object> myCooperation_complete(String dId,SearchCriteria cri) throws SQLException;

	//협진 등록
	void coRegist(CoRegistCommand command)throws SQLException;

	List<CoMedVO> proceedingCooperationMine(String dId) throws SQLException;
	List<CoMedVO> completeCooperationMine(String dId) throws SQLException;


}
