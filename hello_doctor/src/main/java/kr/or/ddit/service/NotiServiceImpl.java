package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.CoTaskDAO;
import kr.or.ddit.dao.DoctorDAO;
import kr.or.ddit.dao.MediRecoDAO;
import kr.or.ddit.dao.NotiDAO;
import kr.or.ddit.dao.NoticeDAO;
import kr.or.ddit.dao.OrdersetDAO;
import kr.or.ddit.dao.SchedulerDAO;
import kr.or.ddit.dto.CoDoctorVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.dto.NotiVO;
import kr.or.ddit.util.TimeMaximum;

public class NotiServiceImpl implements NotiService {
	private DoctorDAO doctorDAO;
	private NotiDAO notiDAO;


	public void setNotiDAO(NotiDAO notiDAO) {
		this.notiDAO = notiDAO;
	}


	public void setDoctorDAO(DoctorDAO doctorDAO) {
		this.doctorDAO = doctorDAO;
	}



	@Override
	public List<DoctorVO> selectAllDoc() throws SQLException {
		List<DoctorVO> result =  doctorDAO.selectAllDoctor();
		return result;
	}


	@Override
	public Map<String,Object> notiList(String dId) throws SQLException {
		Map<String,Object> map = new HashMap<String, Object>();

		List<NotiVO> result = notiDAO.notiList(dId);

		for(NotiVO vo : result ) {
		vo.setAgo(TimeMaximum.formatTimeString(vo.getNotiDate()));
		}
		int count = notiDAO.countnoti(dId);
		map.put("noti" , result);
		map.put("count", count);



		return map;
	}


	@Override
	public List<NotiVO> notiAllList(String dId) throws SQLException {
		List<NotiVO> result = notiDAO.notiAllList(dId);
		return result;
	}

}
