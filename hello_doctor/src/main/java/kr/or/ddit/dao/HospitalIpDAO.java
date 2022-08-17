package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.HospitalIpVO;

public interface HospitalIpDAO {

	List<HospitalIpVO> blockHospitalIp() throws SQLException;


}
