package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.PatientVO;
import kr.or.ddit.dto.ReservationVO;
import kr.or.ddit.dto.SubTaskVO;

public class PatientDAOImpl implements PatientDAO {
	private SqlSession session;


	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertPatient(PatientVO vo) throws SQLException {
		session.insert("Patient-Mapper.insertPatient", vo);

	}

	@Override
	public void reserveMed(ReservationVO vo) throws SQLException {
		session.insert("Patient-Mapper.reserveMed", vo);

	}

	@Override
	public List<PatientVO> selectAllPatient() throws SQLException {
		List<PatientVO> result = session.selectList("Patient-Mapper.selectAllPatient");
		return result;
	}

	@Override
	public List<SubTaskVO> selectAllSubTask() throws SQLException {
		List<SubTaskVO> result = session.selectList("Patient-Mapper.selectAllSubTask");
		return result;
	}

	@Override
	public void completeSubTask(String subNo) throws SQLException {
		session.update("Patient-Mapper.completeSubTask", subNo);

	}

	@Override
	public List<DoctorVO> selectAllDoc() throws SQLException {
		List<DoctorVO> result = session.selectList("Patient-Mapper.selectAllDoc");
		return result;
	}

	@Override
	public int getPatientSeq() throws SQLException {
		int result = session.selectOne("Patient-Mapper.getPatientSeq");
		return result;
	}

	@Override
	public int getReservationSeq() throws SQLException {
		int result = session.selectOne("Patient-Mapper.getReservationSeq");
		return result;
	}

}
