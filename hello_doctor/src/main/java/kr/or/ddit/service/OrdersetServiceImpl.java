package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.OrdersetDAO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.OrderSetShareVO;
import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.util.MakeSequence;

public class OrdersetServiceImpl implements OrdersetService {

	private OrdersetDAO ordersetDAO;

	public void setOrdersetDAO(OrdersetDAO ordersetDAO) {
		this.ordersetDAO = ordersetDAO;
	}

	@Override
	public Map<String,Object> getOrdersetList(HttpSession session, SearchCriteria cri) throws SQLException {
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();

		SearchCriteria searchCri = (SearchCriteria) cri;
		searchCri.setPerPageNum(8);
		searchCri.setDId(dId);
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<Map<String, Object>> ordersetList = new ArrayList<Map<String,Object>>();
		Map<String, Object> map= null;

		List<OrdersetVO> list = ordersetDAO.selectOrdersetList(cri);
		List<OrdersetVO> drugList = null;
		int recoCnt = 0;

		for(OrdersetVO orderset : list) {
			map= new HashMap<String, Object>();
			recoCnt = ordersetDAO.selectRecommendCount(orderset.getoNo());
			drugList = ordersetDAO.selectDrugList(orderset.getoNo());

			orderset.setRecoCnt(recoCnt);
			map.put("orderset", orderset);
			map.put("drugList", drugList);
			ordersetList.add(map);
		}

		// 전체 오더세트리스트 개수
		int totalCount = ordersetDAO.selectOrdersetListCount(cri);

		// PageMaker 생성.
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(totalCount);

				dataMap.put("ordersetList", ordersetList);
				dataMap.put("pageMaker", pageMaker);


		return dataMap;
	}

	@Override
	public void insertOrderset( HttpSession session, InsertOrderSetCommand vo) throws SQLException {
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();

		String oNo = ordersetDAO.selectOrdersetSeqNext();
		String oCla = ordersetDAO.selectMyMajor(dId);

		vo.setDocId(dId);
		vo.setoNo(oNo);
		vo.setoCla(oCla);
		ordersetDAO.insertOrderset(vo);

		List<OrdersetVO> drugList = vo.getDrugList();
		for(OrdersetVO ordersetVO : drugList) {
			ordersetVO.setoNo(oNo);
			ordersetDAO.insertDrugs(ordersetVO);
		}
	}

	@Override
	public List<OrdersetVO> searchDrugList(String keyword) throws SQLException {
		List<OrdersetVO> list= ordersetDAO.searchDrugList(keyword);
		return list;
	}

	@Override
	public Map<String, Object> getOrdersetDetail(HttpSession session,String oNo,SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();

		//내 전공명
		String myCla = ordersetDAO.selectMyMajor(dId);

		//오더세트 상세조회
		OrdersetVO ordersetVo = ordersetDAO.selectOrdersetDetail(oNo);
		//추천수
		int recoCnt = ordersetDAO.selectRecommendCount(ordersetVo.getoNo());
		ordersetVo.setRecoCnt(recoCnt);
		ordersetVo.setMyCla(myCla);

		//내 추천상태
		String rStatus = selectMyRecommand(dId,oNo);

		OrdersetVO vo = new OrdersetVO();
		vo.setoNo(oNo);
		vo.setoDname(ordersetVo.getoDname());

		if(rStatus.equals("1")) {
			ordersetVo.setrStatus(rStatus);
		}else {
			ordersetVo.setrStatus("0");
		}

		//처방내역
		List<OrdersetVO> drugList = ordersetDAO.selectDrugList(oNo);

		int totalCount = ordersetDAO.selectReplyCount(oNo);
		
		SearchCriteria searchCri = (SearchCriteria) cri;
		searchCri.setPerPageNum(5);
		
		//댓글 리스트
				List<OrdersetVO> ordersetReplyList = ordersetDAO.selectOrdersetReplyList(cri,oNo);
		
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("ordersetVo", ordersetVo);
		dataMap.put("drugList", drugList);
		//연관오더세트
        dataMap.put("ordersetList", getRelationOrderset(vo));
        dataMap.put("ordersetReplyList",ordersetReplyList);

		return dataMap;
	}

	@Override
	public List<Map<String, Object>> getRelationOrderset(OrdersetVO ordersetVO) throws SQLException {
		List<Map<String, Object>> ordersetList = new ArrayList<Map<String,Object>>();
		Map<String, Object> map= null;

		List<OrdersetVO> list = ordersetDAO.selectRelationOrderset(ordersetVO);

		List<OrdersetVO> drugList = null;
		int recoCnt = 0;

		for(OrdersetVO orderset : list) {
			map= new HashMap<String, Object>();
			recoCnt = ordersetDAO.selectRecommendCount(orderset.getoNo());
			drugList = ordersetDAO.selectDrugList(orderset.getoNo());

			orderset.setRecoCnt(recoCnt);
			map.put("orderset", orderset);
			map.put("drugList", drugList);
			ordersetList.add(map);
		}

		return ordersetList;
	}

	@Override
	public void increaseViewCnt(String oNo) throws SQLException {
		ordersetDAO.increaseViewCnt(oNo);
	}

