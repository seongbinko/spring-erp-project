package kr.co.jhta.erp.utils;

import java.text.DecimalFormat;


public class NumberUtils {	
	
	private static DecimalFormat numberWithComma = new DecimalFormat("#,###");
	
	public static String numberWithComma(Integer number) {
		if(number == null) {
			return null;
		}
		return numberWithComma.format(number);
	}
	
	/**
	 * 페이지네이션 관련 메소드 천장값 반환
	 * @param num1
	 * @param num2
	 * @return
	 */
	public static int ceil(double num1, double num2) {
		return (int) Math.ceil(num1/num2);
	}
	
}
