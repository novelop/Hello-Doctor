package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.PatientVO;
import kr.or.ddit.dto.ReservationVO;
import kr.or.ddit.dto.SubTaskVO;

public interface PatientService {

	void insertPatient(PatientVO vo)throws SQLException;

    void reserveMed(ReservationVO vo)throws SQLException;

    List<PatientVO> selectAllPatient()throws SQLException;

    List<SubTaskVO> selectAllSubTask()throws SQLException;

    void completeSubTask(String subNo)throws SQLException;

    List<DoctorVO> selectAllDoc()throws SQLException;

}
