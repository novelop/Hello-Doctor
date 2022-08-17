package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.OtherDoctorCommand;
import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoworkerVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;

public interface DoctorDAO {

	DoctorVO doctorLogin(DoctorVO vo)throws SQLException;

	DoctorVO getDoctor(DoctorVO vo)throws SQLException;

	DoctorVO profileChange(DoctorVO vo)throws SQLException;
	String searchDoctorName(String dId)throws SQLException;
	DoctorVO selectDoctorVO(String dId) throws SQLException;
	List<MajorVO> majorList()throws SQLException;
	List<MajorVO> majorDoctors(MajorVO vo)throws SQLException;
	MajorVO detailDoctor(String doId)throws SQLException;
	List<CoDoctorVO> coDoctor(OtherDoctorCommand command)throws SQLException;

	void doctorStatusReset (String dId) throws SQLException;

	void doctorStatusStart (String dId) throws SQLException;

	// 아이디 찾기
	String findId(Map<String, String>dataMap) throws SQLException;

	// 비밀번호 찾기
	String findpass(Map<String, String>dataMap) throws SQLException;

	// 메일 전송
	String sendMail(Map<String, String>dataMap) throws SQLException;

	// 비밀번호 수정
	void modifyPass(Map<String, String>dataMap) throws SQLException;

	// 전체 의사 ID 및 PASS 출력
	List<Map<String,String>> allDoctor(String dId) throws SQLException;


	List<CoworkerVO> coworkerList(String dId) throws SQLException;

	void addCoworker(CoworkerVO vo)throws SQLException;
	void deleteCoworker(CoworkerVO vo)throws SQLException;

	//전체의사 정보 조회
	List<DoctorVO> selectAllDoctor()throws SQLException;

	// 의사정보 수정
	void docinfomodify(DoctorVO vo) throws SQLException;

	// 의사 프로필 사진 수정
	void docinfoprofilemodify(DoctorVO vo) throws SQLException;

	// 의사 비밀번호 가져오기
	String checkpwd(String dId) throws SQLException;

	// 의사 새 비밀번호 업데이트
	void docpwdmodify(DoctorVO vo) throws SQLException;

	// 로그인 보안 설정 업데이트
	void docloginmodify(DoctorVO vo) throws SQLException;

	// 비밀번호 수정
	void doctelmodify(DoctorVO vo) throws SQLException;

	List<String> docIp (String dId) throws SQLException;

}
