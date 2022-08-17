package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MainVO;

public class MainIssueDAOImpl implements MainIssueDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}


	// 메인 특이사항 리스트 메소드
	@Override
	public List<MainVO> mainIssueList(String dId) throws SQLException {

	List<MainVO> result = session.selectList("Main-Mapper.mainIssueList",dId);

	System.out.println("result!~@!~@!~!@~"+result);

	return result ;


	}



}
