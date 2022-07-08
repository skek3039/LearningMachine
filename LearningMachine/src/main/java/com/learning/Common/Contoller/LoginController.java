package com.learning.Common.Contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.learning.Common.Service.LoginService;
import com.learning.DTO.userDTO;
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
		if(dto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("u_id",dto.getU_id());
			session.setAttribute("u_authority", dto.getU_authority());
			if(dto.getU_authority() > 6) {
				return "redirect:/admin";				
			}else if(dto.getU_authority() > 3) {				
				System.out.println("강사");
				return "redirect:/lecture";								
			}
		}
		return "redirect:/";
	}
	
	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}

	// 로그아웃처리
	@GetMapping (value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if ((session.getAttribute("u_id") != null) && (session.getAttribute("u_authority") !=null)) {
			session.removeAttribute("u_id");
			session.removeAttribute("u_authority");
		}
		return "redirect:/login";
	}

}
