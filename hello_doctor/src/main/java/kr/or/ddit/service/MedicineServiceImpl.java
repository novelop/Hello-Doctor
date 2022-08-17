package kr.or.ddit.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.MedicineDAO;
import kr.or.ddit.dao.MyOrderDAO;
import kr.or.ddit.dto.MedicineVO;
import kr.or.ddit.util.ApiExplorer;
import kr.or.ddit.util.TimeMaximum;

public class MedicineServiceImpl implements MedicineService{
	private MedicineDAO medicineDAO;

	public void setMedicineDAO(MedicineDAO medicineDAO) {
		this.medicineDAO = medicineDAO;
	}

	@Override
	public Map<String,Object> selectAllMedicine(SearchCriteria cri) throws SQLException {
		cri.setPerPageNum(10);
		Map<String,Object> map = new HashMap<String, Object>();
		List<MedicineVO> result = 	medicineDAO.selectAllMedicine(cri);
		int totalCount = medicineDAO.selectAllMedicineCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		map.put("pageMaker", pageMaker);
		map.put("medicineList", result);
		return map;
	}

	@Override
	public void modifyN(String meNo) throws SQLException {
		medicineDAO.modifyN(meNo);

	}

	@Override
	public void modifyY(String meNo) throws SQLException {
		medicineDAO.modifyY(meNo);
	}

	@Override
	public int modifyMedicine() throws SQLException {
		List<MedicineVO> result = 	medicineDAO.AllMedi();
		int cnt = 0;
		for(MedicineVO medi : result) {
			Map<String, Object> map = null;
		    try {
				map= ApiExplorer.getAPIList(medi.getMeNo());
				System.out.println(map);
				if(!map.get("meModidate").equals(medi.getMeModidate())) {
			    	medicineDAO.modifyMedicine(map);
			    	cnt++;
			    }
			} catch (Exception e) {
				System.out.println("없는 약품");
				
			}
		    
		}
		medicineDAO.updateModiDate();
		return cnt;
		
	}

	@Override
	public String selectModiDate() throws SQLException {
		String result =  medicineDAO.selectModiDate();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = null;
		String date = null;
		try {
			to = fm.parse(result);
			date = TimeMaximum.formatTimeString(to);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return date;
	}

	@Override
	public Map<String, Object> selectUpdateMedicine(SearchCriteria cri) throws SQLException {
		cri.setPerPageNum(10);
		Map<String,Object> map = new HashMap<String, Object>();
		List<MedicineVO> list = medicineDAO.selectUpdateMedicine(cri);
		int totalCount = medicineDAO.updateMeditotalCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		map.put("pageMaker", pageMaker);
		map.put("medicineList", list);
		return map;
	}

}
