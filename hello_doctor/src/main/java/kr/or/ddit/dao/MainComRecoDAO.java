package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MainVO;

public interface MainComRecoDAO {

	// 메인 내가 주치의인 환자상태 출력 리스트
	List<MainVO> mainComRecoList(String dId) throws SQLException;

}
