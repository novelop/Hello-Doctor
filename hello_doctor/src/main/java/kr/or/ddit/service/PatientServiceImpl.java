package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.CooperMainDao;
import kr.or.ddit.dao.PatientDAO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.PatientVO;
import kr.or.ddit.dto.ReservationVO;
import kr.or.ddit.dto.SubTaskVO;
import kr.or.ddit.util.MakeSequence;

public class PatientServiceImpl implements PatientService{
	private PatientDAO patientDAO;


	public void setPatientDAO(PatientDAO patientDAO) {
		this.patientDAO = patientDAO;
	}

	@Override
	public void insertPatient(PatientVO vo) throws SQLException {
		int temp = patientDAO.getPatientSeq();
		String pNo = MakeSequence.makeSequence("P", temp);
		vo.setpNo(pNo);
		patientDAO.insertPatient(vo);

	}

	@Override
	public void reserveMed(ReservationVO vo) throws SQLException {
		int temp = patientDAO.getReservationSeq();
		String rsvNo = MakeSequence.makeSequence("R", temp);
		vo.setRsvNo(rsvNo);
		patientDAO.reserveMed(vo);

	}

	@Override
	public List<PatientVO> selectAllPatient() throws SQLException {
		List<PatientVO> result = patientDAO.selectAllPatient();
		return result;
	}

	@Override
	public List<SubTaskVO> selectAllSubTask() throws SQLException {
		List<SubTaskVO> result = patientDAO.selectAllSubTask();
		return result;
	}

	@Override
	public void completeSubTask(String subNo) throws SQLException {

		patientDAO.completeSubTask(subNo);

	}

	@Override
	public List<DoctorVO> selectAllDoc() throws SQLException {
		List<DoctorVO> result = patientDAO.selectAllDoc();
		return result;
	}

}
