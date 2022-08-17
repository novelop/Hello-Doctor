package kr.or.ddit.service;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.command.DoctorRegistCommand;
import kr.or.ddit.command.OtherDoctorCommand;
import kr.or.ddit.dao.DoctorDAO;
import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoworkerVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.MajorVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;
import kr.or.ddit.util.MakeFileName;

public class DoctorServiceImpl implements DoctorService {

	private DoctorDAO doctorDAO;

	public void setDoctorDAO(DoctorDAO doctorDAO) {
		this.doctorDAO = doctorDAO;
	}

	@Override
	public DoctorVO doctorLogin(DoctorVO vo) throws SQLException,NotFoundIdException,InvalidPasswordException {

	DoctorVO result = 	doctorDAO.doctorLogin(vo);

		if(result == null) {
			//id틀림;
			throw new NotFoundIdException();
		}else if(!result.getPwd().equals(vo.getPwd())) {
			//pwd 틀림;
			throw new InvalidPasswordException();
		}
		return result;
	}

	@Override
	public DoctorVO profileChange(DoctorVO vo) throws SQLException {

		DoctorVO result = doctorDAO.profileChange(vo);

		System.out.println("result!!~@~!@~!@~@~"+result);

		return result;
	}

	@Override
	public DoctorVO selectDoctorVO(String dId) throws SQLException {

		return doctorDAO.selectDoctorVO(dId);
	}

	@Override
	public List<MajorVO> majorList() throws SQLException {
		List<MajorVO> result = doctorDAO.majorList();
		return result;
	}

	@Override
	public List<MajorVO> majorDoctors(MajorVO vo) throws SQLException {
		List<MajorVO> result = doctorDAO.majorDoctors(vo);
		return result;
	}

	@Override
	public Map<String, Object> detailDoctor(OtherDoctorCommand command) throws SQLException {
		    Map<String,Object> map = new HashMap<String,Object>();

			List<CoDoctorVO> list = doctorDAO.coDoctor(command);
			for(int i = 0; i<list.size(); i++) {
				if(list.get(i).getEndNo() == null) {
					list.get(i).setResultDate("진행중");
				}else {
					list.get(i).setResultDate("종료");
				}


			}
			MajorVO vo = doctorDAO.detailDoctor(command.getDoId());
			int result = vo.getStatus();

			if(result == 1) {
				vo.setStatusResult("진료중");
			}else if (result == 2) {
				vo.setStatusResult("수술중");
			}else if (result == 3) {
				vo.setStatusResult("자리비움");
			}else if (result == 4) {
				vo.setStatusResult("부재중");
			}
			map.put("coDoctor", list);
			map.put("detailDoctor", vo);
		return map;
	}

	@Override
	public MajorVO simpleProfile(String dId) throws SQLException {
		MajorVO result = doctorDAO.detailDoctor(dId);
		return result;
	}

	@Override
	public List<MajorVO> simpleProfile2(List<String> dIdList) throws SQLException {
		List<MajorVO> list = new ArrayList<MajorVO>();

		for(String dId : dIdList) {
			MajorVO vo = doctorDAO.detailDoctor(dId);
			list.add(vo);
		}
		return list;
	}


	@Override
	public DoctorVO getDoctor(DoctorVO vo) throws SQLException {
		DoctorVO result = doctorDAO.getDoctor(vo);

		return result;
	}

	@Override
	public void doctorStatusReset(String dId) throws SQLException {

		 doctorDAO.doctorStatusReset(dId);

	}

	@Override
	public void doctorStatusStart(String dId) throws SQLException {

		doctorDAO.doctorStatusStart(dId);

	}

	@Override
	public Map<String, Object> coworkerList(String dId) throws SQLException {
		Map<String,Object> map = new HashMap<String, Object>();

		List<MajorVO> major = doctorDAO.majorList();
		List<CoworkerVO> coworker = doctorDAO.coworkerList(dId);
		map.put("major", major);
		map.put("coworker", coworker);
		return map;
	}

	@Override
	public MajorVO addCoworker(CoworkerVO vo) throws SQLException {
		MajorVO result = doctorDAO.detailDoctor(vo.getCodId());
						doctorDAO.addCoworker(vo);

		return result;
	}

	@Override
	public void deleteCoworker(CoworkerVO vo) throws SQLException {

		doctorDAO.deleteCoworker(vo);
	}

	@Override
	public List<Map<String, String>> allDoctor(String dId) throws SQLException {
		List<Map<String, String>> result = doctorDAO.allDoctor(dId);

		return result;
	}

	@Override
	public void docinfomodify(DoctorRegistCommand doctorReq,String doctorFilePath) throws SQLException, IllegalStateException, IOException {

		String fileName = null;

			DoctorVO doctor = doctorReq.toDoctorVO();

			doctorDAO.docinfomodify(doctor);
			// 프로필 등록
			if (doctorReq.getFile() != null && !doctorReq.getFile().isEmpty()) {
				fileName = MakeFileName.toUUIDFileName(doctorReq.getFile().getOriginalFilename(),
						"&&");

				doctor.setdPic(fileName);
				System.out.println("setdpic~~~!!"+fileName);
				File storedFile = new File(doctorFilePath, fileName);

				storedFile.mkdirs();

				doctorReq.getFile().transferTo(storedFile);

				doctorDAO.docinfoprofilemodify(doctor);
			}



	}

	@Override
	public String checkpwd(String dId,String pwd) throws SQLException {

		String result = doctorDAO.checkpwd(dId);

		if(result.equals(pwd)) {
			result ="pwdsuccess";

		}else {
			result ="pwdfail";
		}
		System.out.println("ServiceCheckPwdResult"+result);

		return result;
	}

	@Override
	public String docpwdmodify( DoctorVO vo , String newpwdcheck) throws SQLException {

		String result =null;

		System.out.println("새비밀번호값"+vo.getNewpwd());
		System.out.println("기존 비밀번호값"+vo.getPwd());

		if(vo.getPwd().equals(vo.getNewpwd())) {

			result = "pwdsame";

		}else if(!vo.getNewpwd().equals(newpwdcheck)) {
			result = "newpwdfail";
		}else {
			result = "newpwdsuccess";
			doctorDAO.docpwdmodify(vo);
		}

		System.out.println("ServicedocpwdmodifyResult"+result);


		return result;
	}

	@Override
	public String docloginmodify(DoctorVO vo) throws SQLException {

		String result = "";

		if(vo.getOtpCheck().equals("1")) {
			result = "otpdisabled";
		}else {
			result = "otpactivate";
		}

		doctorDAO.docloginmodify(vo);



		return result;
	}

	@Override
	public String doctelmodify(DoctorVO vo) throws SQLException {

		String result = "telmodify";

		String str = vo.getTel();
		str = str.substring(0,3)+"-"+str.substring(3,7)+"-"+str.substring(7, str.length());

		vo.setTel(str);

		doctorDAO.doctelmodify(vo);



		return result;
	}

	@Override
	public String docIp(String dId) throws SQLException, UnknownHostException {
		String result = null;

		InetAddress ip = InetAddress.getLocalHost();

		List<String> docip = doctorDAO.docIp(dId);
		String mycomip=ip.getHostAddress();

		System.out.println("doctip"+docip);
		System.out.println("myip"+mycomip);


		for(String myip: docip) {

			if (mycomip.equals(myip)) {
				result = "ipsuccess";
				break;
			} else {
				result = "ipfail";
			}
		}

		System.out.println("service docip result"+result);

		return result;
	}




}
