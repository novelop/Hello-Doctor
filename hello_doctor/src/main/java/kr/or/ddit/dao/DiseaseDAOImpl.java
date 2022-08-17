package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

public class DiseaseDAOImpl implements DiseaseDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<String> searchdisease(String deKo) throws SQLException {
			RowBounds rowBounds = new RowBounds(0,5);
			List<String> list = session.selectList("MediReco-Mapper.searchdisease", deKo, rowBounds);


		return list;
	}

	@Override
	public List<String> searchmedicine(String meName) throws SQLException {
		RowBounds rowBounds = new RowBounds(0,5);
		List<String> list = session.selectList("MediReco-Mapper.searchmedicine", meName, rowBounds);
		return list;
	}

}
