package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.CaseRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CaseFileVO;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.RecomVO;

public interface Case_DAO {

	// paging
	List<CaseVO> selectSearchCaseList(SearchCriteria cri)throws SQLException;
	int selectSearchCaseListCount(SearchCriteria cri)throws SQLException;

	List<CaseVO> selectCase() throws SQLException;
	List<CaseVO> selectCase(SearchCriteria cri) throws SQLException;

	// 시퀀스 다음값 가져오기
	int selectCaseSeqNextValue() throws SQLException;
	// insert case
	void insertCase(CaseVO casevo) throws SQLException;

	// insert subcase
	void insertSub(CaseVO casevo)throws SQLException;

	// detail
	CaseRegistCommand selectCaseByNo(String disNo)throws SQLException;

	// 조회수
	void increaseViewCnt(String disNo)throws SQLException;

	// 삭제
	void deleteCase(String disNo)throws SQLException;

	// 수정
	void updateCase(CaseRegistCommand command)throws SQLException;
	void updateSubCase(CaseRegistCommand command)throws SQLException;

	// 메인화면 최하다 최신순으로 4개만 출력
	List<CaseVO> mainBottomShow(CaseVO casevo)throws SQLException;
	List<CaseVO> mainTop()throws SQLException;
	// 내전공과 일치하는 것만 보기
	List<CaseVO> selectMajor(String maName)throws SQLException;

	// 좋아요 07-18아직 미완성
	RecomVO recomSelect(RecomVO recomvo)throws SQLException;
	void recomInsert(RecomVO recomvo)throws SQLException;
	void recomDelete(RecomVO recomvo)throws SQLException;


	// 파일
	List<CaseFileVO> selectFile(String disNo)throws SQLException;
	void updateFile(CaseVO caseVO)throws SQLException;
	int selectCaseFileSeqNextValue()throws SQLException;
	String getFile(CaseFileVO filevo)throws SQLException;
	// 파일 삭제
	void deleteFile(String disFileName)throws SQLException;
	void modifyFile(CaseRegistCommand command)throws SQLException;
}
