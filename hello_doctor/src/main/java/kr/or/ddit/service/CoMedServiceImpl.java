package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CoRegistCommand;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.CoMedDAO;
import kr.or.ddit.dao.MediRecoDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.ComComentVO;
import kr.or.ddit.dto.ComRecoVO;
import kr.or.ddit.dto.LogHistoryVO;
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.util.MakeSequence;

public class CoMedServiceImpl implements CoMedService{

	private CoMedDAO comedDao;
	private String maNo;
	public void setMediRecoDAO(MediRecoDAO mediRecoDAO) {
		this.mediRecoDAO = mediRecoDAO;
	}
	private MediRecoDAO mediRecoDAO;


	public void setCo_medDAO(CoMedDAO comedDao) {
		this.comedDao = comedDao;
	}











	@Override
	public Map<String, Object> getCooperationMainList(SearchCriteria cri) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria) cri;
		searchCri.setPerPageNum(12);
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<Map<String, Object>> coopermainList = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = null;

		//현재 page번호에 맞는 리스트를 perPageNum 개수만큼 가져오기
		List<CoMedVO> list = comedDao.selectAll(searchCri);
		List<CoMedVO> doctors = null;

		for(CoMedVO coopermain : list) {
			System.out.println(coopermain.getCoNo());
			map = new HashMap<String, Object>();
			doctors = comedDao.coopermain_doctors(coopermain.getCoNo());
			map.put("coopermain", coopermain);
			map.put("doctors", doctors);
			coopermainList.add(map);
		}
		//전체 글 개수
		int totalCount = 0;
		try {
			totalCount = comedDao.selectSearchCooperationCount(searchCri);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("coopermainList", coopermainList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}


	@Override
	public Map<String, Object> proceedingCooperation(SearchCriteria cri) throws SQLException {
		cri.setPerPageNum(12);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<CoMedVO>  list = null;
		int totalCount = 0;

		list = comedDao.proceedingCooperationMine(cri);
		try {
			totalCount = comedDao.selectSearchProceeding(cri);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("proceedingCooperation", list);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> completeCooperation(SearchCriteria cri) throws SQLException {
		cri.setPerPageNum(12);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<CoMedVO>  list = null;
		int totalCount = 0;

		list = comedDao.completeCooperationMine(cri);
		try {
			totalCount = comedDao.selectSearchComplete(cri);
		} catch (Exception e) {
			e.printStackTrace();
		}


		//PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("completeCooperation", list);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	//전체 협진리스트 중 사용자의 전공과 일치하는
	@Override
	public Map<String, Object> myCooperation(String d_id, SearchCriteria cri) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria) cri;
		searchCri.setPerPageNum(12);
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<CoMedVO> list = comedDao.myCooperation(d_id, searchCri);
		System.out.println("service에서==>" + list);

		for (CoMedVO mycooperation : list) {
			System.out.println("service에서 CoNo" + mycooperation.getCoNo());
			List<CoMedVO> doctors = comedDao.myCooperation_doctors(mycooperation.getCoNo());
			mycooperation.setDoctors(doctors);
			System.out.println("리스트에 닥터스 확인하기 ==>" + mycooperation.getDoctors());
		}

		int totalCount = 0;
		try {
			totalCount = comedDao.selectSearchMyCooperationCount(searchCri);
		} catch (Exception e) {
			e.printStackTrace();
		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("myCooperation", list);

		return dataMap;
	}

	@Override
	public Map<String, Object> iCooperation(SearchCriteria cri, String dId) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria) cri;
		searchCri.setPerPageNum(12);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<CoMedVO> iCooperation = comedDao.iCooperation(dId,cri);

		int totalCount = comedDao.iCooperationCount(dId, searchCri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("iCooperation", iCooperation);
		dataMap.put("pageMaker", pageMaker);



		return dataMap;
	}


	@Override
	public Map<String, Object> myCooperation_proceeding(String d_id,SearchCriteria cri) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria) cri;
		searchCri.setPerPageNum(12);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<CoMedVO> list = comedDao.myCooperation_proceeding(d_id);
		for(CoMedVO mycooperation_proceeding : list) {
			List<CoMedVO> doctors = comedDao.myCooperation_proceedingdoctors(mycooperation_proceeding.getCoNo());
			mycooperation_proceeding.setDoctors(doctors);
		}
		dataMap.put("myCooperation_proceeding", list);
		return dataMap;
	}

	@Override
	public Map<String, Object> myCooperation_complete(String d_id, SearchCriteria cri) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria) cri;
		searchCri.setPerPageNum(12);
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<CoMedVO> list = comedDao.myCooperation_complete(d_id);
		for(CoMedVO mycooperation_complete : list) {
			List<CoMedVO> doctors = comedDao.myCooperation_completedoctors(mycooperation_complete.getCoNo());
			mycooperation_complete.setDoctors(doctors);
		}
		dataMap.put("myCooperation_complete",list);
		return dataMap;
	}


	@Override
	public void coRegist(CoRegistCommand command) throws SQLException {
		CoMedVO coMedVO = new CoMedVO();
		CoDoctorVO coDoctorVO = new CoDoctorVO();
		int coseq = comedDao.getCoSeq();
		String coNo = MakeSequence.makeSequence("CO", coseq);
		coMedVO.setCoNo(coNo);
		coMedVO.setpNo(command.getpNo());
		coMedVO.setCoDoc(command.getdId());
		coMedVO.setCoDisease(command.getCoDisease());
		coMedVO.setCoOpinion(command.getCoOpinion());
		coMedVO.setCoRelease(command.getCoRelease());
		comedDao.registCoMedi(coMedVO);

		if(command.getPastco() != null && !command.getPastco().isEmpty()) {
				for(String pastco : command.getPastco()) {
						List<ComRecoVO> comRecoList = comedDao.selectAllComReco(pastco);
						if(comRecoList != null && !comRecoList.isEmpty()) {
								for(ComRecoVO recoVO : comRecoList ) {
										int comRecoseqNum = mediRecoDAO.getComRecoSeq();
										String comRecoseq = MakeSequence.makeSequence("COM", comRecoseqNum);
										String comNo = recoVO.getComNo();

										AttachVO attach = comedDao.selectAllAttach(comNo);
										ComComentVO comComent = comedDao.selectAllComComent(comNo);
										recoVO.setComNo(comRecoseq);
										recoVO.setCoNo(coNo);
										mediRecoDAO.registComReco(recoVO);


										//자료실 입력
										if(attach != null) {
										int attachseqNum = comedDao.getAttachSeq();
										String attachseq = MakeSequence.makeSequence("A", attachseqNum);
										attach.setComNo(comRecoseq);
										attach.setaNo(attachseq);
										}
										//진료 코멘트 입력
										if(comComent != null) {
										int comComentseqNum = comedDao.getComComentSeq();
										String comComentseq = MakeSequence.makeSequence("COMCO", comComentseqNum);
										comComent.setComNo(comRecoseq);
										comComent.setComCoNo(comComentseq);
										}
								}
						}

						List<LogHistoryVO> history = comedDao.selectAllLogHistory(pastco);
						if(history != null) {
							for(LogHistoryVO vo : history) {
							int  historyseqNum = comedDao.getLogHistorySeq();
							String historyseq = MakeSequence.makeSequence("HI", historyseqNum);
							vo.setHiNo(historyseq);
							vo.setCoNo(coNo);

							comedDao.insertLogHistroy(vo);
							}
						}
				}




		}



		coDoctorVO.setCoNo(coNo);
		coDoctorVO.setdId(command.getdId());
		coDoctorVO.setPatyYn("Y");
		coDoctorVO.setAuthority(2);
		comedDao.registCoDoctor(coDoctorVO);
		List<String> doIdList = command.getDoId();
		for(String doId : doIdList) {
			CoDoctorVO coDoctorVO2 = new CoDoctorVO();
			coDoctorVO2.setCoNo(coNo);
			coDoctorVO2.setdId(doId);
			coDoctorVO2.setPatyYn("N");
			coDoctorVO2.setAuthority(1);
			comedDao.registCoDoctor(coDoctorVO2);
		}
		for(String doId : doIdList) {
			NotiVO notiVO = new NotiVO();
			int notiSeq = comedDao.getNotiSeq();
			String notiNo = MakeSequence.makeSequence("NO", notiSeq);
			notiVO.setNotiNo(notiNo);
			notiVO.setReqdId(command.getdId());
			notiVO.setResdId(doId);
			notiVO.setCoNo(coNo);
			comedDao.registNoti(notiVO);
		}

	}



	@Override
	public List<CoMedVO> completeCooperationMine(String dId) throws SQLException {
		return null;
	}



	@Override
	public List<CoMedVO> proceedingCooperationMine(String dId) throws SQLException {
		return null;
	}



}
