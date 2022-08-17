package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AdminVO;

public class AdminDAOImpl implements AdminDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public AdminVO selectAdmin() throws SQLException {
		AdminVO vo = session.selectOne("Admin-Mapper.selectAdmin");

		return vo;
	}
}
