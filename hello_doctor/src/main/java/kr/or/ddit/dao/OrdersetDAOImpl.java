package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.OrderSetShareVO;
import kr.or.ddit.dto.OrdersetVO;

public class OrdersetDAOImpl implements OrdersetDAO {

	private SqlSession session;


	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<OrdersetVO> selectOrdersetList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds row = new RowBounds(offset,limit);
		List<OrdersetVO> list = session.selectList("Orderset-Mapper.selectOrdersetList",cri,row);
		return list;
	}

	@Override
	public List<OrdersetVO> selectDrugList(String oNo) throws SQLException {
		List<OrdersetVO> list = session.selectList("Orderset-Mapper.selectDrugList",oNo);
		return list;
	}


	@Override
	public int selectOrdersetListCount(SearchCriteria cri) throws SQLException {
		int cnt = session.selectOne("Orderset-Mapper.selectOrdersetListCount",cri);
		return cnt;
	}


	@Override
	public int selectRecommendCount(String oNo) throws SQLException {
		int cnt = session.selectOne("Orderset-Mapper.selectRecommendCount",oNo);
		return cnt;
	}


	@Override
	public void insertOrderset(InsertOrderSetCommand vo) throws SQLException {
	    session.update("Orderset-Mapper.insertOrderset",vo);
	}


	@Override
	public String selectOrdersetSeqNext() throws SQLException {
		String o_no = session.selectOne("Orderset-Mapper.selectOrdersetSeqNext");
		return o_no;
	}


	@Override
	public List<OrdersetVO> searchDrugList(String keyword) throws SQLException {
		List<OrdersetVO> list = session.selectList("Orderset-Mapper.searchDrugList",keyword);
		return list;
	}


	@Override
	public void insertDrugs(OrdersetVO vo) throws SQLException {
		 session.update("Orderset-Mapper.insertDrugs",vo);
	}


	@Override
	public String selectMyMajor(String dId) throws SQLException {
		String major = session.selectOne("Orderset-Mapper.selectMyMajor",dId);
		return major;
	}


	@Override
	public OrdersetVO selectOrdersetDetail(String oNo) throws SQLException {
		OrdersetVO vo = session.selectOne("Orderset-Mapper.selectOrdersetDetail",oNo);
		return vo;
	}


	@Override
	public void increaseViewCnt(String oNo) throws SQLException {
		 session.update("Orderset-Mapper.increaseViewCnt",oNo);

	}


	@Override
	public List<OrdersetVO> selectRelationOrderset(OrdersetVO ordersetVO) throws SQLException {
		List<OrdersetVO> list = session.selectList("Orderset-Mapper.selectRelationOrderset",ordersetVO);
		return list;
	}


	@Override
	public void insertRecommand(Map<String, String> map) throws SQLException {
		session.update("Orderset-Mapper.insertRecommand", map);
	}


	@Override
	public void deleteRecommand(Map<String, String> map) throws SQLException {
		session.update("Orderset-Mapper.deleteRecommand", map);
	}


	@Override
	public String selectMyRecommand(Map<String, Object> map) throws SQLException {
		String result = session.selectOne("Orderset-Mapper.selectMyRecommand",map);
		return result;
	}


	@Override
	public List<OrdersetVO> selectOrdersetReplyList(SearchCriteria cri,String oNo) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds row = new RowBounds(offset,limit);
		return session.selectList("Orderset-Mapper.selectOrdersetReplyList",oNo,row);
	}


	@Override
	public void insertOrdersetFeedBack(OrdersetVO ordersetVO) throws SQLException {
		session.update("Orderset-Mapper.insertOrdersetFeedBack",ordersetVO);
	}


	@Override
	public void updateOrdersetFeedBack(OrdersetVO vo) throws SQLException {
		session.update("Orderset-Mapper.updateOrdersetFeedBack",vo);

	}


	@Override
	public OrdersetVO getOrdersetFeedBack(String fbNo) throws SQLException {
		return  session.selectOne("Orderset-Mapper.getOrdersetFeedBack",fbNo);
	}


	@Override
	public void deleteOrdersetFeedBack(String fbNo) throws SQLException {
		session.update("Orderset-Mapper.deleteOrdersetFeedBack",fbNo);
	}


	@Override
	public int getOrderSetShareSeq() throws SQLException {
		int result = session.selectOne("Orderset-Mapper.getOrderSetShareSeq");
		return result;
	}

	@Override
	public void orderSetShare(OrderSetShareVO vo) throws SQLException {
		session.update("Orderset-Mapper.orderSetShare",vo);

	}


	@Override
	public void modifyOrderset(InsertOrderSetCommand vo) throws SQLException {
		session.update("Orderset-Mapper.modifyOrderset",vo);

	}


	@Override
	public void deleteOrderset(String oNo) throws SQLException {
		session.update("Orderset-Mapper.deleteOrderset",oNo);
	}


	@Override
	public void deleteOrdersetDrugs(String oNo) throws SQLException {
		session.update("Orderset-Mapper.deleteOrdersetDrugs",oNo);

	}


	@Override
	public List<OrdersetVO> selectMainRecoList1(String maName) throws SQLException {
		return session.selectList("Orderset-Mapper.selectMainRecoList1",maName);
	}


	@Override
	public List<OrdersetVO> selectMainRecoList2(String maName) throws SQLException {
		return session.selectList("Orderset-Mapper.selectMainRecoList2",maName);
	}


	@Override
	public List<OrdersetVO> selectFeedbackMainList(SearchCriteria cri,String dId) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds row = new RowBounds(offset,limit);
		return session.selectList("Orderset-Mapper.selectFeedbackMainList",dId,row);
	}


	@Override
	public List<OrdersetVO> selectShareOrderset(SearchCriteria cri, String dId) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds row = new RowBounds(offset,limit);
		return session.selectList("Orderset-Mapper.selectShareOrderset",dId,row);
	}


	@Override
	public String selectMedicine(String meName) throws SQLException {
		return session.selectOne("Orderset-Mapper.selectMedicine",meName);
	}


	@Override
	public int selectReplyCount(String oNo) throws SQLException {
		return session.selectOne("Orderset-Mapper.selectReplyCount",oNo);
	}


	@Override
	public int selectMainShareCount(String dId) throws SQLException {
		return session.selectOne("Orderset-Mapper.selectMainShareCount",dId);
	}


	@Override
	public int selectMainReplyCount(String dId) throws SQLException {
		return session.selectOne("Orderset-Mapper.selectMainReplyCount",dId);
	}


	

}
