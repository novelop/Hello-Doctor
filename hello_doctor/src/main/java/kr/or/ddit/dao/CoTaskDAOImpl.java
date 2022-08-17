package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoTaskVO;
import kr.or.ddit.dto.SubTaskVO;

public class CoTaskDAOImpl implements CoTaskDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ChartFormVO> selectAllReco(String dId) throws SQLException {

			List<ChartFormVO> list = session.selectList("CoTask-Mapper.selectAllReco2", dId);
				System.out.println("co"+list);
			return list;
	}

	@Override
	public CoTaskVO mycotask(String taNo) throws SQLException {
		CoTaskVO vo = session.selectOne("CoTask-Mapper.mycotask", taNo);
		return vo;
	}

	@Override
	public List<SubTaskVO> mySubCoTask(String taNo) throws SQLException {
		List<SubTaskVO> list = session.selectList("CoTask-Mapper.mySubCoTask", taNo);
		return list;
	}


}
