package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

public interface DiseaseDAO {


	List<String> searchdisease(String de_ko)throws SQLException;
	List<String> searchmedicine(String me_name)throws SQLException;
}
