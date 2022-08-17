package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.NoticeDAO;
import kr.or.ddit.dto.ManagerNoticeVO;
import kr.or.ddit.util.MakeSequence;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticedao;

	public void setNoticedao(NoticeDAO noticedao) {
		this.noticedao = noticedao;
	}

	@Override
	public Map<String, Object> selectNoticeForPage(SearchCriteria cri) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();

		List<ManagerNoticeVO> list = noticedao.selectNoticeForPage(cri);
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setnNo(list.get(i).getnNo().replace("N", ""));
		}
		int count = noticedao.countNoticeForPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		map.put("list", list);
		map.put("pageMaker", pageMaker);
		return map;
	}

	@Override
	public ManagerNoticeVO detailNotice(String nNo) throws SQLException {
		ManagerNoticeVO noticeVO = noticedao.detailNotice(nNo);

		return noticeVO;
	}

	@Override
	public void insertNotice(ManagerNoticeVO noticeVO) throws SQLException {

		int seq = noticedao.noticeSeq();
		String nNo = MakeSequence.makeSequence("N", seq);
		noticeVO.setnNo(nNo);

		if(noticeVO.getPickYn().equals("")) {
			noticeVO.setPickYn("N");
		}
		if(noticeVO.getPopYn().equals("")) {
			noticeVO.setPopYn("N");
		}

		noticedao.insertNotice(noticeVO);

	}

	@Override
	public void deleteNotice(String nNo) throws SQLException {
		noticedao.deleteNotice(nNo);

	}

	@Override
	public void modifyNotice(ManagerNoticeVO noticeVO) throws SQLException {
		if(noticeVO.getPickYn().equals("")) {
			noticeVO.setPickYn("N");
		}
		if(noticeVO.getPopYn().equals("")) {
			noticeVO.setPopYn("N");
		}
		noticedao.modifyNotice(noticeVO);

	}

	@Override
	public List<ManagerNoticeVO> popUpNotice() throws SQLException {
		List<ManagerNoticeVO> list = noticedao.popUpNotice();

		return list;
	}

	@Override
	public ManagerNoticeVO popUpNoticeByNo(String nNo) throws SQLException {
		ManagerNoticeVO noticeVO = noticedao.popUpNoticeByNo(nNo);
		return noticeVO;
	}




}
