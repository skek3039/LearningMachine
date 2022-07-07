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
	public String lecture_request() {
		return "lecture_request";
	}
	@GetMapping(value = "/lecture_detail")
	public String lecture_detail() {
		return "lecture_detail";
	}
	@GetMapping(value = "/student")
	public String student() {
		return "student";
	}
	@GetMapping(value = "/student_list")
	public String student_list() {
		return "student_list";
	}
	@GetMapping(value = "/student_ban")
	public String student_ban() {
		return "student_ban";
	}
	@GetMapping(value = "/qna")
	public String qna() {
		return "qna";
	}
}