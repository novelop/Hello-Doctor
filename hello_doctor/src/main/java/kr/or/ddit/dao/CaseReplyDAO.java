package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.ReplyPagingCommand;
import kr.or.ddit.dto.CaseReplyVO;
import kr.or.ddit.dto.ReplyRecomVO;

public interface CaseReplyDAO {

	// 댓글 등록
	void registReply(CaseReplyVO replyvo)throws SQLException;
	// 시퀀스
	int selectCaseReplySeqNextValue()throws SQLException;

	// 댓글 출력
	List<CaseReplyVO> listReply(ReplyPagingCommand command)throws SQLException;
	// 댓글 수
	int countReply(ReplyPagingCommand command)throws SQLException;
	// 댓글 수정
	void updateReply(CaseReplyVO replyvo)throws SQLException;
	// 댓글 삭제
	void deleteReply(String disRplyNo)throws SQLException;

	// 좋아요
	ReplyRecomVO caseRecomSelect(ReplyRecomVO replyRecomVO)throws SQLException;
	void caseRecomInsert(ReplyRecomVO replyRecomVO)throws SQLException;
	void caseRecomDelete(ReplyRecomVO replyRecomVO)throws SQLException;
	String myClick(ReplyRecomVO replyRecomVO)throws SQLException;

}
