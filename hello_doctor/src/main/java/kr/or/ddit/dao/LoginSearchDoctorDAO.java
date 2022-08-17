package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.LoginLogVO;

public interface LoginSearchDoctorDAO {

	DoctorVO secuDoctor(String dId) throws SQLException;


	void insertLoginUserLog(LoginLogVO vo)throws SQLException;



}
