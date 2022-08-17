package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.LoginLogVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;

public interface LoginSearchDoctorService  extends DoctorService{

	void securityLogin(String dId, String pwd) throws SQLException,NotFoundIdException, InvalidPasswordException;

	DoctorVO secuDoctor(String dId) throws SQLException;

	void insertLoginUserLog(LoginLogVO vo)throws SQLException;
}
