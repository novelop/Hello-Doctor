package kr.or.ddit.util;

public class MakeSequence {


	public static String makeSequence(String id, int number) {
		String result = id;
		if(number < 10) {
			result +="000"+number;
		}else if(number<100) {
			result +="00"+number;
		}else if(number<1000) {
			result +="0"+number;
		}else if(number<10000) {
			result += number;
		}
		return result;
	}
}
