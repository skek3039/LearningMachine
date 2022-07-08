package com.learning.Teacher.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.Service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	//수강생관리 첫페이지 (강의리스트 불러오기)
	@RequestMapping(value = "/student")
	public ModelAndView student(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("student");
		List<LectureDTO> lectureList = studentService.lectureList();
		mv.addObject("lectureList", lectureList);
		return mv;
	}
	
	//수강생 리스트 불러오는 페이지	
	@GetMapping(value = "/student_list")
	public ModelAndView student_list(HttpServletRequest request, HttpSession session) {
		if((int)session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("student_list");
			String t_id = (String)session.getAttribute("u_id");
			List<String> studentList = studentService.studentList(t_id);
			System.out.println(studentList.toString());
			mv.addObject("studentList", studentList);
		
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	@GetMapping(value = "/student_ban")
	public String student_ban() {
		return "student_ban";
	}

}
