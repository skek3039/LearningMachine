package com.learning.Teacher.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
	
	@GetMapping(value = "/qna")
	public String qna() {
		return "qna";
	}
	@GetMapping(value = "/qna_reply")
	public String qna_reply() {
		return "qna_reply";
	}

}
