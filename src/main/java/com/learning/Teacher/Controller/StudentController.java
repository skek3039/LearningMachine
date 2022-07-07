package com.learning.Teacher.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentController {
	
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

}
