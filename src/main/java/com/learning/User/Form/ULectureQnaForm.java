package com.learning.User.Form;

import lombok.Data;

@Data
public class ULectureQnaForm {
	
	private int lqa_no;
	private String l_code;
	private String u_id;
	private String u_nickname;
	private String lqa_title;
	private String lqa_content;
	private String lqa_date;
	private int lqa_confirm;
	
	private String t_id;
	private String t_name;
	private String t_nickname;
	private String lqar_title;
	private String lqar_content;
	private String lqar_date;
	
	private int my_qna;
}
