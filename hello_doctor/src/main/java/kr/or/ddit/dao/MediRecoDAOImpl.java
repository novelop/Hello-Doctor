package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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

public class MediRecoDAOImpl implements MediRecoDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<ChartFormVO> selectAllReco(String dId) throws SQLException {
		List<ChartFormVO> list = session.selectList("MediReco-Mapper.selectAllReco1", dId);
		System.out.println("medireco" +list);
		return list;
	}
	@Override
	public List<MediRecoVO> pastmedireco(String pNo) throws SQLException {

		List<MediRecoVO> list = session.selectList("MediReco-Mapper.pastmedireco" , pNo);

		return list;
	}
	@Override
	public List<MediRecoVO> pastmedireco2(String pNo) throws SQLException {

		List<MediRecoVO> list = session.selectList("MediReco-Mapper.pastmedireco2" , pNo);

		return list;
	}
	@Override
	public PatientVO patientinfo(String pNo) throws SQLException {
		PatientVO vo = session.selectOne("MediReco-Mapper.patientinfo", pNo);
		return vo;
	}
	@Override
	public String docuinput(String dId) throws SQLException {
		String result = session.selectOne("MediReco-Mapper.docuinput", dId);
		return result;
	}
	@Override
	public MediRecoVO pastsymptom(String mNo) throws SQLException {

		MediRecoVO result = session.selectOne("MediReco-Mapper.pastsymptom", mNo);
		return result;
	}
	@Override
	public int gettemppdsSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.gettemppdsSeq");

		return result;
	}
	@Override
	public void registTempPic(String name) throws SQLException {
		session.insert("MediReco-Mapper.registTempPic", name);
	}
	@Override
	public String durCheck(String durgNm) throws SQLException {

			String result = session.selectOne("MyDrug-Mapper.durCheck", durgNm);
		return result;
	}
	@Override
	public int overDose(String drugNm) throws SQLException {
		int result = session.selectOne("OurDrug-Mapper.overDose", drugNm);

		return result;
	}
	@Override
	public void registchart(MediRecoVO vo) throws SQLException {

		session.update("MediReco-Mapper.registchart", vo);

	}
	@Override
	public int getSubDSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.getSubDSeq");
		return result;
	}
	@Override
	public int getChartSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.getChartSeq");
		return result;
	}
	@Override
	public int getIssueSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.getIssueSeq");
		return result;
	}
	@Override
	public void registIssue(IssueVO vo) throws SQLException {
		session.insert("MediReco-Mapper.registIssue", vo);
	}
	@Override
	public int getPrescriptSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.getPrescriptSeq");
		return result;
	}
	@Override
	public void registPrescript(PrescriptVO vo) throws SQLException {
		session.insert("MediReco-Mapper.registPrescript", vo);

	}
	@Override
	public int getMediPictureSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.getMediPictureSeq");
		return result;
	}
	@Override
	public void registMedPic(MedPicVO vo) throws SQLException {
		session.insert("MediReco-Mapper.registMedPic", vo);
	}
	@Override
	public int getMediFileSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.getMediFileSeq");
		return result;
	}
	@Override
	public void registMedFile(MedFileVO vo) throws SQLException {
		session.insert("MediReco-Mapper.registMedFile", vo);
	}
	@Override
	public void registSubD(SubDVO vo) throws SQLException {
		session.insert("MediReco-Mapper.registSubD", vo);
	}
	@Override
	public List<MedPicVO> getAllPic(String mNo) throws SQLException {
		List<MedPicVO> result =  session.selectList("MediReco-Mapper.getAllPic", mNo);
		return result;
	}
	@Override
	public List<MedFileVO> getAllFile(String mNo) throws SQLException {
		List<MedFileVO> result =  session.selectList("MediReco-Mapper.getAllFile", mNo);
		return result;
	}
	@Override
	public String getPic(String mpNo) throws SQLException {
		String result = session.selectOne("MediReco-Mapper.getPic", mpNo);
		return result;
	}
	@Override
	public String getFile(String mfNo) throws SQLException {
		String result = session.selectOne("MediReco-Mapper.getFile", mfNo);
		return result;
	}
	@Override
	public int getComRecoSeq() throws SQLException {

		int result = session.selectOne("MediReco-Mapper.getComRecoSeq");

		return result;
	}
	@Override
	public void registComReco(ComRecoVO vo) throws SQLException {
		 session.insert("MediReco-Mapper.registComReco", vo);
	}
	@Override
	public List<CoMedVO> endCooperation(String pNo) throws SQLException {
			List<CoMedVO> result = session.selectList("MediReco-Mapper.endCooperation", pNo);
		return result;
	}
	@Override
	public void updateOrderUse(MyOrderVO vo) throws SQLException {

		session.update("MediReco-Mapper.updateOrderUse", vo);

	}
	@Override
	public void updateTaStatus(String taNo) throws SQLException {

		session.update("MediReco-Mapper.updateTaStatus", taNo);

	}
	@Override
	public void updateRsvStatus(String rsvNo) throws SQLException {
		session.update("MediReco-Mapper.updateRsvStatus", rsvNo);

	}
	@Override
	public int getIssueReSeq() throws SQLException {
		int result = session.selectOne("MediReco-Mapper.getIssueReSeq");
		return result;
	}
	@Override
	public void insertIssueRead(IssueReadynVO vo) throws SQLException {
		System.out.println("여기도??");
		System.out.println(vo);
		session.insert("MediReco-Mapper.insertIssueRead", vo);

	}
	@Override
	public List<DocuOrderVO> selectAllOrder(String dId) throws SQLException {

		List<DocuOrderVO> result = session.selectList("MediReco-Mapper.selectAllOrder", dId);

		return result;
	}

}
