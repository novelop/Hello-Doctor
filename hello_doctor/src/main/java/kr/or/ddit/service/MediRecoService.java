package kr.or.ddit.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.MediRegistCommand;
import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.DocuOrderVO;

public interface MediRecoService {

	Map<String, Object> selectAllReco(String dId)throws Exception;

	Map<String,Object> selectOneReco(String dId)throws Exception;

	String docuinput(String dId)throws SQLException;

	Map<String,Object> pastreco(String mNo)throws SQLException;

	String registTempPic(String name)throws SQLException;

	Map<String,Object> reservationDetail(String taNo)throws Exception;
	String durCheck(List<String> drugNm)throws SQLException;
	List<ChartFormVO> watingList(String dId)throws SQLException;

	boolean overDose(String drugNm, int quantity)throws SQLException;

	void registChart(MediRegistCommand command, String dId, String dName)throws SQLException, IOException;
	public String getPic(String mpNo) throws SQLException;
	public String getFile(String mfNo) throws SQLException;
	Map<String,Object> coRegistForm(String pNo)throws SQLException;
	List<DocuOrderVO> selectAllOrder(String dId) throws SQLException;

}
