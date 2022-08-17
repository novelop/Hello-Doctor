package kr.or.ddit.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;

import kr.or.ddit.command.MediRegistCommand;
import kr.or.ddit.dao.CoTaskDAO;
import kr.or.ddit.dao.CooperMyDao;
import kr.or.ddit.dao.DoctorDAO;
import kr.or.ddit.dao.MediRecoDAO;
import kr.or.ddit.dao.MyOrderDAO;
import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoDoctorListVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.CoTaskVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.DocuOrderVO;
import kr.or.ddit.dto.IssueReadynVO;
import kr.or.ddit.dto.IssueVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.MedFileVO;
import kr.or.ddit.dto.MedPicVO;
import kr.or.ddit.dto.MediRecoVO;
import kr.or.ddit.dto.MyOrderListVO;
import kr.or.ddit.dto.MyOrderVO;
import kr.or.ddit.dto.PatientVO;
import kr.or.ddit.dto.PrescriptVO;
import kr.or.ddit.dto.SubTaskVO;
import kr.or.ddit.dto.SubDVO;
import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.util.MakeSequence;

public class MediRecoServiceImpl implements MediRecoService {
	private MediRecoDAO mediRecodao;
	private CoTaskDAO coTaskdao;
	private MyOrderDAO myOrderdao;
	private DoctorDAO doctorDAO;
	private CooperMyDao cooperMydao;

	public void setCooperMydao(CooperMyDao cooperMydao) {
		this.cooperMydao = cooperMydao;
	}

	public void setMediRecodao(MediRecoDAO mediRecodao) {
		this.mediRecodao = mediRecodao;
	}

	public void setCoTaskdao(CoTaskDAO coTaskdao) {
		this.coTaskdao = coTaskdao;
	}

	public void setMyOrderdao(MyOrderDAO myOrderdao) {
		this.myOrderdao = myOrderdao;
	}

	public void setDoctorDAO(DoctorDAO doctorDAO) {
		this.doctorDAO = doctorDAO;
	}

	@Resource(name = "recoFilePath")
	private String recoFilePath;

	@Override
	public Map<String, Object> selectAllReco(String dId) throws Exception {
		List<ChartFormVO> result = new ArrayList<ChartFormVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<ChartFormVO> medilist = mediRecodao.selectAllReco(dId);
		List<ChartFormVO> colist = coTaskdao.selectAllReco(dId);
		List<MyOrderListVO> orderlist = myOrderdao.myorderList(dId);
		for (int i = 0; i < medilist.size(); i++) {

			result.add(medilist.get(i));
		}
		for (int i = 0; i < colist.size(); i++) {
			result.add(colist.get(i));
		}
		Collections.sort(result, new SortByDate());

		for (int i = 0; i < result.size(); i++) {

		}
		map.put("patient", result);
		map.put("orderset", orderlist);

		return map;
	}

	class SortByDate implements Comparator<ChartFormVO> {

		@Override
		public int compare(ChartFormVO o1, ChartFormVO o2) {
			// TODO Auto-generated method stub
			return (o1.getReservedate()).compareTo((String) o2.getReservedate());
		}
	}

	@Override
	public Map<String, Object> selectOneReco(String dId) throws Exception {
		List<ChartFormVO> result = new ArrayList<ChartFormVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<ChartFormVO> medilist = mediRecodao.selectAllReco(dId);
		List<ChartFormVO> colist = coTaskdao.selectAllReco(dId);
		List<MyOrderListVO> orderlist = myOrderdao.myorderList(dId);
		String pNo = null;
		List<MediRecoVO> pastreco = null;
		PatientVO patientinfo = null;
		if (medilist != null) {
			for (int i = 0; i < medilist.size(); i++) {

				result.add(medilist.get(i));
			}
		}
		if (colist != null) {
			for (int i = 0; i < colist.size(); i++) {
				result.add(colist.get(i));
			}
		}
		Collections.sort(result, new SortByDate());
		if (!result.isEmpty()  && result != null ) {
			pNo = result.get(0).getpNo();

			pastreco = mediRecodao.pastmedireco(pNo);
			patientinfo = mediRecodao.patientinfo(pNo);
			patientinfo.setRsvNo(result.get(0).getRsvNo());
			// 나이 구하기
			String pRnum = patientinfo.getpRnum();
			pRnum = age(pRnum);
			patientinfo.setpRnum(pRnum);
			// 보험가입여부
			String pInsurance = patientinfo.getpInsurance();
			if (pInsurance.equals("Y")) {
				pInsurance = "의료보험가입";
			} else {
				pInsurance = "보험미가입";
			}
			patientinfo.setpInsurance(pInsurance);

			// 재진 여부 확인
			if (pastreco.isEmpty()) {
				patientinfo.setpAddress("초진");
			} else {
				patientinfo.setpAddress("재진");
			}

		}
		if (!result.isEmpty()  && result != null ) {
			String taNo = result.get(0).getTaNo();
			map.put("taNo", taNo);
			patientinfo.setCoNo(result.get(0).getCoNo());
			result.remove(0);
		}


		map.put("pNo", pNo);
		map.put("patient", result);
		map.put("orderset", orderlist);
		map.put("pastreco", pastreco);
		map.put("patientinfo", patientinfo);
		return map;
	}

