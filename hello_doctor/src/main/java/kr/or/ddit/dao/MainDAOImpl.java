package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CoFreqVO;
import kr.or.ddit.dto.MainVO;

public class MainDAOImpl implements MainDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MainVO> mainMyPaintStatus(String dId) throws SQLException {

		List<MainVO> result = session.selectList("Main-Mapper.mainMyPaintStatus", dId);

		return result;
	}

	@Override
	public MainVO mainMyPaintDetail(String mNo) throws SQLException {

		MainVO result = session.selectOne("Main-Mapper.mainMyPaintDetail", mNo);

		return result;
	}

	@Override
	public MainVO mainPaintIssue(String mNo) throws SQLException {

		MainVO result = session.selectOne("Main-Mapper.mainPaintIssue",mNo);

		return result;
	}

	@Override
	public List<MainVO> allPaintStatus(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Main-Mapper.mainAllPaintStatus",dId);
	}

	@Override
	public List<CoFreqVO> selectCoFreq(String dId) throws SQLException {

		return session.selectList("CooperMain-Mapper.selectCoFreq",dId);
	}

	@Override
	public MainVO mainPaienInfo(String mNo) throws SQLException {

		return session.selectOne("Main-Mapper.mainPaienInfo",mNo);
	}

	@Override
	public MainVO mainIssueYN(MainVO vo) throws SQLException {

		return session.selectOne("Main-Mapper.mainIssueYN",vo);
	}

	@Override
	public void issueYnChange(MainVO vo) throws SQLException {
		session.update("Main-Mapper.issueYnChange",vo);

	}

	@Override
	public List<MainVO> myCodocMno(String dId) throws SQLException {

		List<MainVO> list = session.selectList("Main-Mapper.myCodocMno", dId);
		return list;

	}

	@Override
	public List<CoFreqVO> selectCoFreqNameAdd(String dId) throws SQLException {

		return session.selectList("Main-Mapper.selectCoFreqNameAdd",dId);
	}


}
