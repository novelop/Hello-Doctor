package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.ComComentVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.DocuOrderVO;
import kr.or.ddit.dto.IssueReadynVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.MedFileVO;
import kr.or.ddit.dto.MedPicVO;
import kr.or.ddit.dto.MediRecoVO;
import kr.or.ddit.dto.MyOrderVO;
import kr.or.ddit.dto.PatientVO;
import kr.or.ddit.dto.PrescriptVO;
import kr.or.ddit.dto.SubDVO;

public interface MediRecoDAO {

	List<ChartFormVO> selectAllReco(String dId)throws SQLException;

	List<MediRecoVO> pastmedireco(String pNo)throws SQLException;
	List<MediRecoVO> pastmedireco2(String pNo)throws SQLException;

	PatientVO patientinfo(String pNo)throws SQLException;

	String docuinput(String dId)throws SQLException;

	MediRecoVO pastsymptom(String mNo) throws SQLException;

	int gettemppdsSeq()throws SQLException;

	void registTempPic(String name)throws SQLException;

	String durCheck(String durgNm)throws SQLException;

	int getComRecoSeq()throws SQLException;

	void registComReco(ComRecoVO vo) throws SQLException;
	int overDose(String drugNm)throws SQLException;

	void registchart(MediRecoVO vo)throws SQLException;
	int getSubDSeq()throws SQLException;
	void registSubD(SubDVO vo)throws SQLException;

	int getChartSeq()throws SQLException;
	int getIssueSeq()throws SQLException;
	void registIssue(IssueVO vo)throws SQLException;
	int getPrescriptSeq()throws SQLException;
	void registPrescript(PrescriptVO vo)throws SQLException;
	int getMediPictureSeq()throws SQLException;
	void registMedPic(MedPicVO vo)throws SQLException;
	int getMediFileSeq()throws SQLException;
	void registMedFile(MedFileVO vo)throws SQLException;
	List<MedPicVO> getAllPic(String mNo)throws SQLException;
	List<MedFileVO> getAllFile(String mNo)throws SQLException;
	String getPic(String mpNo)throws SQLException;
	String getFile(String mfNo)throws SQLException;
	List<CoMedVO> endCooperation(String pNo) throws SQLException;
	void updateOrderUse(MyOrderVO vo)throws SQLException;
	void updateTaStatus(String taNo)throws SQLException;
	void updateRsvStatus(String rsvNo)throws SQLException;
	int getIssueReSeq()throws SQLException;
	void insertIssueRead(IssueReadynVO vo)throws SQLException;
	List<DocuOrderVO> selectAllOrder(String dId)throws SQLException;

}
