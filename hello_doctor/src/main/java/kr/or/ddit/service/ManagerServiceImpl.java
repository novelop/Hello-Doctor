package kr.or.ddit.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.ManagerDAO;
import kr.or.ddit.dto.ManagerDoctorListVO;
import kr.or.ddit.exception.OverlapIp;

public class ManagerServiceImpl implements ManagerService {

	private ManagerDAO managerdao;
	public void setManagerdao(ManagerDAO managerdao) {
		this.managerdao = managerdao;
	}

	@Override
	public Map<String, Object> doctorListForPage(String dId) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();

		List<ManagerDoctorListVO> result = new ArrayList<ManagerDoctorListVO>();
		List<ManagerDoctorListVO> list = managerdao.insertDid();
		for(int i = 0; i < list.size(); i++) {
			dId = list.get(i).getdId();

			result.add(managerdao.doctorListForPage(dId));
		}

		map.put("list", result);

		return map;
	}

	@Override
	public void susDoctor(ManagerDoctorListVO doctorvo) throws SQLException {
		managerdao.susDoctor(doctorvo);

	}

	@Override
	public ManagerDoctorListVO doctorStatus(String dId) throws SQLException {
		ManagerDoctorListVO doctorvo = managerdao.doctorStatus(dId);
		return doctorvo;
	}

	@Override
	public void workDoctor(String dId) throws SQLException {
		managerdao.workDoctor(dId);

	}

	@Override
	public void retireDoctor(ManagerDoctorListVO doctorvo) throws SQLException {
		managerdao.retireDoctor(doctorvo);

	}

	@Override
	public Map<String, Object> ipListForPage(ManagerDoctorListVO ipvo) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();

		List<ManagerDoctorListVO> result = new ArrayList<ManagerDoctorListVO>();
		List<ManagerDoctorListVO> ipNo = managerdao.insertIpNO();
		for(int i = 0; i < ipNo.size(); i++) {
			ipvo.setIpNo(ipNo.get(i).getIpNo());
			ManagerDoctorListVO list = managerdao.ipListForPage(ipvo);
			result.add(list);
		}

		map.put("list", result);

		return map;
	}

	@Override
	public void ipInsert(ManagerDoctorListVO doctorvo) throws SQLException, OverlapIp {

					managerdao.ipInsert(doctorvo);




	}

	@Override
	public List<ManagerDoctorListVO> memberIp(String dId) throws SQLException {
		List<ManagerDoctorListVO> iplist = managerdao.memberIp(dId);
		return iplist;
	}

	@Override
	public void deleteIp(String dId) throws SQLException {
		managerdao.deleteIp(dId);

	}

	@Override
	public Map<String, Object> mainMemberList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ManagerDoctorListVO> list = managerdao.mainMemberList();



		List<ManagerDoctorListVO> result = new ArrayList<ManagerDoctorListVO>();
		List<String> sList = managerdao.dorInsertId();
		for(int i = 0 ; i < sList.size(); i++) {
			ManagerDoctorListVO listVO = managerdao.dormantAccount(sList.get(i));
			result.add(listVO);
		}

		dataMap.put("dormant", result);
		dataMap.put("updateMed", managerdao.selectUpdateMedicine());
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		System.out.println(managerdao.selectUpdateMedicine());
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		System.out.println("++++++++++++++++++++++++++++++++++++++");
		dataMap.put("memberCount", managerdao.memberCountForChart());
		dataMap.put("retireCount", managerdao.retireCountForChart());
		dataMap.put("recent", managerdao.recentNotice());
		dataMap.put("fix", managerdao.fixNotice());
		dataMap.put("member", list);
		dataMap.put("pop", managerdao.popUpNotice());
		return dataMap;
	}

	@Override
	public ManagerDoctorListVO ipDetail(String ipNo) throws SQLException {
		ManagerDoctorListVO ip = managerdao.ipDetail(ipNo);
		return ip;
	}

	@Override
	public List<ManagerDoctorListVO> overIp(String dId) throws SQLException {
		List<ManagerDoctorListVO>list = managerdao.overIp(dId);
		return list;
	}

	@Override
	public void ipManagerDeleteIp(ManagerDoctorListVO doctorVO) throws SQLException {
		managerdao.ipManagerDeleteIp(doctorVO);

	}





}
