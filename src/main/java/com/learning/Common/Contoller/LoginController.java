package com.learning.Common.Contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@GetMapping(value = "/forgetPW")
	public String forgetPW(HttpSession session ) {
		
		return "forgetPW";
	}
	
	
	@PostMapping(value = "/checkID")
	@ResponseBody
	public String checkID(HttpServletRequest request) throws IOException {
		String result = "1";
		int count = loginService.checkID(request.getParameter("u_id"));
		result = String.valueOf(count);
		
		return result;
	}
	
	
	@GetMapping(value = "/join")
	public String join() {
		return "join";
	}
	
	@PostMapping(value = "/join")
	public String join(HttpServletRequest request) throws UnsupportedEncodingException {
		
		request.getCharacterEncoding();
		request.setCharacterEncoding("UTF-8");
		
		userDTO dto = new userDTO();
		
		dto.setU_id(request.getParameter("u_id"));
		dto.setU_pw(request.getParameter("u_pw"));
		dto.setU_pw(request.getParameter("u_pw1"));
		dto.setU_email(request.getParameter("u_email"));
		dto.setU_name(request.getParameter("u_name"));
		dto.setU_nickname(request.getParameter("u_nickname"));
		dto.setU_gender(request.getParameter("u_gender"));
		dto.setU_birth(request.getParameter("u_birth"));
		
		int result = loginService.join(dto);
		
		System.out.println(result);
		return "redirect:/join";
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
