package com.learning.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(value = "/")
	public String index() {
		return "index";
	}

	@GetMapping(value = "/contact")
	public String contact() {
		return "contact";
	}
	@GetMapping(value = "/lecture")
	public String lecture() {
		return "lecture";
	}
	
	
	
	@GetMapping(value = "/practice2")
	public String practice2() {
		return "practice2";
	}
	@GetMapping(value = "/practice3")
	public String practice3() {
		return "practice3";
	}
	@GetMapping(value = "/practice4")
	public String practice4() {
		return "practice4";
	}
	@GetMapping(value = "/practice5")
	public String practice5() {
		return "practice5";
	}
	@GetMapping(value = "/practice6")
	public String practice6() {
		return "practice6";
	}
	@GetMapping(value = "/practice7")
	public String practice7() {
		return "practice7";
	}
}