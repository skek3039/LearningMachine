package com.learning.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.learning.DTO.userDTO;
import com.learning.Service.LoginService;
@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@PostMapping(value = "/login")
	public String login(HttpServletRequest request) {
		userDTO dto = new userDTO();
		dto.setU_id(request.getParameter("id"));
		dto.setU_pw(request.getParameter("pw"));
		
		dto = loginService.login(dto);
		
		return "redirect:/";
	}
	
	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}
	
}
