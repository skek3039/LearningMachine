package com.learning.DTO;

import lombok.Data;

@Data
public class BoardDTO {
	private String u_nickname, b_title, b_content, b_date;
	private int b_no, b_view, b_like, b_del;
	
	private String br_content, br_date, u_id; 
	private int br_del;
}
