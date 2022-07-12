package com.learning.User.Form;

import lombok.Data;

@Data
public class ULectureQnaForm {
	
	private int lqa_no;
	private String l_code;
	private String u_id;
	private String lqa_title;
	private String lqa_content;
	private String lqa_date;
	private int lqa_confirm;
	
	private String t_id;
	private String t_name;
	private String lqr_title;
	private String lqr_content;
	private String lqr_date;
	
	private int reply_whether;
	private int my_qna;
}
