package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.DoctorVO;


public class RegistDAOImpl implements RegistDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// major 리스트 출력
	@Override
	public List<String> registMajorList(String word) throws SQLException {
		List<String> list = session.selectList("Regist-Mapper.registMajorList",word);

		return list;
	}

	// 의사 회원가입
	@Override
	public void insertDoctor(DoctorVO vo) throws SQLException {
		session.update("Regist-Mapper.insertDoctor",vo);

	}

	// 전공이름을 가지고 전공 번호로 비교후 DoctorVO에 저장
	@Override
	public String maNameCheck(String maName) throws SQLException {
		String result = session.selectOne("Regist-Mapper.maNameCheck", maName);

		return result;
	}

}
