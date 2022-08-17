package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.OrdersetVO;

public interface OrdersetService {

	Map<String, Object> getOrdersetList(HttpSession session, SearchCriteria cri) throws SQLException;

	void insertOrderset(HttpSession session, InsertOrderSetCommand vo) throws SQLException;

	List<OrdersetVO> searchDrugList(String keyword) throws SQLException;

	Map<String, Object> getOrdersetDetail(HttpSession session, String oNo,SearchCriteria cri) throws SQLException;

	List<Map<String, Object>> getRelationOrderset(OrdersetVO ordersetVO) throws SQLException;

	void increaseViewCnt(String oNo) throws SQLException;

	String updateRecommand(Map<String, String> map) throws SQLException;

	String selectMyRecommand(String dId, String oNo) throws SQLException;

	void insertOrdersetFeedBack(OrdersetVO ordersetVO) throws SQLException;

	Map<String, String> updateOrdersetFeedBack(Map<String, String> map) throws SQLException;

	void deleteOrdersetFeedBack(String fbNo) throws SQLException;

	void orderSetShare(String dId, String oNo, List<Map<String, String>> list) throws SQLException;

	void UpdateOrderset(InsertOrderSetCommand vo) throws SQLException;

	void deleteOrderset(String oNo) throws SQLException;

	Map<String, Object> getMainOrderset(HttpSession session) throws SQLException;

	List<OrdersetVO> selectDrugList(String oNo) throws SQLException;
	
	String selectMedicine(String meName)throws SQLException;
	
	Map<String, Object> selectFeedbackMainList(SearchCriteria cri, String dId)throws SQLException;
	Map<String, Object> selectShareOrderset(SearchCriteria cri, String dId)throws SQLException;

}
