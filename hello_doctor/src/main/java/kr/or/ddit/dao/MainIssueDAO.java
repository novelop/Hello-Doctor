package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.MainVO;

public interface MainIssueDAO {

	// 메인 특이사항 리스트
	List<MainVO> mainIssueList(String dId) throws SQLException;

}