	@Override
	public String updateRecommand(Map<String, String> map) throws SQLException {
		String result = null;
		String rStatus = (String) map.get("changeRs");

		if(rStatus.equals("1")) {
			ordersetDAO.insertRecommand(map);
			result = "1";
		}else {
			ordersetDAO.deleteRecommand(map);
			result = "0";
		}

		return result;
	}

	@Override
	public String selectMyRecommand(String dId, String oNo) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("oNo",oNo);
		map.put("dId",dId);

		String result = ordersetDAO.selectMyRecommand(map);

		return result;
	}

	@Override
	public void insertOrdersetFeedBack(OrdersetVO ordersetVO) throws SQLException {
	    ordersetDAO.insertOrdersetFeedBack(ordersetVO);
	}

	@Override
	public Map<String,String> updateOrdersetFeedBack(Map<String,String> map) throws SQLException {
		Map<String,String> result = new HashMap<String, String>();
		String fbNo = map.get("fbNo");
		String fbResult = map.get("fbResult");

		OrdersetVO vo = new OrdersetVO();
		vo.setFbResult(fbResult);
		vo.setFbNo(fbNo);

		ordersetDAO.updateOrdersetFeedBack(vo);

		OrdersetVO data = ordersetDAO.getOrdersetFeedBack(fbNo);


		result.put("fbResult",data.getFbResult());
		result.put("fbRegdate",data.getFbRegdate());

		return result;

	}

	@Override
	public void deleteOrdersetFeedBack(String fbNo) throws SQLException {
		ordersetDAO.deleteOrdersetFeedBack(fbNo);

	}

	@Override
	public void orderSetShare(String dId,String oNo , List<Map<String, String>> list) throws SQLException {
		for(int i= 0 ; i<list.size(); i++) {
			int seq = 	ordersetDAO.getOrderSetShareSeq();
			String osNo = MakeSequence.makeSequence("OS", seq);
			OrderSetShareVO vo = new OrderSetShareVO();
			vo.setdId(dId);
			vo.setDoId(list.get(i).get("dId"));
			vo.setOsNo(osNo);
			vo.setoNo(oNo);
			ordersetDAO.orderSetShare(vo);
		}
	}

	@Override
	public void UpdateOrderset(InsertOrderSetCommand vo) throws SQLException {

		ordersetDAO.modifyOrderset(vo);
		ordersetDAO.deleteOrdersetDrugs(vo.getoNo());

		List<OrdersetVO> drugList = vo.getDrugList();
		for(OrdersetVO ordersetVO : drugList) {
			ordersetVO.setoNo(vo.getoNo());
			ordersetDAO.insertDrugs(ordersetVO);
		}

	}

	@Override
	public void deleteOrderset(String oNo) throws SQLException {
		ordersetDAO.deleteOrderset(oNo);

	}

	@Override
	public Map<String,Object> getMainOrderset(HttpSession session) throws SQLException {
		SearchCriteria cri = new SearchCriteria();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<Map<String, Object>> ordersetList1 = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> ordersetList2 = new ArrayList<Map<String,Object>>();
		List<OrdersetVO> drugList = null;
		Map<String, Object> map= null;

		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();

		String maName = ordersetDAO.selectMyMajor(dId);

		List<OrdersetVO> list1 = ordersetDAO.selectMainRecoList1(maName);


		for(OrdersetVO orderset : list1) {
			map= new HashMap<String, Object>();
			drugList = ordersetDAO.selectDrugList(orderset.getoNo());

			map.put("orderset", orderset);
			map.put("drugList", drugList);
			ordersetList1.add(map);
		}

		List<OrdersetVO> list2 = ordersetDAO.selectMainRecoList2(maName);
		for(OrdersetVO orderset : list2) {
			map= new HashMap<String, Object>();
			drugList = ordersetDAO.selectDrugList(orderset.getoNo());

			map.put("orderset", orderset);
			map.put("drugList", drugList);
			ordersetList2.add(map);
		}

		List<OrdersetVO> feedbackList = ordersetDAO.selectFeedbackMainList(cri, dId);
		List<OrdersetVO> shareList = ordersetDAO.selectShareOrderset(cri, dId);
	    dataMap.put("feedbackList", feedbackList);
	    dataMap.put("shareList", shareList);

		dataMap.put("ordersetList1", ordersetList1);
		dataMap.put("ordersetList2", ordersetList2);
		return dataMap;

	}

	@Override
	public List<OrdersetVO> selectDrugList(String oNo) throws SQLException {
		return ordersetDAO.selectDrugList(oNo);
	}

	@Override
	public String selectMedicine(String meName) throws SQLException {
		return ordersetDAO.selectMedicine(meName);
	}

	@Override
	public Map<String, Object> selectFeedbackMainList(SearchCriteria cri ,String dId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(4);
		List<OrdersetVO> list = ordersetDAO.selectFeedbackMainList(cri,dId);
		int cnt = ordersetDAO.selectMainReplyCount(dId);
		
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
	
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("feedbackList", list);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectShareOrderset(SearchCriteria cri, String dId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(4);
		List<OrdersetVO> list = ordersetDAO.selectShareOrderset(cri,dId);
		int cnt = ordersetDAO.selectMainShareCount(dId);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
	
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("shareList", list);		
		
		return dataMap;
	}




}
