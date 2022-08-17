package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.DoctorVO;


public interface RegistService {

	// major 리스트 출력
	List<String> registMajorList(String word) throws SQLException;

	// 의사 회원가입
	void insertDoctor(DoctorVO vo) throws SQLException;


}
