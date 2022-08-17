package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.NotiVO;

public interface NotiService {


	List<DoctorVO> selectAllDoc()throws SQLException;

	Map<String,Object> notiList(String dId)throws SQLException;
	
	List<NotiVO> notiAllList(String dId)throws SQLException;
	
}
