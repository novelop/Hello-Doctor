package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.HospitalIpVO;

public class HospitalIpDAOImpl implements HospitalIpDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<HospitalIpVO> blockHospitalIp() throws SQLException {
		List<HospitalIpVO> result =  session.selectList("Doctor-Mapper.blockHospitalIp");

		return result;
	}

}
