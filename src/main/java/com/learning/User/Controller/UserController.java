package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.learning.User.Service.LectureService;

@Controller
public class UserController {

	@Autowired
	private LectureService lectureService;
	
	@RequestMapping("/usermain")
	public String userMain(HttpServletRequest rq) {
		
		if(rq.getSession().getAttribute("u_id") != null) {
			
			rq.setAttribute("popLecture", lectureService.popLecture());
			
			return "user/main";
		}else {
			
			return "redirect:/login";
		}
	}
}
