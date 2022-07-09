package com.learning.utill;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Util {
	//1. str2int
	public int str2int(String str) {
		return Integer.parseInt(str);
	}
	
	//2. html tag
	public String html(String str) {
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\n", "<br>");
		return str;
		
	}
	//3. ip얻어오기
	
	//4. 날짜형식 바꾸기(시 분 초 자르기)
	public static String YMDHM(String str) throws ParseException {
		
		SimpleDateFormat format_origin = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date origin = format_origin.parse(str);
		
		format_origin = new SimpleDateFormat("yyyy-MM-dd");
		str = format_origin.format(origin);		
		
		return str;
	}
}