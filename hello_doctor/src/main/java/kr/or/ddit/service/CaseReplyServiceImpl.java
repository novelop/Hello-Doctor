package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.PageMaker1;
import kr.or.ddit.command.ReplyPagingCommand;
import kr.or.ddit.dao.CaseReplyDAO;
import kr.or.ddit.dto.CaseReplyVO;
import kr.or.ddit.dto.ReplyRecomVO;

public class CaseReplyServiceImpl implements CaseReplyService{

	private CaseReplyDAO replydao;

	public void setReplydao(CaseReplyDAO replydao) {
		this.replydao = replydao;
	}

	@Override
	public void registReply(CaseReplyVO replyvo) throws SQLException {
		int seq = replydao.selectCaseReplySeqNextValue();
		String disNo = Integer.toString(seq);
		if(seq < 10) {
			disNo = "DR00" + disNo;
		}else if(seq >= 10 && seq <= 100) {
			disNo = "DR0" + disNo;
		}else {
			disNo = "DR" + disNo;
		}
		replyvo.setDisRplyNo(disNo);
		replydao.registReply(replyvo);

	}

	@Override
	public Map<String, Object> listReply(ReplyPagingCommand command, String disNo, String dId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<CaseReplyVO> replylist = replydao.listReply(command);

		for(int i = 0; i< replylist.size(); i++) {
			ReplyRecomVO replyRecomVO = new ReplyRecomVO();
			String disRplyNo = replylist.get(i).getDisRplyNo();
			replyRecomVO.setdId(dId);
		    replyRecomVO.setDisRplyNo(disRplyNo);
			String result = replydao.myClick(replyRecomVO);

			if(!result.equals("N")) {
				replylist.get(i).setMyClick("Y");
			}else {
				replylist.get(i).setMyClick(result);
			}


		}


		int count = replydao.countReply(command);
		PageMaker1 pageMaker = new PageMaker1();

		pageMaker.setCommand(command);

		pageMaker.setTotalCount(count);


		dataMap.put("replylist", replylist);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void updateReply(CaseReplyVO replyvo) throws SQLException {
		replydao.updateReply(replyvo);

	}

	@Override
	public void deleteReply(String disRplyNo) throws SQLException {
		replydao.deleteReply(disRplyNo);

	}

	@Override
	public ReplyRecomVO caseRecomSelect(ReplyRecomVO replyRecomVO) throws SQLException {
		ReplyRecomVO recom = replydao.caseRecomSelect(replyRecomVO);
		return recom;
	}

	@Override
	public void caseRecomInsert(ReplyRecomVO replyRecomVO) throws SQLException {
		replydao.caseRecomInsert(replyRecomVO);

	}

	@Override
	public void caseRecomDelete(ReplyRecomVO replyRecomVO) throws SQLException {
		replydao.caseRecomDelete(replyRecomVO);

	}

}
