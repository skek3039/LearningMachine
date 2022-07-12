package com.learning.User.DTO;

import lombok.Data;

@Data
public class ULectureQnaDTO {
	
	private int lqa_no;
	private String l_code;
	private String u_id;
	private String lqa_title;
	private String lqa_content;
	private String lqa_date;
	private int lqa_confirm;
	
	private int reply_whether;
}
