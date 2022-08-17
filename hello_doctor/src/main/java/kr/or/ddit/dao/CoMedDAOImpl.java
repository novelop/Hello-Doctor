package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.ComComentVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.NotiVO;


public class CoMedDAOImpl implements CoMedDAO{

	private SqlSession session;
	private CoMedDAO comedDao;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setCo_medDao(CoMedDAO comedDao) {
		this.comedDao = comedDao;
	}

	@Override
	public List<CoMedVO> iCooperation(String dId, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds row = new RowBounds(offset,limit);
		cri.setDId(dId);

		List<CoMedVO> iCooperation = session.selectList("Co_Med-Mapper.iCooperation",cri,row);
		System.out.println("내협진"+iCooperation);
		return iCooperation;
	}


	//전체 협진리스트
	@Override
	public List<CoMedVO> selectAll(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		System.out.println("limit : "+limit);
		RowBounds rowBounds = new RowBounds(offset,limit);

		List<CoMedVO> coopermainlist= session.selectList("Co_Med-Mapper.selectAll",cri,rowBounds);
		return coopermainlist;
	}
	@Override
	public List<CoMedVO> coopermain_doctors(String coNo) throws SQLException {
		List<CoMedVO> coopermain_doctors = session.selectList("Co_Med-Mapper.coopermain_doctors",coNo);
		return coopermain_doctors;
	}

	//페이징...
	@Override
	public int selectSearchCooperationCount(SearchCriteria cri) throws Exception {
		int count = session.selectOne("Co_Med-Mapper.selectSearchListCount",cri);
		return count;
	}

	//나의 전공과 일치
	@Override
	public List<CoMedVO> myCooperation(String maNo,SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		String maName = session.selectOne("Co_Med-Mapper.selectName",maNo);
		List<CoMedVO> myCooperationList = session.selectList("Co_Med-Mapper.myCooperation",maName);
		System.out.println("dao에서!==>"+myCooperationList);
		return myCooperationList;
	}
	@Override
	public List<CoMedVO> myCooperation_doctors(String coNo) throws SQLException {
		System.out.println("dao에서 cono!!!"+coNo);
		List<CoMedVO> myCooperation_doctors = session.selectList("Co_Med-Mapper.myCooperation_doctors",coNo);
		System.out.println("다오에서 doctors불러오기"+myCooperation_doctors);
		return myCooperation_doctors;
	}
	@Override
	public int selectSearchMyCooperationCount(SearchCriteria cri) throws Exception {
		int count = session.selectOne("Co_Med-Mapper.selectSearchMyCooperationCount",cri);
		return count;
	}


	//진행중인 협진리스트
	@Override
	public int selectSearchProceeding(SearchCriteria cri) throws Exception {
		int count = session.selectOne("Co_Med-Mapper.selectSearchProceedingCount",cri);
		return count;
	}
	@Override
	public List<CoMedVO> proceedingCooperation(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		System.out.println("limit : "+limit);
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<CoMedVO> proceedingCooperationlist= session.selectList("Co_Med-Mapper.proceedingCooperation",cri,rowBounds);
		return proceedingCooperationlist;
	}
	@Override
	public List<CoMedVO> proceeding_doctors(String coNo) throws SQLException {
		List<CoMedVO> proceeding_doctors=session.selectList("Co_Med-Mapper.proceeding_doctors",coNo);
		return proceeding_doctors;
	}

	//나의 전공과 일치
	@Override
	public List<CoMedVO> myCooperation_proceeding(String maNo) throws SQLException {
		String maName = session.selectOne("Co_Med-Mapper.selectNameProceeding",maNo);
		List<CoMedVO> myCooperation_proceeding = session.selectList("Co_Med-Mapper.myCooperation_proceeding",maName);
		return myCooperation_proceeding;
	}
	@Override
	public List<CoMedVO> myCooperation_proceedingdoctors(String coNo) throws SQLException {
		List<CoMedVO> myCooperation_proceedingdoctors = session.selectList("Co_Med-Mapper.myCooperation_proceedingdoctors",coNo);
		return myCooperation_proceedingdoctors;
	}

	@Override
	public int selectSearchComplete(SearchCriteria cri) throws Exception {
		int count = session.selectOne("Co_Med-Mapper.selectSearchCompleteCount",cri);
		return count;
	}
	//완료된 협진리스트
	@Override
	public List<CoMedVO> completeCooperation(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		System.out.println("limit : "+limit);
		RowBounds rowBounds = new RowBounds(offset,limit);

		List<CoMedVO> completeCooperationList = session.selectList("Co_Med-Mapper.completeCooperation",cri,rowBounds);
		return completeCooperationList;
	}
	@Override
	public List<CoMedVO> complete_doctors(String coNo) throws SQLException {
		List<CoMedVO> complete_doctors = session.selectList("Co_Med-Mapper.complete_doctors",coNo);
		return complete_doctors;
	}

