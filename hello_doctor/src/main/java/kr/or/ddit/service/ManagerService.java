package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ManagerDoctorListVO;
import kr.or.ddit.exception.OverlapIp;

public interface ManagerService {

	Map<String, Object> doctorListForPage(String dId) throws SQLException;

	// 의사 상태 가져오기
	ManagerDoctorListVO doctorStatus(String dId) throws SQLException;

	// 정직
	void susDoctor(ManagerDoctorListVO doctorvo) throws SQLException;

	// 현직?
	void workDoctor(String dId) throws SQLException;

	// 퇴직
	void retireDoctor(ManagerDoctorListVO doctorvo) throws SQLException;

	// ipList
	Map<String, Object> ipListForPage(ManagerDoctorListVO ipvo) throws SQLException;

	// ip추가
	void ipInsert(ManagerDoctorListVO doctorvo) throws SQLException, OverlapIp;

	List<ManagerDoctorListVO> memberIp(String dId) throws SQLException;

	// ip삭제
	void deleteIp(String dId) throws SQLException;

	// 메인 신규회원가입
	Map<String, Object> mainMemberList()throws SQLException;

	// ipList 상세보기
	ManagerDoctorListVO ipDetail(String ipNo)throws SQLException;

	List<ManagerDoctorListVO> overIp(String dId)throws SQLException;

	// ipManager Ip삭제 비동기
	void ipManagerDeleteIp(ManagerDoctorListVO doctorVO)throws SQLException;
}
