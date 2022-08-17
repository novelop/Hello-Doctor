package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dao.LoginSearchDoctorDAO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.LoginLogVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;

public class LoginSearchDoctorServiceImpl  extends DoctorServiceImpl
implements LoginSearchDoctorService {

	private LoginSearchDoctorDAO loginSearchDoctorDAO;

	public void setLoginSearchDoctorDAO(LoginSearchDoctorDAO loginSearchDoctorDAO) {
		this.loginSearchDoctorDAO = loginSearchDoctorDAO;
	}

	@Override
	public void securityLogin(String dId, String pwd) throws SQLException, NotFoundIdException, InvalidPasswordException {

		DoctorVO doctorVO= loginSearchDoctorDAO.secuDoctor(dId);

		System.out.println("securityLogin pass!!!!!!!!!!!"+pwd);

		 System.out.println("doctorVO pass!@~!@~@!~@"+doctorVO.getPwd());

		if(doctorVO== null)throw new NotFoundIdException();

        if(!pwd.equals(doctorVO.getPwd())) throw new InvalidPasswordException();

	}


	@Override
	public DoctorVO secuDoctor(String dId) throws SQLException {

		DoctorVO result = loginSearchDoctorDAO.secuDoctor(dId);

		return result;
	}

	@Override
	public void insertLoginUserLog(LoginLogVO vo) throws SQLException {
		loginSearchDoctorDAO.insertLoginUserLog(vo);

	}

}
