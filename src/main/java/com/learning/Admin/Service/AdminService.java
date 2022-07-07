package com.learning.Admin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.AdminDAO;
import com.learning.DTO.userDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	public List<userDTO> userList() {
		return adminDAO.userList();
	}
	
}
