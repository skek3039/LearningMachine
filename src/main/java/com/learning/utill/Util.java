package com.learning.utill;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Component
public class Util {
	// 1. str2int
	public int str2int(String str) {
		return Integer.parseInt(str);
	}

	// 2. html tag
	public static String html(String str) {
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\n", "<br>");
		return str;

	}
	// 3. ip얻어오기

	// 4. 날짜형식 바꾸기(시 분 초 자르기)
	public static String YMD(String str) throws ParseException {

		SimpleDateFormat format_origin = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date origin = format_origin.parse(str);

		format_origin = new SimpleDateFormat("yyyy-MM-dd");
		str = format_origin.format(origin);

		return str;
	}

	// 5.초 짜르기
	public static String YMDHM(String str) throws ParseException {

		SimpleDateFormat format_origin = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date origin = format_origin.parse(str);

		format_origin = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		str = format_origin.format(origin);

		return str;
	}
	
	public static String PriceCut(String l_price) {
		
		DecimalFormat format = new DecimalFormat("###,###");
		int price = Integer.parseInt(l_price);
		return format.format(price);
	}
}