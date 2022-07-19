package com.learning.Common.Contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(value = "/404")
	public String error404() {
		return "404";
	}
	

	@GetMapping(value = "/community")
	public String community() {
		return "community";
	}
}