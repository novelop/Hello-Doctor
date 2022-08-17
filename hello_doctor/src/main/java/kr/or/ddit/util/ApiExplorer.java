package kr.or.ddit.util;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
	
    public static void main(String[] args) throws IOException {
    	Map<String, Object> map = null;
    	try {
    		map =  getAPIList("201307771");
		} catch (Exception e) {
			System.out.println("없음");
		}
    	
    	 System.out.println(map);
    }
    
    
    public static  Map<String, Object> getAPIList(String meNo) throws IOException {

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService02/getDrugPrdtPrmsnDtlInq01"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=11LiiJtZaLcAzEiITobhOrwAnEyD5DtIx42DklIMYnXw2jtn11ib8i2qiuCJ7A5nsXd7HhOBMg7zayIx1XvMSg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) default : xml*/
        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목명*/
        urlBuilder.append("&" + URLEncoder.encode("entp_name","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
        urlBuilder.append("&" + URLEncoder.encode("item_permit_date","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*허가일자*/
        urlBuilder.append("&" + URLEncoder.encode("entp_no","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체허가번호*/
        urlBuilder.append("&" + URLEncoder.encode("bar_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*표준코드*/
        urlBuilder.append("&" + URLEncoder.encode("item_seq","UTF-8") + "=" + URLEncoder.encode(meNo, "UTF-8")); /*품목기준코드*/
        urlBuilder.append("&" + URLEncoder.encode("start_change_date","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*변경일자시작일*/
        urlBuilder.append("&" + URLEncoder.encode("end_change_date","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*변경일자종료일*/
        urlBuilder.append("&" + URLEncoder.encode("order","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*order=Y로 요청메시지를 주게 되면, 허가일자 역순으로 데이터가 조회된다.*/
        urlBuilder.append("&" + URLEncoder.encode("edi_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보험코드*/
        urlBuilder.append("&" + URLEncoder.encode("atc_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ATC코드*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        String jsonText = sb.toString();
        JSONObject json = new JSONObject(jsonText);
        JSONObject body = json.getJSONObject("body");
        JSONArray items = body.getJSONArray("items");
       
        //String modiDate =  items.getJSONObject(0).getString("CHANGE_DATE");
        JSONObject jobj =  items.getJSONObject(0);
     
        
        Map<String, Object>  map = new HashedMap<String, Object>();
        map.put("meModidate", jobj.getString("CHANGE_DATE") );
        map.put("meName", jobj.getString("ITEM_NAME") );
        map.put("meCompany", jobj.getString("ENTP_NAME") );
        map.put("meNo", jobj.getString("ITEM_SEQ") );

        
        
        return map;
        
      }

    
}