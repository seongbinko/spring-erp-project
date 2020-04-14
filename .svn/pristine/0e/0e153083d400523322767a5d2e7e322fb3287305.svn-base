package kr.co.jhta.erp.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static SimpleDateFormat normalDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat yearDateFormat = new SimpleDateFormat("yyyy");
	private static SimpleDateFormat monthDateFormat = new SimpleDateFormat("yyyy-mm");
	private static SimpleDateFormat detailDateFormat = new SimpleDateFormat("yyyy-MM-dd HH시 mm분 ss초");
	
	public static String dateToString(Date date) {
		if(date == null) {
			return "";
		}
		return normalDateFormat.format(date);
	}
	
	public static String dateToStringWithTime(Date date) {
		if(date == null) {
			return "";
		}
		return detailDateFormat.format(date);
	}
	
	public static Date stringToDate(String dateString) throws Exception{
		if(dateString == null) {
			return null;
		}
		Date date = normalDateFormat.parse(dateString);
		return date;
	}
	public static Date stringToDate2(String dateString) throws Exception {
		if(dateString == null) {
			return null;
		}
		Date date = monthDateFormat.parse(dateString);
		return date;
	}
	
	public static String dateToYear(Date date) {
		if(date == null) {
			return "";
		}
		return yearDateFormat.format(date);
	}
}
