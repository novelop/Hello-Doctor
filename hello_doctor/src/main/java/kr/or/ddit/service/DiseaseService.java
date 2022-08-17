package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

public interface DiseaseService {


	List<String> searchdisease(String de_ko)throws SQLException;
	List<String> searchmedicine(String me_name)throws SQLException;


}
