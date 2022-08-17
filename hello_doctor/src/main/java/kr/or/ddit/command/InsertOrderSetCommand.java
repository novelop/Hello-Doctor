package kr.or.ddit.command;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.dto.OrdersetVO;


public class InsertOrderSetCommand {
	private String oNo;
	private String moNo;
	private String docId;
	private String dName;
	private String oDname;
	private String oViewcnt;
	private String oCla;
	private String oNoti;
	private String oTarget;
	private String oRegdate;
	private String oCaution;
	private String oResult;
	private String delYn;
	private String oTitle;
	private List<String> oDrug;
	private List<String> quantity;
	private List<String> dgAday;
	private List<String> dgDays;
	private List<OrdersetVO> drugList; 
	private OrdersetVO myOrderset;
	
	
	
	
	public OrdersetVO getMyOrderset() {
		return myOrderset;
	}

	public void setMyOrderset(OrdersetVO myOrderset) {
		this.docId = myOrderset.getDocId();
		this.oDname = myOrderset.getoDname();
		this.oCla = myOrderset.getoCla();
		this.oTarget = myOrderset.getoTarget();
		this.oCaution = myOrderset.getoCaution();
		this.oResult = myOrderset.getoResult();
		this.oTitle = myOrderset.getoTitle();
		this.oNoti = myOrderset.getoNoti();
	}

	public String getMoNo() {
		return moNo;
	}

	public void setMoNo(String moNo) {
		this.moNo = moNo;
	}
	public String getoNoti() {
		return oNoti;
	}
	
	public void setoNoti(String oNoti) {
		this.oNoti = oNoti;
	}
	
	public List<OrdersetVO> getDrugList() {
		
		 List<OrdersetVO> drugList = new ArrayList<OrdersetVO>();
		 
		 for(int i=0; i< this.oDrug.size(); i++) {
			 OrdersetVO vo = new OrdersetVO();
			 vo.setoNo(this.oNo);
			 vo.setoDrug(this.oDrug.get(i));
			 vo.setQuantity(this.quantity.get(i));
			 vo.setDgAday(this.dgAday.get(i));
			 vo.setDgDays(this.dgAday.get(i));
			 drugList.add(vo);
		 }
	    
		return drugList;
	}
	
	public void setDrugList(List<OrdersetVO> drugList) {
		this.drugList = drugList;
	}
	
	
	public String getoNo() {
		return oNo;
	}
	public void setoNo(String oNo) {
		this.oNo = oNo;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getoDname() {
		return oDname;
	}
	public void setoDname(String oDname) {
		this.oDname = oDname;
	}
	public String getoViewcnt() {
		return oViewcnt;
	}
	public void setoViewcnt(String oViewcnt) {
		this.oViewcnt = oViewcnt;
	}
	public String getoCla() {
		return oCla;
	}
	public void setoCla(String oCla) {
		this.oCla = oCla;
	}
	public String getoTarget() {
		return oTarget;
	}
	public void setoTarget(String oTarget) {
		this.oTarget = oTarget;
	}
	public String getoRegdate() {
		return oRegdate;
	}
	public void setoRegdate(String oRegdate) {
		this.oRegdate = oRegdate;
	}
	public String getoCaution() {
		return oCaution;
	}
	public void setoCaution(String oCaution) {
		this.oCaution = oCaution;
	}
	public String getoResult() {
		return oResult;
	}
	public void setoResult(String oResult) {
		this.oResult = oResult;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getoTitle() {
		return oTitle;
	}
	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}
	public List<String> getoDrug() {
		return oDrug;
	}
	public void setoDrug(List<String> oDrug) {
		this.oDrug = oDrug;
	}
	public List<String> getQuantity() {
		return quantity;
	}
	public void setQuantity(List<String> quantity) {
		this.quantity = quantity;
	}
	public List<String> getDgAday() {
		return dgAday;
	}
	public void setDgAday(List<String> dgAday) {
		this.dgAday = dgAday;
	}
	public List<String> getDgDays() {
		return dgDays;
	}
	public void setDgDays(List<String> dgDays) {
		this.dgDays = dgDays;
	}

}
