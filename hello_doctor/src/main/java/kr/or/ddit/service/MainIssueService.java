package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;


public interface MainIssueService {


	// 메인 특이사항 리스트..
	Map<String, Object > mainIssueList(String dId) throws SQLException;

}
