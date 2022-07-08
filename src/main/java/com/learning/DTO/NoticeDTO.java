package com.learning.DTO;

import lombok.Data;

@Data
public class NoticeDTO {
	private int n_no , n_category, n_view;
	private String n_title, n_content,n_date;
}
