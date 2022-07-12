package com.learning.User.Form;

import lombok.Data;

@Data
public class ULectureForm {

	private String l_code;
	private String t_id;
	private String t_nickname;
	private String l_name;
	private int l_price;
	private String l_curriculum;
	private String l_thumbnail;
	private String l_date;
	private String l_category;
	private int b_del;
	private String t_introduce;
	private String t_spec;
	
	private String grade_avg;
	private int total_register;
	private int payment_whether;
	private String attendance_rate;
}
