package com.learning.DTO;

import lombok.Data;

@Data
public class LectureDTO {

private int t_confirm;
private String t_id, t_introduce, t_spec, t_etc, u_id, u_name, u_gender;  

private int l_price; 
private String l_name, l_curriculum, l_thumbnail, l_date, l_code, l_category, l_info, l_recognize;

private int v_no; 
private String v_root, v_videotitle, v_introduce;

private int lr_grade, la_no;
private String lr_title, lr_content;

private int lqa_no; 
private String lqa_title, lqa_content, lqa_date;

private String lqar_title, lqar_content, lqar_date;

private int vq_no;
private String vq_title, vq_content, vq_date;

private String vqr_title, vqr_content, vqr_date;
}
