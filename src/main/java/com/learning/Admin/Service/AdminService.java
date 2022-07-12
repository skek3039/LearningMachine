package com.learning.Admin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.AdminDAO;
import com.learning.DTO.BannedDTO;
import com.learning.DTO.PageDTO;
import com.learning.DTO.userDTO;
import com.learning.User.DTO.ULectureDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	
	public int totalCount(int check_total) {
		return adminDAO.totalCount(check_total);
	}
	
	public List<userDTO> userList(PageDTO page) {
		return adminDAO.userList(page);
	}

	public List<userDTO> userSearch(String u_name) {
		return adminDAO.userSearch(u_name);
	}

	public List<String> studentLecture(String u_id) {
		return adminDAO.studentLecture(u_id);
	}

	public List<String> studentReport(String u_id, PageDTO page) {
		return adminDAO.studentReport(u_id,page);
	}

	public int report(BannedDTO dto) {
		return adminDAO.report(dto);
	}

	public void user_report(String u_id) {
		adminDAO.user_report(u_id);
	}

	public void back(String u_id) {
		adminDAO.back(u_id);
	}

	public List<String> teacherList() {
		return adminDAO.teacherList();
	}

	public List<String> studentBanList() {
		return adminDAO.studentBanList();
	}

	public List<userDTO> teacherSearch(String t_nickname) {
		return adminDAO.teacherSearch(t_nickname);
	}

	public List<String> refundList() {
		return adminDAO.refundList();
	}
	public List<String> admin_lectureRequest(String la_no) {
		return adminDAO.admin_lectureRequest(la_no);
	}
	public List<String> teachervideo(String t_nickname) {
		return adminDAO.teachervideo(t_nickname);
	}

	public List<String> teacherBanList() {
		return adminDAO.teacherBanList();
	}

	public int lecture_refund(String p_no, String u_id) {
		return adminDAO.lecture_refund(p_no, u_id);
	}

	public int admin_lectureGet(ULectureDTO dto) {
		return adminDAO.lectureGet(dto);
	}

	public void admin_lectureGet1(String la_no, String c1) {
		adminDAO.lectureGet1(la_no,c1);
	}

	public List<String> teacherDetail(String u_id) {
		return adminDAO.teacherDetail(u_id);
	}

	public List<String> admin_teacherRequest(String u_id) {
		return adminDAO.teacherRequest(u_id);
	}
	
	public List<String> teacherRe(String u_id) {
		return adminDAO.teacherRe(u_id);
	}
	
}
