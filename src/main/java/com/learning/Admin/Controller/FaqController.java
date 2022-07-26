package com.learning.Admin.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Common.Service.FaqService;
import com.learning.DTO.FaqDTO;

@Controller
public class FaqController {
	@Autowired
	FaqService faqService;

	@GetMapping(value = "/faq")
	public ModelAndView faq(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("faq");

		List<FaqDTO> list = faqService.faqList();

		mv.addObject("list", list);
		return mv;
	}
}
