package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;


public interface MainComRecoService {

   Map<String, Object> mainComRecoList(String dId) throws SQLException;

}
