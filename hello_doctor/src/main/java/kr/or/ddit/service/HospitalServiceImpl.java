package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.HospitalIpDAO;
import kr.or.ddit.dto.HospitalIpVO;

public class HospitalServiceImpl implements HospitalService {

	private HospitalIpDAO hospitalIpDAO;

	public void setHospitalIpDAO(HospitalIpDAO hospitalIpDAO) {
		this.hospitalIpDAO = hospitalIpDAO;
	}


	@Override
	public List<HospitalIpVO> blockHospitalIp() throws SQLException {

		List<HospitalIpVO> result = hospitalIpDAO.blockHospitalIp();

		return result;
	}

}
