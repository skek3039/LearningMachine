package com.learning.Admin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.AdminDAO;
import com.learning.DTO.BannedDTO;
import com.learning.DTO.userDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	public List<userDTO> userList() {
		return adminDAO.userList();
	}

	public List<userDTO> userSearch(String u_name) {
		return adminDAO.userSearch(u_name);
	}

	public List<String> studentLecture(String u_id) {
		return adminDAO.studentLecture(u_id);
	}

	public List<String> studentReport(String u_id) {
		return adminDAO.studentReport(u_id);
	}

	public int report(BannedDTO dto) {
		return adminDAO.report(dto);
	}

	public void user_report(String u_id) {
		adminDAO.user_report(u_id);
	}

	
}
