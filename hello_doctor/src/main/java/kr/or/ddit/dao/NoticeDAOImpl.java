package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ManagerNoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ManagerNoticeVO> selectNoticeForPage(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds row = new RowBounds(offset, limit);
		List<ManagerNoticeVO> list = session.selectList("Notice-Mapper.selectNoticeForPage", cri, row);
		return list;
	}

	@Override
	public int countNoticeForPage(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Notice-Mapper.countNoticeForPage", cri);
		return count;
	}

	@Override
	public void insertNotice(ManagerNoticeVO noticeVO) throws SQLException {
		session.update("Notice-Mapper.insertNotice", noticeVO);

	}

	@Override
	public int noticeSeq() throws SQLException {
		int seq = session.selectOne("Notice-Mapper.noticeSeq");
		return seq;
	}

	@Override
	public ManagerNoticeVO detailNotice(String nNo) throws SQLException {
		ManagerNoticeVO noticeVO = session.selectOne("Notice-Mapper.detailNotice", nNo);
		return noticeVO;
	}

	@Override
	public void deleteNotice(String nNo) throws SQLException {
		session.selectOne("Notice-Mapper.deleteNotice", nNo);

	}

	@Override
	public void modifyNotice(ManagerNoticeVO noticeVO) throws SQLException {
		session.update("Notice-Mapper.modifyNotice", noticeVO);

	}

	@Override
	public List<ManagerNoticeVO> popUpNotice() throws SQLException {
		List<ManagerNoticeVO> list = session.selectList("Notice-Mapper.popUpNotice");
		return list;
	}

	@Override
	public ManagerNoticeVO popUpNoticeByNo(String nNo) throws SQLException {
		ManagerNoticeVO noticeVO = session.selectOne("Notice-Mapper.popUpNoticeByNo", nNo);
		return noticeVO;
	}


}
