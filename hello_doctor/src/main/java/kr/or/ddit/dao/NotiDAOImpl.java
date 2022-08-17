package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.NotiVO;

public class NotiDAOImpl implements NotiDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<NotiVO> notiList(String dId) throws SQLException {
		RowBounds row = new RowBounds(0, 3);
			List<NotiVO> result = session.selectList("Noti-Mapper.notiList", dId, row);

		return result;
	}

	@Override
	public int countnoti(String dId) throws SQLException {

		int result = session.selectOne("Noti-Mapper.countnoti", dId);

		return result;
	}

	@Override
	public List<NotiVO> notiAllList(String dId) throws SQLException {
		
		List<NotiVO> result = session.selectList("Noti-Mapper.notiAllList", dId);

		return result;
	}

}
