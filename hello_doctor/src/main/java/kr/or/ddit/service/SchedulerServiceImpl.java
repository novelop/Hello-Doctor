package kr.or.ddit.service;

import java.awt.Color;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.CoTaskDAO;
import kr.or.ddit.dao.MediRecoDAO;
import kr.or.ddit.dao.SchedulerDAO;
import kr.or.ddit.dto.ChartFormVO;
import kr.or.ddit.dto.CoMedVO;
import kr.or.ddit.dto.CoTaskVO;
import kr.or.ddit.dto.MyOrderListVO;
import kr.or.ddit.dto.SchedulerVO;
import kr.or.ddit.dto.SchedulerVO2;
import kr.or.ddit.service.MediRecoServiceImpl.SortByDate;

public class SchedulerServiceImpl implements SchedulerService{

	private SchedulerDAO schedulerDao;
	private MediRecoDAO mediRecoDAO;
	private CoTaskDAO coTaskDAO;


	public void setMediRecoDAO(MediRecoDAO mediRecoDAO) {
		this.mediRecoDAO = mediRecoDAO;
	}

	public void setCoTaskDAO(CoTaskDAO coTaskDAO) {
		this.coTaskDAO = coTaskDAO;
	}
	public void setSchedulerDao(SchedulerDAO schedulerDao) {
		this.schedulerDao = schedulerDao;
	}



	@Override
	public Map<String,Object> TodayMyList(String dId) throws SQLException {
		List<ChartFormVO> result = new ArrayList<ChartFormVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<ChartFormVO> medilist = mediRecoDAO.selectAllReco(dId);
		List<ChartFormVO> colist = coTaskDAO.selectAllReco(dId);
		List<CoMedVO> selectbox = schedulerDao.selectbox(dId);
		for (int i = 0; i < medilist.size(); i++) {

			result.add(medilist.get(i));
		}
		for (int i = 0; i < colist.size(); i++) {
			result.add(colist.get(i));
		}

		Collections.sort(result, new SortByDate());
		//성별 구하기
		for (int i = 0; i < result.size(); i++) {

		}
		System.out.println(result);
		map.put("result", result);
		map.put("selectbox",selectbox);
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
	public List<SchedulerVO> Cooperation(String dId) throws SQLException {
		String[] colorList= {"#fab37d","#81e87f", "#12513d", "#2bb1ca","#99626c", "#7983d0","#209dd8","#1d5bca","#d47f2f","#468590"};
		CoTaskVO coTaskVO = new CoTaskVO();
		List<SchedulerVO> schedulerList = new ArrayList<SchedulerVO>();



		List<String> allcoNo = schedulerDao.selectAllcoNo(dId);
		coTaskVO.setdId(dId);
		for(int i = 0; i< allcoNo.size(); i++ ) {

			String color =  colorList[i%10];


			coTaskVO.setCoNo(allcoNo.get(i));
			List<SchedulerVO> temp = schedulerDao.selectAllTask(coTaskVO);
			for( SchedulerVO vo :  temp) {
					vo.setColor(color);
					schedulerList.add(vo);
			}


		}
		return schedulerList;
	}

	@Override
	public List<SchedulerVO2> selectCoScheduler(String coNo) throws SQLException {
		String[] colorList= {"#542e12","#605378", "#12513d", "#2bb1ca","#99626c", "#7983d0","#0b1219","#1d5bca","#d47f2f","#468590"};
		List<SchedulerVO2> schedulerList = new ArrayList<SchedulerVO2>();

		List<String> coDoctorList = schedulerDao.selectCoDoctor(coNo);

		for(int i = 0; i< coDoctorList.size(); i++) {


			String color =  colorList[i%10];

			SchedulerVO tempvo = new SchedulerVO();

			tempvo.setdId(coDoctorList.get(i));
			tempvo.setCoNo(coNo);
			List<SchedulerVO2> temp = schedulerDao.selectCoScheduler(tempvo);

			for( SchedulerVO2 vo :  temp) {
					vo.setColor(color);
					schedulerList.add(vo);
			}

		}
		return schedulerList;
	}

	@Override
	public List<SchedulerVO2> selectMyCoScheduler(SchedulerVO vo) throws SQLException {
		List<SchedulerVO2> result = schedulerDao.selectCoScheduler(vo);
		return result;
	}

	@Override
	public List<CoMedVO> searchselectbox(CoMedVO vo) throws SQLException {
		List<CoMedVO> result = schedulerDao.searchselectbox(vo);

		return result;
	}

}
