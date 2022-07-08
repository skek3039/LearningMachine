package com.learning.User.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.learning.User.Service.UserLectureService;

@Controller
public class UserLectureController {
	
	@Autowired
	private UserLectureService lectureService;
	
	@RequestMapping("/lectureList")
	public String lectureList() {
		
		return "lecturelist";
	}

}
