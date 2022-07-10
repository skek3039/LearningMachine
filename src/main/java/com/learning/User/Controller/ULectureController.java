package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.learning.User.Service.ULectureService;
import java.util.*;
import com.learning.User.Form.*;

@Controller
public class ULectureController {
	
	@Autowired
	private ULectureService lectureService;
	
	@GetMapping("/LectureList")
	public String lectureList(HttpServletRequest rq) {
		
		String u_id = (String) rq.getSession().getAttribute("u_id");
		
		List<LectureForm> RecentList = lectureService.RecentLectureList(u_id);
		List<LectureForm> PopularList = lectureService.PopularLectureList(u_id);
		
		rq.setAttribute("RecentList", RecentList);
		rq.setAttribute("PopularList", PopularList);
		
		
		return "user/lecture";
	}

	@GetMapping("/LectureDetail")
	public String lectureDetail(@RequestParam(name = "b_no")int b_no) {
		
		
		return "user/lecturedetail";
	}
}
