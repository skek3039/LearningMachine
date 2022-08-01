	package com.learning.DTO;

import lombok.Data;

@Data
public class MessageDTO {

	private int le_no;
	private String from_id;
	private String from_nickname;
	private String u_nickname;
	private String to_id;
	private String le_content;
	private String le_date;
	private int le_del;
	private int le_confirm;
	private int del;
	private int send;
}
