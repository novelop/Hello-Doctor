package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.DoctorVO;


public interface RegistDAO {

	// major 리스트 출력
	List<String> registMajorList(String word) throws SQLException;

	// 의사 회원가입
    public void insertDoctor(DoctorVO vo) throws SQLException;

    // 전공이름을 가지고 전공 번호로 비교후 DoctorVO에 저장
    public String maNameCheck(String maName) throws SQLException;


}
