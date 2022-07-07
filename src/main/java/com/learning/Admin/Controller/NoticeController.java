package com.learning.Admin.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Common.Service.BoardService;
import com.learning.DTO.NoticeDTO;

@Controller
public class NoticeController {
	@Autowired
	private BoardService boardservice;
	
	@GetMapping(value = "/notice")
	public ModelAndView notice() {
		ModelAndView mv = new ModelAndView("notice");
		List<NoticeDTO> list = boardservice.noticeList();
		mv.addObject("noticelist",list);
		return mv;
	}
}
