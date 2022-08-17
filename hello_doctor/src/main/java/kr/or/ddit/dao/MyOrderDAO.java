package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MyOrderListVO;
import kr.or.ddit.dto.MyOrderVO;
import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.dto.PrescriptVO;
import kr.or.ddit.dto.SubDVO;
import kr.or.ddit.dto.UsedOrdersetVO;

public interface MyOrderDAO {

	List<MyOrderListVO> myorderList(String dId)throws SQLException;
	List<OrdersetVO> orderdruglist(String moNo)throws SQLException;
	List<PrescriptVO> pastdrug(String mNo)throws SQLException;
	List<SubDVO> pastsubD(String mNo)throws SQLException;
	List<MyOrderVO>myOrderList(SearchCriteria cri)throws SQLException;
	int myOrderListCount(SearchCriteria cri)throws SQLException;
	void insertMyOrderset(InsertOrderSetCommand vo) throws SQLException;
	String selectMyOrdersetSeqNext()throws SQLException;
	void insertMyDrugs(OrdersetVO ordersetVO)throws SQLException;
	OrdersetVO selectMyOrdersetDetail(String moNo)throws SQLException;
	void updateResult(MyOrderVO vo)throws SQLException;
	List<UsedOrdersetVO> selectUsedOrderset(String moNo)throws SQLException;
	void modifyMyOrderset(InsertOrderSetCommand vo)throws SQLException;
	void deleteMyOrderset(String moNo)throws SQLException;
	void deleteMyOrdersetDrugs(String moNo)throws SQLException;
	void updateCaution(MyOrderVO vo)throws SQLException;

}