	//나의 전공과 일치
	@Override
	public List<CoMedVO> myCooperation_complete(String maNo) throws SQLException {
		String maName = session.selectOne("Co_Med-Mapper.selectNameComplete",maNo);
		List<CoMedVO> myCooperation_complete = session.selectList("Co_Med-Mapper.myCooperation_complete",maName);
		return myCooperation_complete;
	}
	@Override
	public List<CoMedVO> myCooperation_completedoctors(String coNo) throws SQLException {
		List<CoMedVO> myCooperation_completedoctors = session.selectList("Co_Med-Mapper.myCooperation_completedoctors",coNo);
		return myCooperation_completedoctors;
	}

	@Override
	public int getCoSeq() throws SQLException {

		int result = session.selectOne("Co_Med-Mapper.getCoSeq");

		return result;

	}

	@Override
	public int getNotiSeq() throws SQLException {
		int result = session.selectOne("Co_Med-Mapper.getNotiSeq");

		return result;
	}

	@Override
	public void registCoMedi(CoMedVO vo) throws SQLException {
		session.insert("Co_Med-Mapper.registCoMedi", vo);
	}

	@Override
	public void registCoDoctor(CoDoctorVO vo) throws SQLException {
		session.insert("Co_Med-Mapper.registCoDoctor", vo);

	}

	@Override
	public void registNoti(NotiVO vo) throws SQLException {
		session.insert("Co_Med-Mapper.registNoti", vo);
	}

	@Override
	public int selectSearchMyProceeding(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int selectSearchMyComplete(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ComRecoVO> selectAllComReco(String coNo) throws SQLException {
		List<ComRecoVO> result = session.selectList("MediReco-Mapper.selectAllComReco", coNo);
		return result;
	}
	@Override
	public List<LogHistoryVO> selectAllLogHistory(String comNo) throws SQLException {

		 List<LogHistoryVO> result = session.selectList("MediReco-Mapper.selectAllLogHistory", comNo);
		return result;
	}
	@Override
	public AttachVO selectAllAttach(String comNo) throws SQLException {

		 AttachVO result = session.selectOne("MediReco-Mapper.selectAllAttach", comNo);

		return result;
	}
	@Override
	public ComComentVO selectAllComComent(String comNo) throws SQLException {
		 ComComentVO result = session.selectOne("MediReco-Mapper.selectAllComComent", comNo);
			return result;
	}

	@Override
	public void insertLogHistroy(LogHistoryVO vo) throws SQLException {
		session.insert("MediReco-Mapper.insertLogHistroy", vo);

	}

	@Override
	public void insertAttach(AttachVO vo) throws SQLException {
		session.insert("MediReco-Mapper.insertAttach", vo);

	}

	@Override
	public void insertComComent(ComComentVO vo) throws SQLException {
		session.insert("MediReco-Mapper.insertComComent", vo);

	}

	@Override
	public int getAttachSeq() throws SQLException {
		int result = session.selectOne("Co_Med-Mapper.getAttachSeq");
		return result;
	}

	@Override
	public int getLogHistorySeq() throws SQLException {
		int result = session.selectOne("Co_Med-Mapper.getLogHistorySeq");
		return result;
	}

	@Override
	public int getComComentSeq() throws SQLException {
		int result = session.selectOne("Co_Med-Mapper.getComComentSeq");
		return result;
	}

	@Override
	public int iCooperationCount(String dId, SearchCriteria cri) throws SQLException {
		cri.setDId(dId);
		return session.selectOne("Co_Med-Mapper.iCooperationCount",cri);
	}

	@Override
	public List<CoMedVO> proceedingCooperationMine(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		System.out.println("limit : "+limit);
		RowBounds rowBounds = new RowBounds(offset,limit);
		 List<CoMedVO> result = session.selectList("Co_Med-Mapper.proceedingCooperationMine", cri,rowBounds );
			return result;
	}

	@Override
	public List<CoMedVO> completeCooperationMine(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		System.out.println("limit : "+limit);
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<CoMedVO> result = session.selectList("Co_Med-Mapper.completeCooperationMine",cri,rowBounds);
		return result;
	}

	@Override
	public int proceedingCooperationMineCount(SearchCriteria cri) throws Exception {
		int count = session.selectOne("Co_Med-Mapper.proceedingCooperationMineCount",cri);
		return count;
	}

	@Override
	public int completeCooperationMineCount(SearchCriteria cri) throws Exception {
		int count = session.selectOne("Co_Med-Mapper.completeCooperationMineCount",cri);
		return count;
	}



}

