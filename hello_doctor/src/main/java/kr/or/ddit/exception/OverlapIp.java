package kr.or.ddit.exception;

public class OverlapIp extends Exception{

	public OverlapIp() {
		super("중복되는 IP가 있습니다."	);
	}
}
