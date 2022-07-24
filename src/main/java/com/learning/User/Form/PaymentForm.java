package com.learning.User.Form;

import lombok.Data;

@Data
public class PaymentForm {
	
	private int p_no;
	private String u_id;
	private String l_code;
	private String p_date;
	private String p_price;
	private int p_refund;
	private int pm_no;
	private String p_order;
}
