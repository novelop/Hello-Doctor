package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MyOrderVO;
import kr.or.ddit.dto.OrdersetVO;

public interface MyOrderService {

    List<OrdersetVO> orderdruglist(String mo_no)throws SQLException;

	Map<String, Object> myOrderList(SearchCriteria cri) throws SQLException;

	void insertMyOrderset(HttpSession session, InsertOrderSetCommand vo) throws SQLException;

	Map<String, Object> getMyOrdersetDetail(HttpSession session, String moNo) throws SQLException;

	void updateResult(MyOrderVO vo) throws SQLException;

	void UpdateMyOrderset(InsertOrderSetCommand vo)throws SQLException;
	
	void deleteMyOrderset(String moNo)throws SQLException;
	
	String uploadMyOrderset(HttpSession session, MyOrderVO vo)throws SQLException;
}
