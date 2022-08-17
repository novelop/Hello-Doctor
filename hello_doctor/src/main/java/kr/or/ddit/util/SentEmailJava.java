package kr.or.ddit.util;



import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import kr.or.ddit.command.Info;

public class SentEmailJava { // commons-mail


	public static void mailSend(String email, String url) throws EmailException {

		String inserturl = url;

		Info info = new Info();
		System.out.println("메일 보내기 시작...");
		Email emailSend = new SimpleEmail();
		emailSend.setHostName("smtp.naver.com"); // SMTP의 서버 지정
		emailSend.setSmtpPort(587); // SMTP의 포트주소 지정
		emailSend.setAuthenticator(new DefaultAuthenticator(info.id, info.pw));
		emailSend.setSSLOnConnect(true); // SSL 보안인증 활성화
		emailSend.setFrom("wjdrbq@naver.com"); // 보내는 사람 메일
		emailSend.setSubject("Hello Doctor, 비밀번호를 재설정 해주세요."); // 메일 제목
//		emailSend.setMsg("This is a test mail  :-)"); // 메일 내용
		emailSend.setContent(mailhtml(inserturl), "text/html; charset=UTF-8");
		emailSend.addTo(email); // 받는 사람 주소
		emailSend.send(); // 보내기

		System.out.println("메일 보내기 완료!!!");
	}

	public static void registmailSend(String email, String content) throws EmailException {



		Info info = new Info();
		System.out.println("메일 보내기 시작...");
		Email emailSend = new SimpleEmail();
		emailSend.setHostName("smtp.naver.com"); // SMTP의 서버 지정
		emailSend.setSmtpPort(587); // SMTP의 포트주소 지정
		emailSend.setAuthenticator(new DefaultAuthenticator(info.id, info.pw));
		emailSend.setSSLOnConnect(true); // SSL 보안인증 활성화
		emailSend.setFrom("wjdrbq@naver.com"); // 보내는 사람 메일
		emailSend.setSubject("Hello Doctor, 이메일 인증을 해주세요!"); // 메일 제목
//		emailSend.setMsg("This is a test mail  :-)"); // 메일 내용
//		emailSend.setContent("인증번호"+content, "text/html; charset=UTF-8");
		emailSend.setContent(mailauth(content), "text/html; charset=UTF-8");
		emailSend.addTo(email); // 받는 사람 주소
		emailSend.send(); // 보내기

		System.out.println("회원가입 메일 보내기 완료!!!");
	}