	public String age(String rnum) {

		int age = Integer.parseInt(rnum.substring(0, 2));
		char ch = rnum.charAt(7);
		LocalDate current_date = LocalDate.now();
		int current_Year = current_date.getYear();

		if (ch == '1' || ch == '2') {
			age = current_Year - (1900 + age) + 1;
		} else if (ch == '3' || ch == '4') {
			age = current_Year - (2000 + age) + 1;
		}
		return age + "";
	}

	@Override
	public String docuinput(String dId) throws SQLException {
		String result = mediRecodao.docuinput(dId);

		return result;
	}

	@Override
	public Map<String, Object> pastreco(String mNo) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		MediRecoVO pastsymptom = mediRecodao.pastsymptom(mNo);
		List<PrescriptVO> orderdruglist = myOrderdao.pastdrug(mNo);
		List<SubDVO> sub_dlist = myOrderdao.pastsubD(mNo);
		List<MedPicVO> pic = mediRecodao.getAllPic(mNo);
		List<MedFileVO> file = mediRecodao.getAllFile(mNo);
		map.put("pastsymptom", pastsymptom);
		map.put("orderdruglist", orderdruglist);
		map.put("sub_dlist", sub_dlist);
		map.put("pic", pic);
		if (file != null) {
			for (int i = 0; i < file.size(); i++) {
				String fileName = file.get(i).getMfFilename();
				String renew = MakeFileName.parseFileNameFromUUID(fileName, "\\&\\&");
				file.get(i).setMfFilename(renew);
			}
		}
		map.put("file", file);
		return map;
	}

	@Override
	public String registTempPic(String name) throws SQLException {
		int num = mediRecodao.gettemppdsSeq();

		String seq = MakeSequence.makeSequence("T", num);
		String result = name + seq + ".png";

		mediRecodao.registTempPic(result);

		return result;

	}

	@Override
	public Map<String, Object> reservationDetail(String taNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		CoTaskVO vo = coTaskdao.mycotask(taNo);
		List<SubTaskVO> list = coTaskdao.mySubCoTask(taNo);
		String dName = doctorDAO.searchDoctorName(vo.getdId());
		map.put("coTask", vo);
		map.put("subCoTask", list);
		map.put("dName", dName);

		return map;
	}

	@Override
	public String durCheck(List<String> drugNm) throws SQLException {
		String result = "1";
		System.out.println(drugNm);
		for (String drug : drugNm) {
			String checkresult = mediRecodao.durCheck(drug);
			System.out.println(checkresult);
			if (!checkresult.equals("0")) {
				return result = "0";
			}
		}
		return result;
	}

	@Override
	public List<ChartFormVO> watingList(String dId) throws SQLException {

		List<ChartFormVO> result = mediRecodao.selectAllReco(dId);

		return result;
	}

	@Override
	public boolean overDose(String drugNm, int quantity) throws SQLException {
		boolean result = true;

		int limit = mediRecodao.overDose(drugNm);

		if (limit < quantity) {
			result = false;
		}

		return result;
	}

	@Override
	public void registChart(MediRegistCommand command, String dId,String dName) throws SQLException, IOException {
		MediRecoVO mediRecoVO = new MediRecoVO();
		IssueVO issueVO = new IssueVO();
		SubDVO subDVO = new SubDVO();
		ComRecoVO comRecoVO = new ComRecoVO();
		String issNo = null;
		if (command.getIssue() != null && !command.getIssue().equals("") ){

			int issueSeq = mediRecodao.getIssueSeq();
			issNo = MakeSequence.makeSequence("IS", issueSeq);
			issueVO.setIssNo(issNo);
			issueVO.setIssContent(command.getIssue());
			mediRecodao.registIssue(issueVO);

			LogHistoryVO logHistoryVO = new LogHistoryVO();

			int seq = cooperMydao.makeLogSeq();
			String hiNo = MakeSequence.makeSequence("LOG", seq);
			logHistoryVO.setHiNo(hiNo);
			logHistoryVO.setCoNo(command.getCoNo());
			logHistoryVO.setdName(dName);
			logHistoryVO.setHiCla(5);
			logHistoryVO.setHiReference(issNo);
			logHistoryVO.setHiContent("특이사항을 등록하였습니다.");
			cooperMydao.insertLog(logHistoryVO);

			List<CoDoctorListVO> list = cooperMydao.coDocList(command.getCoNo());

			for(CoDoctorListVO vo : list) {
				IssueReadynVO isrVO = new IssueReadynVO();
			int temp = 	mediRecodao.getIssueReSeq();
			System.out.println(temp+"temp");
			String isrno = MakeSequence.makeSequence("ISR", temp);
			System.out.println(isrno+"isrno");
			isrVO.setIssreNo(isrno);
			isrVO.setdId(vo.getdId());
			isrVO.setIssNo(issNo);
			isrVO.setCoNo(command.getCoNo());
			isrVO.setIssYn("Y");
			mediRecodao.insertIssueRead(isrVO);
			}
		}

		// 진료 기록 저장
		int chartSeq = mediRecodao.getChartSeq();
		String mNo = MakeSequence.makeSequence("M", chartSeq);
		if (issNo != null) {
			mediRecoVO.setIssNo(issNo);

		}
		if (command.getDiseaseName() != null) {

			for (int i = 0; i < command.getDiseaseName().size(); i++) {
				if (command.getAccount().get(i).equals("주상병")) {
					mediRecoVO.setdName(command.getDiseaseName().get(i));
				}
			}
		}
		String moNo = command.getOrderuse();

		mediRecoVO.setmNo(mNo);
		mediRecoVO.setdId(dId);
		mediRecoVO.setpNo(command.getpNo());
		String changebr = command.getChart().replaceAll("\r\n", "<br>");
		mediRecoVO.setSymptom(changebr);
		mediRecodao.registchart(mediRecoVO);

		// 부상병 등록

		if (command.getDiseaseName() != null) {
			for (int i = 0; i < command.getDiseaseName().size(); i++) {
				if (command.getAccount().get(i).equals("부상병")) {
					subDVO.setmNo(mNo);
					subDVO.setSubDName(command.getDiseaseName().get(i));
					mediRecodao.registSubD(subDVO);
				}
			}
		}
		// webcam사진 등록 및 저장
		List<String> temppic = command.getTemppic();
		if (temppic != null) {
			for (int i = 1; i < temppic.size(); i += 2) {
				String data = temppic.get(i);
			
				byte[] imageBytes = DatatypeConverter.parseBase64Binary(data);
				int num = mediRecodao.gettemppdsSeq();
				System.out.println(imageBytes);
				String seq = MakeSequence.makeSequence("T", num);
				String result = seq + ".png";
				String fileName = MakeFileName.toUUIDFileName(result, "$$");
				
				BufferedImage bufImg = ImageIO.read(new ByteArrayInputStream(imageBytes));
				ImageIO.write(bufImg, "png", new File(recoFilePath + fileName));
				MedPicVO medPicVO = new MedPicVO();
				medPicVO.setmNo(mNo);
				medPicVO.setMpNo(seq);
				medPicVO.setMpName(fileName);
				mediRecodao.registMedPic(medPicVO);
			}
		}

		// 일반 사진 && 파일 등록 및 저장
		if (command.getPictureFile() != null && !command.getPictureFile().isEmpty()) {
			for (int i = 0; i < command.getPictureFile().size(); i++) {

				if (command.getPictureFile().get(i) != null && !command.getPictureFile().get(i).isEmpty()) {
					String fileName = MakeFileName.toUUIDFileName(command.getPictureFile().get(i).getOriginalFilename(),
							"&&");
					File storedFile = new File(recoFilePath, fileName);

					storedFile.mkdirs();

					command.getPictureFile().get(i).transferTo(storedFile);

					MedPicVO medPicVO = new MedPicVO();
					int picSeq = mediRecodao.getMediPictureSeq();
					String mpNo = MakeSequence.makeSequence("MP", picSeq);
					medPicVO.setmNo(mNo);
					medPicVO.setMpNo(mpNo);
					medPicVO.setMpName(fileName);

					mediRecodao.registMedPic(medPicVO);

				}
			}
		}
		if (command.getTextFile() != null && !command.getTextFile().isEmpty()) {
			for (int i = 0; i < command.getTextFile().size(); i++) {
				if (command.getTextFile().get(i) != null && !command.getTextFile().get(i).isEmpty()) {
					String fileName = MakeFileName.toUUIDFileName(command.getTextFile().get(i).getOriginalFilename(),
							"&&");
					File storedFile = new File(recoFilePath, fileName);
					storedFile.mkdirs();
					command.getTextFile().get(i).transferTo(storedFile);

					MedFileVO medFileVO = new MedFileVO();

					int fileSeq = mediRecodao.getMediFileSeq();
					String mfNo = MakeSequence.makeSequence("MF", fileSeq);
					medFileVO.setmNo(mNo);
					medFileVO.setMfNo(mfNo);
					medFileVO.setMfFilename(fileName);
					mediRecodao.registMedFile(medFileVO);
				}
			}

		}
		// 처방전 등록
		if (command.getDiseaseName() != null && !command.getDiseaseName().equals("")) {
			for (int i = 0; i < command.getDiseaseName().size(); i++) {
				PrescriptVO prescriptVO = new PrescriptVO();
				int prescriptSeq = mediRecodao.getPrescriptSeq();
				String preNo = MakeSequence.makeSequence("PRE", prescriptSeq);
				prescriptVO.setPreNo(preNo);
				prescriptVO.setmNo(mNo);
				prescriptVO.setCureName(command.getMedicineName().get(i));
				prescriptVO.setpDays(command.getDays().get(i));
				prescriptVO.setpQuantity(command.getQuantity().get(i));
				prescriptVO.setpAday(command.getAday().get(i));
					System.out.println(prescriptVO);
				mediRecodao.registPrescript(prescriptVO);
			}

		}
		if (command.getCoNo() != null && !command.getCoNo().equals("")) {
			int comSeq = mediRecodao.getComRecoSeq();
			String comNo = MakeSequence.makeSequence("COM", comSeq);
			comRecoVO.setCoNo(command.getCoNo());
			comRecoVO.setComNo(comNo);
			comRecoVO.setmNo(mNo);
			comRecoVO.setTaNo(command.getTaNo());

			System.out.println("comRecoVO" + comRecoVO);
			mediRecodao.registComReco(comRecoVO);
			mediRecodao.updateTaStatus(command.getTaNo());

		}
		if (command.getRsvNo() != null && !command.getRsvNo().equals("")) {

			mediRecodao.updateRsvStatus(command.getRsvNo());
		}

		if(moNo != null && !moNo.equals("")) {
			MyOrderVO vo = new MyOrderVO();

			vo.setMoNo(moNo);
			vo.setmNo(mNo);
			mediRecodao.updateOrderUse(vo);

		}
	}

	@Override
	public String getPic(String mpNo) throws SQLException {
		String result = mediRecodao.getPic(mpNo);
		return result;
	}

	@Override
	public String getFile(String mfNo) throws SQLException {
		String result = mediRecodao.getFile(mfNo);
		return result;
	}

	@Override
	public Map<String, Object> coRegistForm(String pNo) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoMedVO> pastreco = mediRecodao.endCooperation(pNo);
		PatientVO patientinfo = mediRecodao.patientinfo(pNo);
		map.put("pastreco", pastreco);
		map.put("patientinfo", patientinfo);
		return map;
	}

	@Override
	public List<DocuOrderVO> selectAllOrder(String dId) throws SQLException {
	 List<DocuOrderVO> result = mediRecodao.selectAllOrder(dId);

		return result;
	}
}
