package com.learning.Admin.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Common.Service.BoardService;
import com.learning.DTO.NoticeDTO;

@Controller
public class NoticeController {
	@Autowired
	private BoardService boardservice;
	
	@GetMapping(value = "/faq")
	public String faq() {
		return "faq";
	}
	
	@GetMapping(value = "/LM")
	public String LM() {
		return "LM";
	}
	//공지사항 상세보기페이지구현
	@GetMapping(value = "/noticedetail")
	public ModelAndView noticedetail(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("noticeDetail");
		NoticeDTO dto = boardservice.noticeDetail(Integer.parseInt(request.getParameter("n_no"))); 
		mv.addObject("dto", dto);			
		return mv;
	}
	
	//공지사항 리스트 불러오기
	@GetMapping(value = "/notice")
	public ModelAndView notice() {
		ModelAndView mv = new ModelAndView("notice");
		List<NoticeDTO> list = boardservice.noticeList();
		mv.addObject("noticelist",list);
		
		return mv;
	}
}
