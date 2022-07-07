package com.learning.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping(value = "/admin")
	public String admin(HttpSession session) {
		if((session.getAttribute("u_authority")+"").equals("7")) {
			return "admin";						
		}else {
			return "redirect:/404";
		}
	}
	
	@GetMapping(value = "/admin_student")
	public String admin_student() {
		return "admin_student";
	}
	
	
	
}
