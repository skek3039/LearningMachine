package com.learning.Common.Contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(value = "/")
	public String index() {
		return "index";
	}
	@GetMapping(value = "/404")
	public String error404() {
		return "404";
	}
	

	@GetMapping(value = "/contact")
	public String contact() {
		return "contact";
	}
	@GetMapping(value = "/lecture")
	public String lecture() {
		return "lecture";
	}
	@GetMapping(value = "/lecture_request")
	public String practice2() {
		return "lecture_request";
	}
	@GetMapping(value = "/lecture_detail")
	public String practice3() {
		return "lecture_detail";
	}
	@GetMapping(value = "/student")
	public String practice4() {
		return "student";
	}
	@GetMapping(value = "/student_list")
	public String practice5() {
		return "student_list";
	}
	@GetMapping(value = "/student_ban")
	public String practice6() {
		return "student_ban";
	}
	@GetMapping(value = "/qna")
	public String practice7() {
		return "qna";
	}
}