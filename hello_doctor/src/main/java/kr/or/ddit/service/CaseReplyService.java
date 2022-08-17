package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.ReplyPagingCommand;
import kr.or.ddit.dto.CaseReplyVO;
import kr.or.ddit.dto.ReplyRecomVO;

public interface CaseReplyService {

	// 댓글 등록
	void registReply(CaseReplyVO replyvo)throws SQLException;

	// 댓글 출력
	Map<String, Object> listReply(ReplyPagingCommand command, String disNo, String dId)throws SQLException;

	// 댓글 수정
	void updateReply(CaseReplyVO replyvo)throws SQLException;
	//댓글 삭제
	void deleteReply(String disRplyNo)throws SQLException;
	// 좋아요
	ReplyRecomVO caseRecomSelect(ReplyRecomVO replyRecomVO)throws SQLException;
	void caseRecomInsert(ReplyRecomVO replyRecomVO)throws SQLException;
	void caseRecomDelete(ReplyRecomVO replyRecomVO)throws SQLException;
}
