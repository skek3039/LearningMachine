package com.learning.Common.Service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Common.DAO.LoginDAO;
import com.learning.DTO.userDTO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO loginDAO; 
	
	public userDTO login(userDTO dto) {
		return loginDAO.login(dto);
	}

	public int join(userDTO dto) {
		return loginDAO.join(dto);
	}

	public int checkID(String u_id) {
		return loginDAO.checkID(u_id);
	}

	public userDTO forgotPW(userDTO user) {
		return loginDAO.forgotPW(user);
	}

	public int resetPw(userDTO user) {
		return loginDAO.resetPw(user);
	}


}
