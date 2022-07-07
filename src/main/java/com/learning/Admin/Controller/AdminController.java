package com.learning.Admin.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.learning.Admin.Service.*;
import com.learning.DTO.userDTO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@GetMapping(value = "/admin")
	public String admin(HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) {
			return "admin";						
		}else {
			return "redirect:/404";
		}
	}
	//학생리스트 불러오기
	@GetMapping(value = "/admin_student")
	public ModelAndView admin_student(HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) {
			ModelAndView mv = new ModelAndView("admin_student");
			List<userDTO> list = adminService.userList();
			mv.addObject("list",list);
			
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			
			return mv;
		}
	}
	
	
	
}
