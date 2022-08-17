package kr.or.ddit.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConvertUtils {
	public static String makeDateToString(Date date) {
		return new SimpleDateFormat(Define.DATE_FORMAT).format(date);
	}

	public static Date makeStringToDate(String source) throws ParseException {
		return new SimpleDateFormat(Define.DATE_FORMAT).parse(source);
	}
}
