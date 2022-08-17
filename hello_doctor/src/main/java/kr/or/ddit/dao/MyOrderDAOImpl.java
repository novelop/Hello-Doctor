package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MyOrderListVO;
import kr.or.ddit.dto.MyOrderVO;
import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.dto.PrescriptVO;
import kr.or.ddit.dto.SubDVO;
import kr.or.ddit.dto.UsedOrdersetVO;

public class MyOrderDAOImpl implements MyOrderDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MyOrderListVO> myorderList(String dId) throws SQLException {
		List<MyOrderListVO> list = session.selectList("MyOrder-Mapper.myorderList", dId);
		return list;
	}

	@Override
	public List<OrdersetVO> orderdruglist(String moNo) throws SQLException {


		List<OrdersetVO> list = session.selectList("MyDrug-Mapper.orderdruglist", moNo);


		return list;
	}

	@Override
	public List<PrescriptVO> pastdrug(String mNo) throws SQLException {
		List<PrescriptVO> list = session.selectList("MyDrug-Mapper.pastdrug", mNo);
		return list;
	}

	@Override
	public List<SubDVO> pastsubD(String mNo) throws SQLException {

		List<SubDVO>list = session.selectList("MyDrug-Mapper.pastsubD", mNo);
		return list;
	}


	@Override
	public List<MyOrderVO> myOrderList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds row = new RowBounds(offset,limit);
		return session.selectList("MyDrug-Mapper.myOrderList", cri, row);
	}

	@Override
	public int myOrderListCount(SearchCriteria cri) throws SQLException {

		return session.selectOne("MyDrug-Mapper.myOrderListCount", cri);
	}

	@Override
	public void insertMyDrugs(OrdersetVO vo) throws SQLException {
		session.update("MyOrder-Mapper.insertMyDrugs",vo);

	}

	@Override
	public void insertMyOrderset(InsertOrderSetCommand vo) throws SQLException {
		session.update("MyOrder-Mapper.insertMyOrderset",vo);

	}


	@Override
	public String selectMyOrdersetSeqNext() throws SQLException {
		return session.selectOne("MyOrder-Mapper.selectMyOrdersetSeqNext");
	}

	@Override
	public OrdersetVO selectMyOrdersetDetail(String moNo) throws SQLException {
		return session.selectOne("MyOrder-Mapper.selectMyOrdersetDetail",moNo);
	}

	@Override
	public void updateResult(MyOrderVO vo) throws SQLException {
		session.update("MyOrder-Mapper.updateResult",vo);

	}

	@Override
	public List<UsedOrdersetVO> selectUsedOrderset(String moNo) throws SQLException {
		return session.selectList("MyOrder-Mapper.selectUsedOrderset",moNo);
	}

	@Override
	public void modifyMyOrderset(InsertOrderSetCommand vo) throws SQLException {
		session.update("MyOrder-Mapper.modifyMyOrderset",vo);

	}

	@Override
	public void deleteMyOrderset(String moNo) throws SQLException {
		session.update("MyOrder-Mapper.deleteMyOrderset",moNo);

	}

	@Override
	public void deleteMyOrdersetDrugs(String moNo) throws SQLException {
		session.update("MyOrder-Mapper.deleteMyOrdersetDrugs",moNo);

	}

	@Override
	public void updateCaution(MyOrderVO vo) throws SQLException {
		session.update("MyOrder-Mapper.updateCaution",vo);

	}

}
