package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.dao.AdminDAO;
import kr.or.ddit.dto.AdminVO;

public class AdminServiceImpl implements AdminService {

	private AdminDAO admindao;

	public void setAdmindao(AdminDAO admindao) {
		this.admindao = admindao;
	}


	@Override
	public AdminVO selectAdmin() throws SQLException {

		return admindao.selectAdmin();
	}

}
