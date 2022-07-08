package com.learning.Teacher.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.Service.LectureService;

@Controller
public class LectureController {
	
	@Autowired
	private LectureService lectureService;
	
	@RequestMapping(value = "/lecture")
	public ModelAndView lecture(HttpServletRequest request , HttpSession session) {
		System.out.println("ㅋ");
		ModelAndView mv = new ModelAndView("lecture");
		String u_id = (String)session.getAttribute("u_id");
		List<LectureDTO> lectureList = lectureService.lectureList(u_id);
		System.out.println(lectureList.toString());
		mv.addObject("lectureList", lectureList);
		return mv;
	}
	@GetMapping(value = "/lecture_request")
	public String lecture_request() {
		return "lecture_request";
	}
	@GetMapping(value = "/lecture_detail")
	public String lecture_detail() {
		return "lecture_detail";
	}

}
