package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.MainIssueDAO;
import kr.or.ddit.dto.MainVO;


public class MainIssueServiceImpl implements MainIssueService {

	private MainIssueDAO issuedao;

	public void setIssuedao(MainIssueDAO issuedao) {
		this.issuedao = issuedao;
	}


	// 메인 특이사항 리스트
	@Override
	public Map<String, Object> mainIssueList(String dId) throws SQLException {

		Map<String, Object> map = new HashMap<String, Object>();

		List<MainVO> issueList = issuedao.mainIssueList(dId);

		System.out.println("issueList~~~~~~~~~~~~~~~~"+issueList);

		map.put("issueList",issueList);

		return map;
	}



}
