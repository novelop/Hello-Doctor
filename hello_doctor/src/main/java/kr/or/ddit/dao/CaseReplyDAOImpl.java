package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.ReplyPagingCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.CaseReplyVO;
import kr.or.ddit.dto.ReplyRecomVO;


public class CaseReplyDAOImpl implements CaseReplyDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void registReply(CaseReplyVO replyvo) throws SQLException {
		session.update("CaseReply-Mapper.registReply", replyvo);

	}

	@Override
	public int selectCaseReplySeqNextValue() throws SQLException {
		int num = session.selectOne("CaseReply-Mapper.selectCaseReplySeqNextValue");
		return num;
	}

	@Override
	public List<CaseReplyVO> listReply(ReplyPagingCommand command) throws SQLException {
		int offset = command.getStartRowNum();
		int limit = command.getPerPageNum();
		RowBounds row = new RowBounds(offset, limit);
		List<CaseReplyVO> list = session.selectList("CaseReply-Mapper.listReply", command, row);
		return list;

	}

	@Override
	public int countReply(ReplyPagingCommand command) throws SQLException {
		int count = session.selectOne("CaseReply-Mapper.countReply", command);
		return count;
	}

	@Override
	public void updateReply(CaseReplyVO replyvo) throws SQLException {
		session.update("CaseReply-Mapper.updateReply", replyvo);

	}

	@Override
	public void deleteReply(String disRplyNo) throws SQLException {
		session.update("CaseReply-Mapper.deleteReply", disRplyNo);

	}

	@Override
	public ReplyRecomVO caseRecomSelect(ReplyRecomVO replyRecomVO) throws SQLException {
		ReplyRecomVO recom = session.selectOne("CaseReply-Mapper.caseRecomSelect", replyRecomVO);
		return recom;
	}

	@Override
	public void caseRecomInsert(ReplyRecomVO replyRecomVO) throws SQLException {
		session.update("CaseReply-Mapper.caseRecomInsert", replyRecomVO);
	}

	@Override
	public void caseRecomDelete(ReplyRecomVO replyRecomVO) throws SQLException {
		session.update("CaseReply-Mapper.caseRecomDelete", replyRecomVO);

	}

	@Override
	public String myClick(ReplyRecomVO replyRecomVO) throws SQLException {
		String click = session.selectOne("CaseReply-Mapper.myClick", replyRecomVO);
		return click;
	}

}
