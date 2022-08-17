package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.HospitalIpVO;

public interface HospitalService {

	List<HospitalIpVO> blockHospitalIp() throws SQLException;

}
