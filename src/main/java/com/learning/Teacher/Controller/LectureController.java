package com.learning.Teacher.Controller;

import java.io.UnsupportedEncodingException;
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
import com.learning.DTO.userDTO;
import com.learning.Teacher.Service.LectureService;

@Controller
public class LectureController {

	@Autowired
	private LectureService lectureService;

	// 강사첫페이지(강의 신청 페이지)
	@RequestMapping(value = "/lecture")
	public ModelAndView lecture(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("lecture");
			String u_id = (String) session.getAttribute("u_id");
			List<LectureDTO> lectureApplyList = lectureService.lectureApplyList(u_id);
			mv.addObject("lectureApplyList", lectureApplyList);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	// 강의 조회 페이지
	@RequestMapping(value = "/lecture_detail")
	public ModelAndView lecture_detail(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("lecture_detail");
			String u_id = (String) session.getAttribute("u_id");
			List<LectureDTO> lectureList = lectureService.lectureList(u_id);
			mv.addObject("lectureList", lectureList);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	// 강의 신청 제출
	@RequestMapping(value = "/lecture_request")
	public String lecure_request(HttpServletRequest request) {
		
		return "lecture_request";
	}
	// 강의 신청 제출
	@RequestMapping(value = "/lecture_request.do")
	public String lecture_request(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			String u_id = (String) session.getAttribute("u_id");

			LectureDTO lecture_request = new LectureDTO();
			lecture_request.setT_id(u_id);
			lecture_request.setL_name(request.getParameter("l_name"));
			lecture_request.setL_info(request.getParameter("l_info"));
			lecture_request.setL_category(request.getParameter("l_category"));
			lecture_request.setL_curriculum(request.getParameter("l_curriculum"));
			lectureService.lecture_request(lecture_request);
			return "redirect:/lecture";
		} else {
			return "redirect:/404";

		}
	}
	//강의검색불러오기
	@GetMapping(value = "/lecture_lectureName" , produces="text/plain;charset=utf-8")
	public ModelAndView lecture_lectureName(HttpServletRequest request, HttpSession session) {	
		if((int)session.getAttribute("u_authority") > 3) {
			String l_name = request.getParameter("l_name"); 
			List<LectureDTO> list = lectureService.letureNameSearch(l_name);	
			ModelAndView mv = new ModelAndView("lecture_detail");				
			mv.addObject("list",list);
			return mv; 
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
}
