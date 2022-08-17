package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MainVO;

public class MainComRecoDAOImpl implements MainComRecoDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MainVO> mainComRecoList(String dId) throws SQLException {

		List<MainVO> result = session.selectList("Main-Mapper.mainComRecoList", dId);

		System.out.println("mainComRecoList!~@!~@!~!@~"+result);


		return result;
	}

}
