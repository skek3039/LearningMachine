package com.learning.User.Form;

import lombok.Data;

@Data
public class LectureForm {

	private String l_code;
	private String t_id;
	private String l_name;
	private int l_price;
	private String l_curriculum;
	private String l_thumbnail;
	private String l_date;
	
	private int payment_whether;
}
