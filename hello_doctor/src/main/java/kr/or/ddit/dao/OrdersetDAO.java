package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.OrderSetShareVO;
import kr.or.ddit.dto.OrdersetVO;

public interface OrdersetDAO {

	List<OrdersetVO> selectOrdersetList(SearchCriteria cri) throws SQLException;

	List<OrdersetVO> selectDrugList(String oNo) throws SQLException;

	int selectOrdersetListCount(SearchCriteria cri) throws SQLException;

	int selectRecommendCount(String oNo) throws SQLException;

	String selectOrdersetSeqNext() throws SQLException;

	void insertOrderset(InsertOrderSetCommand vo) throws SQLException;

	List<OrdersetVO> searchDrugList(String keyword) throws SQLException;

	void insertDrugs(OrdersetVO ordersetVO) throws SQLException;

	String selectMyMajor(String dId) throws SQLException;

	OrdersetVO selectOrdersetDetail(String oNo) throws SQLException;

	void increaseViewCnt(String oNo) throws SQLException;

	List<OrdersetVO> selectRelationOrderset(OrdersetVO ordersetVO) throws SQLException;

	void insertRecommand(Map<String, String> map) throws SQLException;

	void deleteRecommand(Map<String, String> map) throws SQLException;

	String selectMyRecommand(Map<String, Object> map) throws SQLException;

	List<OrdersetVO> selectOrdersetReplyList(SearchCriteria cri, String oNo) throws SQLException;

	void insertOrdersetFeedBack(OrdersetVO ordersetVO) throws SQLException;

	void updateOrdersetFeedBack(OrdersetVO ordersetVO) throws SQLException;

	OrdersetVO getOrdersetFeedBack(String fbNo) throws SQLException;

	void deleteOrdersetFeedBack(String fbNo) throws SQLException;

	int getOrderSetShareSeq() throws SQLException;

	void orderSetShare(OrderSetShareVO vo) throws SQLException;

	void modifyOrderset(InsertOrderSetCommand vo) throws SQLException;

	void deleteOrderset(String oNo) throws SQLException;

	void deleteOrdersetDrugs(String oNo) throws SQLException;

	List<OrdersetVO> selectMainRecoList1(String maName) throws SQLException;

	List<OrdersetVO> selectMainRecoList2(String maName) throws SQLException;

	List<OrdersetVO> selectFeedbackMainList(SearchCriteria cri, String dId) throws SQLException;

	List<OrdersetVO> selectShareOrderset(SearchCriteria cri, String dId) throws SQLException;

	String selectMedicine(String meName) throws SQLException;

	int selectReplyCount(String oNo) throws SQLException;
	
	int selectMainShareCount(String dId)throws SQLException;
	
	int selectMainReplyCount(String dId)throws SQLException;

}