	public static String mailauth(String content) {
		String str = "";

		str +="<html>"
				+ "<body>\r\n" +
				"	<div style=\"background: #8080801a;  margin: 0px auto;\">\r\n" +
				"		<hr style=\"border: 3px solid #34995f;\">\r\n" +
				"\r\n" +
				"		<div class=\"col-sm-12\" style=\"margin-left: 5%; margin-top: 4%;\">\r\n" +
				"			<p style=\"display: inline-block; font-size: 21px; vertical-align: 20px; font-weight: bold;\">Hello Doctor</p>\r\n" +
				"		</div>\r\n" +
				"\r\n" +
				"\r\n" +
				"		<div class=\"col-sm-12\" style=\"display: flow-root; height: 49px;\">\r\n" +
				"			<div class=\"col-sm-6\" style=\"text-align: center;margin-bottom: 65px;float: left;margin-left: 5%;margin-top: -24px;\">\r\n" +
				"				<h1 style=\"\">\r\n" +
				"					<p style=\"display: inline; color: #49d685;\">메일인증</p>\r\n" +
				"					안내입니다.\r\n" +
				"				</h1>\r\n" +
				"			</div>\r\n" +
				"			<div class=\"col-sm-6\" style=\"text-align: center;float: right;margin-right: 47%;margin-top: -65px;\">\r\n" +
				"				<img alt=\"메일.png\" src=\"https://cdn-icons-png.flaticon.com/128/1161/1161751.png\" style=\"width: 90px;\">\r\n" +
				"			</div>\r\n" +
				"		</div>\r\n" +
				"\r\n" +
				"		<div class=\"col-sm-12\" style=\"text-align: left; margin-left: 5%;\">\r\n" +
				"			<h4 style=\"font-size: 17px;\">\r\n" +
				"				안녕하세요. Hello Doctor를 이용해 주셔서 진심으로 감사드립니다.<br> 아래의\r\n" +
				"				<p style=\"display: inline; color: #49d685;\">'인증코드'</p>\r\n" +
				"				를 입력하시면 가입이 정상적으로 완료됩니다.\r\n" +
				"			</h4>\r\n" +
				"		</div>\r\n" +
				"\r\n" +
				"		<div class=\"col-sm-12\" style=\"text-align: left; margin-left: 5%; background-color: white; width: 48%; font-size: 30px;\">\r\n" +
				"			<h3>"+content+"</h3>\r\n" +
				"		</div>\r\n" +
				"\r\n" +
				"		<div style=\"text-align: left; /* margin-bottom: 64px; */ margin-left: 5%;\">\r\n" +
				"			<h4 style=\"margin-bottom: 0px;\">만약 본인이 요청한 것이 아닌 경우, 본 메일은 무시하셔도 됩니다.</h4>\r\n" +
				"		</div>\r\n" +
				"\r\n" +
				"		<div style=\"text-align: left; color: gray; margin-left: 5%; height: 45px;\">\r\n" +
				"			<h5 style=\"margin-top: 1px;\">\r\n" +
				"				문의사항이 있으시면 언제든지,\r\n" +
				"				<p style=\"display: inline; text-decoration: underline; color: blue;\">wjdlas112@naver.com</p>\r\n" +
				"				에게 연락 바랍니다.\r\n" +
				"			</h5>\r\n" +
				"		</div>\r\n" +
				"	</div>\r\n" +
				"\r\n" +
				"\r\n" +
				"\r\n" +
				"\r\n" +
				"</body>"
				;


		return str;

	}




	public static String mailhtml(String inserturl) {
		String str = "";

		str +="<html>"
			+ "<body>\r\n"
			+ "<div style=\"background: #8080801a;\">\r\n" +
			"	<div style=\"text-align: center;\">\r\n" +
			"		<img alt=\"열쇠.png\"\r\n" +
			"			src=\"https://cdn-icons-png.flaticon.com/128/1680/1680072.png\">\r\n" +
			"	</div>\r\n" +
			"	<div style='text-align: center; margin-bottom: 65px;'>\r\n" +
			"		<h1>비밀번호 재설정 링크를 보내드립니다.</h1>\r\n" +
			"	</div>\r\n" +
			"\r\n" +
			"	<div style=\"text-align: center;\">\r\n" +
			"		<h3>회원님 본인이 요청한 경우 아래 버튼을 눌러 비밀번호를 새로 설정할 수 있습니다.</h3>\r\n" +
			"	</div>\r\n" +
			"	<div style=\"text-align: center;\">\r\n" +
			"		<a href='"+inserturl+"'>\r\n" +
			"		<input type=\"button\" value=\"비밀번호 재설정 하기\"\r\n" +
			"			style=\"border: 2px solid #2196f3; background: #2196f3; color: white; width: 150px; height: 50px; border-radius: 10px; font-weight: bold;\">\r\n" +
			"			</a>\r\n" +
			"	</div>\r\n" +
			"\r\n" +
			"\r\n" +
			"	<div style=\"text-align: center; margin-bottom: 64px;\">\r\n" +
			"		<h3>만약 본인이 요청한 것이 아닌 경우, 본 메일은 무시하셔도 됩니다.</h3>\r\n" +
			"	</div>\r\n" +
			"\r\n" +
			"	<div style=\"text-align: center; color: gray;\">\r\n" +
			"		<h4 style=\"\">\r\n" +
			"			문의사항이 있으시면 언제든지,\r\n" +
			"			<p style=\"display: inline; text-decoration: underline; color: blue;\">wjdlas112@naver.com</p>\r\n" +
			"			에게 연락 바랍니다.\r\n" +
			"		</h4>\r\n" +
			"	</div>\r\n" +
			"</div>"
			+"</body>"
			+ "</html>";


		return str;
	}

}
