package com.learning.Teacher.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.Service.LectureService;
import com.learning.Teacher.Service.Video_QnaService;

@Controller
public class VideoQnaController {
	
	@Autowired
	private Video_QnaService video_qnaService;
	
	@RequestMapping(value = "/video_qna")
	public ModelAndView video_qna(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("video_qna");
			List<LectureDTO> video_qnaList = video_qnaService.video_qnaList();
			mv.addObject("video_qnaList", video_qnaList);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	@GetMapping(value = "/video_qna_reply")
	public String qna_reply() {
		return "video_qna_reply";
	}

}
