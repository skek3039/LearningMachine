package com.learning.User.Form;

import lombok.Data;

@Data
public class ULectureViedoQnaForm {

	private int vq_no;
	private int v_no;
	private String u_id;
	private String u_nickname;
	private String l_code;
	private String l_name;
	private String vq_title;
	private String vq_content;
	private String vq_date;
	
	private String t_id;
	private String t_nickname;
	private String vqr_title;
	private String vqr_content;
	private String vqr_date;
	private int vq_confirm;
	private int vq_del;
}
