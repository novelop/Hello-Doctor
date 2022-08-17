package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CaseRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.controller.RegistController;
import kr.or.ddit.dto.CaseFileVO;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.RecomVO;

public interface CaseService {

	List<CaseVO> selectCase() throws SQLException;

	Map<String, Object> getCaseListForPage(SearchCriteria cri) throws Exception;

	// insert
	void insertCase(CaseRegistCommand command)throws SQLException;


	// detail file때문에 공사중 07-22
	Map<String, Object> detailCase(String disNo)throws SQLException;

	//delete
	void deleteCase(String disNo)throws SQLException;

	// 수정
	void updateCase(CaseRegistCommand command)throws SQLException;

	CaseVO getCaseForModify(String disNo)throws SQLException;

	Map<String, Object> mainBottomShow(CaseVO casevo, String dId)throws SQLException;

	// 좋아요
	RecomVO recomSelect(RecomVO recomvo)throws SQLException;
	void recomInsert(RecomVO recomvo)throws SQLException;
	void recomDelete(RecomVO recomvo)throws SQLException;
	String getFile(CaseFileVO filevo)throws SQLException;
	// 수정때 사용
	List<CaseFileVO> selectFile(String disNo)throws SQLException;
	void deleteFile(String disFileName)throws SQLException;
	void updateFile(CaseVO caseVO)throws SQLException;
	void modifyFile(CaseRegistCommand command)throws SQLException;

	// 조회수
	void increaseViewCnt(String disNo)throws SQLException;

}
