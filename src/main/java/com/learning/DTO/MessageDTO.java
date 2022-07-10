	package com.learning.DTO;

import lombok.Data;

@Data
public class MessageDTO {

	private int le_no;
	private String from_id;
	private String from_nickname;
	private String to_id;
	private String le_content;
	private String le_date;
	private int le_confirm;
}
