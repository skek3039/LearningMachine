package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.learning.User.Service.ULectureService;

@Controller
public class ULectureController {
	
	@Autowired
	private ULectureService lectureService;
	
	@RequestMapping("/LectureList")
	public String lectureList(HttpServletRequest rq) {
		
		rq.setAttribute("LectureList", lectureService.LectureList((String) rq.getSession().getAttribute("u_id")));
		
		return "user/lecture";
	}

}
