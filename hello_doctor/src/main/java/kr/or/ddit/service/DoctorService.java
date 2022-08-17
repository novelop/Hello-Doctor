package kr.or.ddit.service;

import java.io.IOException;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.DoctorRegistCommand;
import kr.or.ddit.command.OtherDoctorCommand;
import kr.or.ddit.dto.CoworkerVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;
import kr.or.ddit.dto.docIpVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;

public interface DoctorService {

	DoctorVO doctorLogin(DoctorVO vo)throws SQLException, NotFoundIdException, InvalidPasswordException;

	DoctorVO getDoctor(DoctorVO vo)throws SQLException;

	DoctorVO profileChange(DoctorVO vo)throws SQLException;
	DoctorVO selectDoctorVO(String dId)throws SQLException;
	List<MajorVO> majorList()throws SQLException;
	List<MajorVO> majorDoctors(MajorVO vo)throws SQLException;
	Map<String,Object>detailDoctor(OtherDoctorCommand command)throws SQLException;
	MajorVO simpleProfile(String dId)throws SQLException;
	List<MajorVO> simpleProfile2(List<String> dIdList)throws SQLException;
	Map<String,Object> coworkerList(String dId)throws SQLException;
	// 로그아웃시, 상태 0으로 초기화
	void doctorStatusReset (String dId) throws SQLException;

	// 로그인 시, 상태 1로 초기화
	void doctorStatusStart (String dId) throws SQLException;

	MajorVO addCoworker(CoworkerVO vo)throws SQLException;

	void deleteCoworker(CoworkerVO vo)throws SQLException;

	List<Map<String,String>> allDoctor(String dId) throws SQLException;

	// 의사 정보 수정
	void docinfomodify(DoctorRegistCommand doctorReq,String doctorFilePath) throws SQLException, IllegalStateException, IOException;

	// 의사 기존 비밀번호와 내정보에서 입력한 비밀번호가 같은지 확인
	String checkpwd(String dId,String pwd) throws SQLException;

	// 의사 새비밀번호 업데이트
	String docpwdmodify( DoctorVO vo , String newpwdcheck) throws SQLException;

	// 로그인 보안 설정 업데이트
	String docloginmodify(DoctorVO vo) throws SQLException;

	// 비밀번호 수정
	String doctelmodify(DoctorVO vo) throws SQLException;

	//
	String docIp(String dId) throws SQLException,UnknownHostException;


}
