package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.InsertOrderSetCommand;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.MyOrderDAO;
import kr.or.ddit.dao.OrdersetDAO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MyOrderListVO;
import kr.or.ddit.dto.MyOrderVO;
import kr.or.ddit.dto.OrdersetVO;
import kr.or.ddit.dto.UsedOrdersetVO;

public class MyOrderServiceImpl implements MyOrderService {
	private MyOrderDAO my_OrderDAO;
	private OrdersetDAO ordersetDAO;
	
	public void setMy_OrderDAO(MyOrderDAO my_OrderDAO) {
		this.my_OrderDAO = my_OrderDAO;
	}
	public void setOrdersetDAO(OrdersetDAO ordersetDAO) {
		this.ordersetDAO = ordersetDAO;
	}
	
	
	
	@Override
	public List<OrdersetVO> orderdruglist(String mo_no) throws SQLException {
		List<OrdersetVO> list = my_OrderDAO.orderdruglist(mo_no);

		return list;
	}

	
	
	@Override
	public  Map<String, Object> myOrderList(SearchCriteria cri) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
        cri.setPerPageNum(10);

		List<MyOrderVO> result = my_OrderDAO.myOrderList(cri);
		int totalCount = my_OrderDAO.myOrderListCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		map.put("myOrderList", result);
		map.put("pageMaker", pageMaker);

		 return map;
	}
	
	@Override
	public void insertMyOrderset(HttpSession session, InsertOrderSetCommand vo) throws SQLException {
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();

		String moNo = my_OrderDAO.selectMyOrdersetSeqNext();
		String oCla = ordersetDAO.selectMyMajor(dId);

		vo.setDocId(dId);
		vo.setMoNo(moNo);
		vo.setoCla(oCla);
		my_OrderDAO.insertMyOrderset(vo);

		List<OrdersetVO> drugList = vo.getDrugList();
		for(OrdersetVO ordersetVO : drugList) {
			ordersetVO.setMoNo(moNo);
			my_OrderDAO.insertMyDrugs(ordersetVO);
		}
		
	}
	@Override
	public Map<String, Object> getMyOrdersetDetail(HttpSession session, String moNo) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		DoctorVO doctor = (DoctorVO) session.getAttribute("doctorLogin");
		String dId = doctor.getdId();
		
		String myCla = ordersetDAO.selectMyMajor(dId);
		
		OrdersetVO ordersetVo = my_OrderDAO.selectMyOrdersetDetail(moNo);
		System.out.println(ordersetVo);
		ordersetVo.setMyCla(myCla);
		
		List<OrdersetVO> drugList = my_OrderDAO.orderdruglist(moNo);	
		
		List<UsedOrdersetVO> recoList = my_OrderDAO.selectUsedOrderset(moNo);
		
		dataMap.put("recoList", recoList);
		dataMap.put("myOrdersetVo", ordersetVo);
		dataMap.put("drugList", drugList);
		
		return dataMap;
	}
	@Override
	public void updateResult(MyOrderVO vo) throws SQLException {
		my_OrderDAO.updateResult(vo);
		
	}
	@Override
	public void UpdateMyOrderset(InsertOrderSetCommand vo) throws SQLException {
		my_OrderDAO.modifyMyOrderset(vo);
		my_OrderDAO.deleteMyOrdersetDrugs(vo.getMoNo());
		
		List<OrdersetVO> drugList = vo.getDrugList();
		for(OrdersetVO ordersetVO : drugList) {
			ordersetVO.setMoNo(vo.getMoNo());
			my_OrderDAO.insertMyDrugs(ordersetVO);
		}
		
	}
	@Override
	public void deleteMyOrderset(String moNo) throws SQLException {
		my_OrderDAO.deleteMyOrderset(moNo);
	}
	
	@Override
	public String uploadMyOrderset(HttpSession session, MyOrderVO vo) throws SQLException {
		my_OrderDAO.updateCaution(vo);
		
		String moNo = vo.getMoNo();
		
		Map<String, Object> dataMap = getMyOrdersetDetail(session,moNo);
		
		OrdersetVO myOrderset = (OrdersetVO) dataMap.get("myOrdersetVo");
		
		List<OrdersetVO> drugList = (List<OrdersetVO>) dataMap.get("drugList");
		
		InsertOrderSetCommand command = new InsertOrderSetCommand();
		
		command.setMyOrderset(myOrderset);
		
		String oNo = ordersetDAO.selectOrdersetSeqNext();
		command.setoNo(oNo);
		
		ordersetDAO.insertOrderset(command);
		
		for(OrdersetVO ordersetVO : drugList) {
			ordersetVO.setoNo(oNo);
			ordersetDAO.insertDrugs(ordersetVO);
		}
		
		return oNo;
		
	}


}
