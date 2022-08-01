package com.learning.Common.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Common.DAO.LoginDAO;
import com.learning.DTO.TeacherDTO;
import com.learning.DTO.userDTO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO loginDAO;
	//private LoginDAO mapper;
	//private LoginDAO manager; 
	
	public userDTO login(userDTO dto) {
		return loginDAO.login(dto);
	}

	public int join(userDTO dto) {
		return loginDAO.join(dto);
	}

	public int checkID(String u_id) {
		return loginDAO.checkID(u_id);
	}

	public int forgotPW(userDTO user) {
		return loginDAO.forgotPW(user);
	}

	public int resetPw(userDTO user) {
		return loginDAO.resetPw(user);
	}

	public int checkEmail(String u_email) {
		return loginDAO.checkEmail(u_email);
	}

	public int checkNickname(String u_nickname) {
		return loginDAO.checkNickname(u_nickname);
	}

	public int join2(userDTO dto) {
		return loginDAO.join2(dto);
	}

	public int join3(TeacherDTO dto1) {
		return loginDAO.join3(dto1);
	}

	public int myDrop(String u_id) {
		return loginDAO.myDrop(u_id);
	}
	
	public String find_id(HttpServletResponse response, String u_email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = loginDAO.find_id(u_email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
}
