package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.learning.User.Service.ULectureService;
import com.learning.User.Service.UserService;

@Controller
public class UController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ULectureService lectureService;

	@RequestMapping(value = "/")
	public String index(HttpServletRequest rq) {
		

		String u_id = (String) rq.getSession().getAttribute("u_id");
		
		rq.setAttribute("popLecture", lectureService.popLecture());
		
		if (u_id != null) {
			rq.setAttribute("RecentVideo", userService.RecentVideo(u_id));
			
			return "index";
		} else {
			return "index";
		}
	}
}
