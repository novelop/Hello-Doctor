package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.Case_DAO;
import kr.or.ddit.dao.DiseaseDAO;

public class DiseaseServiceImpl implements DiseaseService {
	private DiseaseDAO diseaseDAO;
	public void setDiseaseDAO(DiseaseDAO diseaseDAO) {
		this.diseaseDAO = diseaseDAO;
	}

	@Override
	public List<String> searchdisease(String deKo) throws SQLException {
			List<String> list = diseaseDAO.searchdisease(deKo);
		return list;
	}

	@Override
	public List<String> searchmedicine(String meName) throws SQLException {
		List<String> list = diseaseDAO.searchmedicine(meName);
		return list;
	}

}
