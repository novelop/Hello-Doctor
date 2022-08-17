package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.RegistDAO;
import kr.or.ddit.dto.DoctorVO;
import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.util.MakeSequence;

public class RegistServiceImpl implements RegistService {

	private RegistDAO registDao;

	public void setRegistDao(RegistDAO registDao) {
		this.registDao = registDao;
	}

	@Override
	public List<String> registMajorList(String word) throws SQLException {

		List<String> list = registDao.registMajorList(word);

		return list;
	}

	@Override
	public void insertDoctor(DoctorVO vo) throws SQLException {

		String mano ="";

		String str = vo.getTel();
		str = str.substring(0,3)+"-"+str.substring(3,7)+"-"+str.substring(7, str.length());

		// 전공이름을 가지고 전공 번호로 비교후 DoctorVO에 저장
		mano = registDao.maNameCheck(vo.getMaName());


		vo.setTel(str);
		vo.setMaNo(mano);
		System.out.println("값전달 확인" + vo);
		registDao.insertDoctor(vo);


	}



}
