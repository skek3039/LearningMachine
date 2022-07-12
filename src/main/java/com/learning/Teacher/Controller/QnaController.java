package com.learning.Teacher.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.Service.QnaService;

@Controller
public class QnaController {
	@Autowired 
	QnaService qnaService;
	
	// qna 리스트 불러오기
		@RequestMapping(value = "/qna")
		public ModelAndView qna(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("qna");
			List<LectureDTO> qnaList = qnaService.qnalist();
			mv.addObject("qnaList", qnaList);
			return mv;
		}
		
	@GetMapping(value = "/qna_reply")
	public String qna_reply() {
		return "qna_reply";
	}

}
