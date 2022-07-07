package com.learning.DTO;

import lombok.Data;

@Data
public class userDTO {
	private int u_del, u_authority, u_banned;
	private String u_id, u_pw, u_email, u_name, u_nickname, u_gender, u_birth;
}
