package kr.or.ddit.dao;

import java.sql.SQLException;

import kr.or.ddit.dto.AdminVO;

public interface AdminDAO {

	AdminVO selectAdmin() throws SQLException;

}
