package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MedicineVO;

public interface MedicineDAO {

	List<MedicineVO> selectAllMedicine(SearchCriteria cri)throws SQLException;
	int selectAllMedicineCount(SearchCriteria cri)throws SQLException;
	void modifyY(String meNo)throws SQLException;
	void modifyN(String meNo)throws SQLException;
	void updateModiDate()throws SQLException;
	void modifyMedicine(Map<String , Object> map)throws SQLException;
	List<MedicineVO>selectUpdateMedicine(SearchCriteria cri)throws SQLException;
	
	List<MedicineVO> AllMedi() throws SQLException;
	String selectModiDate()throws SQLException;
	int updateMeditotalCount()throws SQLException;
}
