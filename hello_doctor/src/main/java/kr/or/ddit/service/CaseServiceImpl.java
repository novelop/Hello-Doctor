package kr.or.ddit.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import kr.or.ddit.command.CaseRegistCommand;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.Case_DAO;
import kr.or.ddit.dto.CaseFileVO;
import kr.or.ddit.dto.CaseVO;
import kr.or.ddit.dto.RecomVO;
import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.util.MakeSequence;

public class CaseServiceImpl implements CaseService {

	private Case_DAO casedao;
	@Resource(name = "caseFilePath")
	private String caseFilePath;

	public void setCasedao(Case_DAO casedao) {
		this.casedao = casedao;
	}

	@Override
	public List<CaseVO> selectCase() throws SQLException {
		// TODO Auto-generated method stub
		return casedao.selectCase();
	}

	@Override
	public Map<String, Object> getCaseListForPage(SearchCriteria cri) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		List<CaseVO> caselist = casedao.selectSearchCaseList(cri);
		int totalCount = casedao.selectSearchCaseListCount(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		map.put("caselist", caselist);
		map.put("pageMaker", pageMaker);

		return map;
	}

	@Override
	public void insertCase(CaseRegistCommand command) throws SQLException{
		// 시퀀스 만들기
		int disNo = casedao.selectCaseSeqNextValue();
		String no = MakeSequence.makeSequence("DIS", disNo);
		command.setDisNo(no);
		casedao.insertCase(command);
		casedao.insertSub(command);
		if(command.getFile() != null) {
			for (int i = 0; i < command.getFile().size(); i++) {
				if (command.getFile().get(i) != null && !command.getFile().get(i).isEmpty()) {
					String fileName = MakeFileName.toUUIDFileName(command.getFile().get(i).getOriginalFilename(), "&&");
					File storedFile = new File(caseFilePath, fileName);

					storedFile.mkdirs();
					int fNo = casedao.selectCaseFileSeqNextValue();
					String fno = MakeSequence.makeSequence("DISF", fNo);
					command.setDisFileNo(fno);
					command.setDisFilePath(caseFilePath);
					command.setDisFileName(fileName);
					command.setDisFileType(fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase());
					command.setDisNo(no);
					try {
						command.getFile().get(i).transferTo(storedFile);

					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				casedao.updateFile(command);
			}
		}
	}

	@Override
	public Map<String, Object> detailCase(String disNo) throws SQLException {
		CaseRegistCommand command =  casedao.selectCaseByNo(disNo);

		Map<String, Object> map = new HashMap<String, Object>();
		List<CaseFileVO> list = casedao.selectFile(disNo);
		if(list != null) {

			for(int i = 0; i < list.size(); i++) {
				String fileName = list.get(i).getDisFileName();
				String newName = MakeFileName.parseFileNameFromUUID(fileName, "\\&\\&");
				System.out.println(newName);
				list.get(i).setDisFileName(newName);
			}
		}
		map.put("list", list);
		map.put("command", command);
		System.out.println(map);
		return map;
	}

	@Override
	public void deleteCase(String disNo) throws SQLException {
		casedao.deleteCase(disNo);

	}

	@Override
	public void updateCase(CaseRegistCommand command) throws SQLException {
		casedao.updateCase(command);
		casedao.updateSubCase(command);
	}

	@Override
	public CaseVO getCaseForModify(String disNo) throws SQLException {
		return casedao.selectCaseByNo(disNo);
	}

	@Override
	public Map<String, Object> mainBottomShow(CaseVO casevo, String MaName) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CaseVO> bottomList = casedao.mainBottomShow(casevo);
		List<CaseVO> major = casedao.selectMajor(MaName);
		List<CaseVO> top = casedao.mainTop();
		for (int i = 0; i < top.size(); i++) {
			top.get(i).setDisCnt(top.get(i).getDisCnt());
			top.get(i).setRecom(top.get(i).getRecom() * 2);
			top.get(i).setReply(top.get(i).getReply() * 2);

			top.get(i).setTotal(top.get(i).getDisCnt() + (top.get(i).getRecom() * 2) + (top.get(i).getReply() * 2));
			System.out.println(top.get(i).getTotal());
		}
		Collections.sort(top, new sort());
		System.out.println(top);
		map.put("top", top);
		map.put("major", major);
		map.put("bottomList", bottomList);
		return map;
	}

	class sort implements Comparator<CaseVO> {
		@Override
		public int compare(CaseVO o1, CaseVO o2) {
			Integer i = new Integer(o1.getTotal());
			return -i.compareTo(o2.getTotal());

		}

	}

	@Override
	public RecomVO recomSelect(RecomVO recomvo) throws SQLException {
		RecomVO recom = null;
		recom = casedao.recomSelect(recomvo);
		return recom;
	}

	@Override
	public void recomInsert(RecomVO recomvo) throws SQLException {
		casedao.recomInsert(recomvo);

	}

	@Override
	public void recomDelete(RecomVO recomvo) throws SQLException {
		casedao.recomDelete(recomvo);

	}

	@Override
	public String getFile(CaseFileVO filevo) throws SQLException {
		String file = casedao.getFile(filevo);
		return file;
	}

	@Override
	public List<CaseFileVO> selectFile(String disNo) throws SQLException {
		List<CaseFileVO> list = casedao.selectFile(disNo);
//		if(list != null) {
//			for(int i = 0; i < list.size(); i++) {
//				String file = list.get(i).getDisFileName();
//				String renew = MakeFileName.parseFileNameFromUUID(file, "\\&\\&");
//				System.out.println(renew);
//				list.get(i).setDisFileName(renew);
//			}
//		}

		return list;
	}

	@Override
	public void deleteFile(String disFileName) throws SQLException {
		casedao.deleteFile(disFileName);

	}

	@Override
	public void updateFile(CaseVO caseVO) throws SQLException {
		casedao.updateFile(caseVO);

	}

	@Override
	public void modifyFile(CaseRegistCommand command) throws SQLException {
		if(command.getFile() != null) {
			for (int i = 0; i < command.getFile().size(); i++) {
				if (command.getFile().get(i) != null && !command.getFile().get(i).isEmpty()) {
					String fileName = MakeFileName.toUUIDFileName(command.getFile().get(i).getOriginalFilename(), "&&");
					File storedFile = new File(caseFilePath, fileName);

					storedFile.mkdirs();
					int fNo = casedao.selectCaseFileSeqNextValue();
					String fno = MakeSequence.makeSequence("DISF", fNo);
					command.setDisFileNo(fno);
					command.setDisFilePath(caseFilePath);
					command.setDisFileName(fileName);
					command.setDisFileType(fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase());
					command.setDisNo(command.getDisNo());
					try {
						command.getFile().get(i).transferTo(storedFile);

					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				casedao.modifyFile(command);
			}
		}



	}

	@Override
	public void increaseViewCnt(String disNo) throws SQLException {
		casedao.increaseViewCnt(disNo);

	}

//	@Override
//	public void updateFile(CaseVO caseVO) throws SQLException {
//		casedao.updateFile(caseVO);
//
//	}

	//////////////// 파일///////////////////////////
	//////////////// 파일///////////////////////////
	//////////////// 파일///////////////////////////

}
