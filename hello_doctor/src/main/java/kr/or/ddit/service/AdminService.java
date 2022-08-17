package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.dto.AdminVO;

public interface AdminService {

	AdminVO selectAdmin() throws SQLException;

}
