package com.learning.lecturn.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LecturnController {
	
	@GetMapping(value = "/lecture")
	public String lecture() {
		return "lecture";
	}
	@GetMapping(value = "/lecture_request")
	public String lecture_request() {
		return "lecture_request";
	}
	@GetMapping(value = "/lecture_detail")
	public String lecture_detail() {
		return "lecture_detail";
	}

}
