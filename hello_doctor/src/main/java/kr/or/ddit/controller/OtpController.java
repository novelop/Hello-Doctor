package kr.or.ddit.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.collections4.map.HashedMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("otp")
public class OtpController  {

		@ResponseBody
		@RequestMapping(value = "/" , method = RequestMethod.POST)
	    public ResponseEntity<Map<String, String>> service(HttpServletRequest req, Model model)
	            throws ServletException, IOException {
			System.out.println("regist 에서 보낸 url");

			ResponseEntity<Map<String, String>> entity = null;
			Map<String,String> dataMap = new HashedMap<String,String>();
	        // Allocating the buffer
//	      byte[] buffer = new byte[secretSize + numOfScratchCodes * scratchCodeSize];
	        byte[] buffer = new byte[5 + 5 * 5];

	        // Filling the buffer with random numbers.
	        // Notice: you want to reuse the same random generator
	        // while generating larger random number sequences.
	        new Random().nextBytes(buffer);

	        // Getting the key and converting it to Base32
	        Base32 codec = new Base32();
//	      byte[] secretKey = Arrays.copyOf(buffer, secretSize);
	        byte[] secretKey = Arrays.copyOf(buffer, 5);
	        byte[] bEncodedKey = codec.encode(secretKey);

	        // 생성된 Key!
	        String encodedKey = new String(bEncodedKey);

	        System.out.println("encodedKey : " + encodedKey);

//	      String url = getQRBarcodeURL(userName, hostName, secretKeyStr);
	        // userName과 hostName은 변수로 받아서 넣어야 하지만, 여기선 테스트를 위해 하드코딩 해줬다.
	        String url = getQRBarcodeURL("Doctor","HelloDoctor.com", encodedKey); // 생성된 바코드 주소!
	        System.out.println("URL : " + url);

	        String view = req.getContextPath()+"/regist/";

	        dataMap.put("url", url);
	        dataMap.put("encodedKey", encodedKey);

	        System.out.println("url~@~@~~!@~@"+url);
	    	entity= new ResponseEntity<Map<String, String>>(dataMap,HttpStatus.OK );

	        return entity ;

//	        req.setAttribute("encodedKey", encodedKey);
//	        req.setAttribute("url", url);

//	        req.getRequestDispatcher(view).forward(req, res);

	    }

	    public static String getQRBarcodeURL(String user, String host, String secret) {
	        String format = "http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&chld=H|0";
	       // String format = "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/hj@company.com%3Fsecret%%3DTKSIR4VHQPMGA7XV&amp;chld=H|0";
	        return String.format(format, user, host, secret);
	    }


}
