package com.learning.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.NoticeDTO;
import com.learning.DTO.userDTO;
import com.learning.Service.BoardService;

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
