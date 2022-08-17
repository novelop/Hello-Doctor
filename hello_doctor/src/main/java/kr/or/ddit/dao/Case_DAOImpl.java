package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.CaseRegistCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CaseFileVO;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.RecomVO;

public class Case_DAOImpl implements Case_DAO{

	private SqlSession session;


	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<CaseVO> selectCase() throws SQLException {
		List<CaseVO> list = session.selectList("Case-Mapper.selectCase");
		return list;
	}


	@Override
	public List<CaseVO> selectCase(SearchCriteria cri) throws SQLException {
		List<CaseVO> list = session.selectList("Case-Mapper.selectCase", cri);
		return list;
	}


	@Override
	public int selectCaseSeqNextValue() throws SQLException {
		int seq_num = session.selectOne("Case-Mapper.selectCaseSeqNextValue");
		return seq_num;
	}


	@Override
	public void insertCase(CaseVO casevo) throws SQLException {
		session.update("Case-Mapper.insertCase", casevo);

	}


	@Override
	public CaseRegistCommand selectCaseByNo(String disNo) throws SQLException {
		CaseRegistCommand command = session.selectOne("Case-Mapper.selectCaseByNo", disNo);
		return command;
	}


	@Override
	public void increaseViewCnt(String disNo) throws SQLException {
		session.update("Case-Mapper.increaseViewCnt", disNo);

	}


	@Override
	public void insertSub(CaseVO casevo) throws SQLException {
		session.update("Case-Mapper.insertSub", casevo);

	}


	// paging
	@Override
	public List<CaseVO> selectSearchCaseList(SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		cri.setPerPageNum(12);
		System.out.println(cri.getPerPageNum());
		RowBounds row = new RowBounds(offset,limit);
		return session.selectList("Case-Mapper.selectSearchCaseList", cri, row);
	}


	@Override
	public int selectSearchCaseListCount(SearchCriteria cri) throws SQLException {

		int count = session.selectOne("Case-Mapper.selectSearchCaseListCount", cri);
		return count;
	}


	@Override
	public void deleteCase(String disNo) throws SQLException {
		session.update("Case-Mapper.deleteCase", disNo);

	}


	@Override
	public void updateCase(CaseRegistCommand command) throws SQLException {
		session.update("Case-Mapper.updateCase", command);

	}


	@Override
	public void updateSubCase(CaseRegistCommand command) throws SQLException {
		session.update("Case-Mapper.updateSubCase", command);

	}


	@Override
	public List<CaseVO> mainBottomShow(CaseVO casevo) throws SQLException {
		List<CaseVO> list = session.selectList("Case-Mapper.mainBottomShow", casevo);
		return list;
	}


	@Override
	public RecomVO recomSelect(RecomVO recomvo) throws SQLException {
		RecomVO recom = (RecomVO) session.selectOne("Case-Mapper.recomSelect", recomvo);
		return recom;
	}


	@Override
	public List<CaseVO> selectMajor(String MaName) throws SQLException {
		List<CaseVO> list = session.selectList("Case-Mapper.selectMajor", MaName);
		return list;
	}


	@Override
	public void recomInsert(RecomVO recomvo) throws SQLException {
		session.update("Case-Mapper.recomInsert", recomvo);

	}


	@Override
	public void recomDelete(RecomVO recomvo) throws SQLException {
		session.update("Case-Mapper.recomDelete", recomvo);

	}


	@Override
	public List<CaseVO> mainTop() throws SQLException {
		List<CaseVO> list = session.selectList("Case-Mapper.mainTop");

		return list;
	}


	@Override
	public List<CaseFileVO> selectFile(String disNo) throws SQLException {
		List<CaseFileVO>list = session.selectList("Case-Mapper.selectFile", disNo);
		return list;
	}


	@Override
	public void updateFile(CaseVO caseVO) throws SQLException {
		session.update("Case-Mapper.updateFile", caseVO);

	}


	@Override
	public int selectCaseFileSeqNextValue() throws SQLException {
		int seq = session.selectOne("Case-Mapper.selectCaseFileSeqNextValue");
		return seq;
	}


	@Override
	public String getFile(CaseFileVO filevo) throws SQLException {
		String file = session.selectOne("Case-Mapper.getFile", filevo);
		return file;
	}


	@Override
	public void deleteFile(String disFileName) throws SQLException {
		session.update("Case-Mapper.deleteFile", disFileName);

	}


	@Override
	public void modifyFile(CaseRegistCommand command) throws SQLException {
		session.update("Case-Mapper.modifyFile", command);

	}





}
