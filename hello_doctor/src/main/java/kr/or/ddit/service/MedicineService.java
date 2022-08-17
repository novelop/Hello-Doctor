package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MedicineVO;

public interface MedicineService {
Map<String,Object> selectAllMedicine(SearchCriteria cri)throws SQLException;
void modifyN(String meNo)throws SQLException;
void modifyY(String meNo)throws SQLException;
int modifyMedicine() throws SQLException;
String selectModiDate()throws SQLException;
Map<String, Object> selectUpdateMedicine(SearchCriteria cri)throws SQLException;
}
