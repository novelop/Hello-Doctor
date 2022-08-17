package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.MainComRecoDAO;
import kr.or.ddit.dto.MainVO;

public class MainComRecoServiceImpl implements MainComRecoService {

	private MainComRecoDAO comrecodao;

	public void setComrecodao(MainComRecoDAO comrecodao) {
		this.comrecodao = comrecodao;
	}


	@Override
	public Map<String, Object> mainComRecoList(String dId) throws SQLException {

		Map<String, Object> map =new HashMap<String, Object>();

		List<MainVO> comRecoList = comrecodao.mainComRecoList(dId);

		map.put("comRecoList", comRecoList);

		return map;
	}

}
