package com.learning.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DAO.LoginDAO;
import com.learning.DTO.userDTO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO loginDAO; 
	
	public userDTO login(userDTO dto) {
		return loginDAO.login(dto);
	}

}
