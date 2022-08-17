package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CoDocApproveVO;
import kr.or.ddit.dto.DidApproveVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.JoinCooperVO;
import kr.or.ddit.dto.MyHistoryCommentVO;
import kr.or.ddit.dto.NotiVO;


public class CooperMainDaoImpl implements CooperMainDao {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override  //페이지네이션
	public List<JoinCooperVO> selectCooperList(String dId,SearchCriteria cri) throws SQLException {
		int offset= cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		cri.setDId(dId);
		List<JoinCooperVO> cooList = session.selectList("CooperMain-Mapper.selectJoinList",cri,rowBounds);

		for(JoinCooperVO vo : cooList) {
			vo.setMaxDate(session.selectOne("CooperMain-Mapper.selectMaxDate", vo.getpNo()));
			System.out.println("참여중인 협진 환자이름"+vo.getpName());
			System.out.println("pno :"+vo.getpNo()+ "maxdate:"+vo.getMaxDate());
		}
		System.out.println("협진 리스트 "+cooList);
	return cooList;
	}



	@Override
	public int cooperListCount(String dId, SearchCriteria cri) throws SQLException {
		cri.setDId(dId);
		return session.selectOne("CooperMain-Mapper.joinListCount", cri);
	}








	@Override
	public List<IssueVO> selectIssueList(String d_id) throws SQLException {

		List<IssueVO> issueList = session.selectList("CooperMain-Mapper.selectIssueList", d_id);
		System.out.println("이슈리스트"+issueList);
		return issueList;
	}

	@Override
	public List<MyHistoryCommentVO> selectHistoryComment(String d_id) throws SQLException {
	List<MyHistoryCommentVO> historyCommentList = session.selectList("CooperMain-Mapper.selectHistoryComment",d_id);
	System.out.println("코멘트리스트 "+historyCommentList);
		return historyCommentList;
	}

	@Override
	public List<NotiVO> selectNoti(String d_id) throws SQLException {
		List<NotiVO> notiList = session.selectList("CooperMain-Mapper.selectNoti", d_id);
		System.out.println("내가받은 협진요청 리스트 "+notiList);
		return notiList;
	}

	@Override
	public List<CoDocApproveVO> selectapproveList(String d_id) throws SQLException {
	List<CoDocApproveVO> approveList= session.selectList("CooperMain-Mapper.selectapproveList", d_id);
		return approveList;
	}

	@Override
	public List<DidApproveVO> selectmyapproveList(String d_id) throws SQLException {
		List<DidApproveVO> myApproveList = session.selectList("CooperMain-Mapper.selectmyapproveList", d_id);
		return myApproveList;
	}

	@Override
	public NotiVO noticeRequestinfo(String notiNo) throws SQLException {
		NotiVO result = session.selectOne("CooperMain-Mapper.noticeRequestinfo",notiNo);
		return result;
	}

	@Override
	public List<DoctorVO> noticeRequsetDoctors(String coNo) throws SQLException {
		// TODO Auto-generated method stub
		List<DoctorVO> result = session.selectList("CooperMain-Mapper.noticeRequsetDoctors",coNo);
		return result;
	}

	@Override
	public void FreqRegist(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		session.update("CooperMain-Mapper.FreqRegist",map);
	}

	@Override
	public void FreqCancel(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		session.update("CooperMain-Mapper.FreqCancel",map);
	}

	@Override
	public void rejectRegist(Map<String, String> map) throws SQLException {
		session.update("CooperMain-Mapper.rejectRegist",map);
	}

	@Override
	public String checkReferTaNo(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.checkReferTaNo",taNo);
	}

	@Override
	public void updateReferStatus(String taNo) throws SQLException {
	 session.update("CooperMain-Mapper.updateReferStatus",taNo);
	}

	@Override
	public void rejectStatus(Map<String, String> map) throws SQLException {
		session.update("CooperMain-Mapper.rejectStatus",map);

	}

	@Override
	public int checkRemove(String taNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.checkRemove",taNo);
	}

	@Override
	public void updateCotaskStatus(String taNo) throws SQLException {
		session.update("CooperMain-Mapper.updateCotaskStatus",taNo);

	}

	@Override
	public void updateApproveStatus(String taNo) throws SQLException {
		session.update("CooperMain-Mapper.updateApproveStatus",taNo);

	}

	@Override
	public void updateNotiStatus(Map<String, Object> map) throws SQLException {
		session.update("CooperMain-Mapper.updateNotiStatus",map);

	}

	@Override
	public void updateCoDoctorStatus(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		session.update("CooperMain-Mapper.updateCoDoctorStatus",map);
	}

	@Override
	public List<NotiVO> selectRequestNoti(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return  session.selectList("CooperMain-Mapper.selectRequestNoti", dId);
	}

	@Override
	public String selectCodocName(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("CooperMain-Mapper.selectCodocName",dId);
	}

	@Override
	public List<CoDocApproveVO> selectapproveComplete(String dId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("CooperMain-Mapper.selectapproveComplete",dId);
	}












}
