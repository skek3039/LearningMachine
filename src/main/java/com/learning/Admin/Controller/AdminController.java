package com.learning.Admin.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Admin.Service.AdminService;
import com.learning.DTO.BannedDTO;
import com.learning.DTO.userDTO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@GetMapping(value = "/admin")
	public String admin(HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) {
			return "admin";						
		}else {
			return "redirect:/404";
		}
	}
	

	@GetMapping(value = "/admin_lecture_request")
	public ModelAndView admin_lecture_request(HttpSession session, HttpServletRequest request) {
		if ((int)session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_lecture_request");
				
			List<String> list = adminService.admin_lectureRequest();
			
			mv.addObject("list",list);
			return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
	}
	@GetMapping(value = "/admin_teacher_video")
	public ModelAndView admin_teacher_video(HttpServletRequest request , HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) { 
			ModelAndView mv = new ModelAndView("admin_teacher_video");
			String t_nickname = null;
			List<String> list = adminService.teachervideo(t_nickname);
			List<String> list1 = adminService.teacherBanList();
			mv.addObject("list",list);
			mv.addObject("ban",list1);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}	
}
	@GetMapping(value = "/admin_teacher")
	public ModelAndView admin_teacher(HttpServletRequest request, HttpSession session) {
		if ((int)session.getAttribute("u_authority") == 7) {
		ModelAndView mv = new ModelAndView("admin_teacher");
			
		List<String> list = adminService.teacherList();
		
		mv.addObject("list",list);
		
		return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	//학생리스트 불러오기
	@GetMapping(value = "/admin_student")
	public ModelAndView admin_student(HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) {
			ModelAndView mv = new ModelAndView("admin_student");
			List<userDTO> list = adminService.userList();
			mv.addObject("list",list);
			
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	//학생검색불러오기
	@GetMapping(value = "/admin_studentSearch" , produces="text/plain;charset=utf-8")
	public ModelAndView admin_studentSearch(HttpServletRequest request, HttpSession session) {	
		if((int)session.getAttribute("u_authority") ==7) {
			String u_name = request.getParameter("u_name"); 
			List<userDTO> list = adminService.userSearch(u_name);	
			
			ModelAndView mv = new ModelAndView("admin_student");
			mv.addObject("list",list);
			return mv; 
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	//강사 검색 불러오기
	@GetMapping(value = "/admin_teacherSearch" , produces="text/plain;charset=utf-8")
	public ModelAndView admin_teacherSearch(HttpServletRequest request, HttpSession session) {	
		if((int)session.getAttribute("u_authority") ==7) {
			String t_nickname = request.getParameter("t_nickname"); 
			List<userDTO> list = adminService.teacherSearch(t_nickname);	
			
			ModelAndView mv = new ModelAndView("admin_teacher");
			mv.addObject("list",list);
			return mv; 
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	//선택된 학생의 정보 불러오기
	@GetMapping(value = "/admin_studentLecture")
	public ModelAndView admin_studentLecture(HttpServletRequest request, HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) {
			ModelAndView mv = new ModelAndView("admin_studentLecture");
			String u_id = request.getParameter("u_id");
			List<String> list = adminService.studentLecture(u_id);
			List<String> report = adminService.studentReport(u_id);
			
			mv.addObject("list",list);
			mv.addObject("report",report);
						
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}	
	}
	
	//신고리스트 불러오기
	@GetMapping(value = "/admin_student_report")
	public ModelAndView admin_student_report(HttpServletRequest request , HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) { 
			ModelAndView mv = new ModelAndView("admin_student_report");
			String u_id = null;
			List<String> list = adminService.studentReport(u_id);
			List<String> list1 = adminService.studentBanList();
			
			mv.addObject("list",list);
			mv.addObject("ban",list1);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}	
	}
	//학생 신고처리하기.
	@PostMapping(value = "/admin_student_report")
	public void admin_student_report(HttpServletRequest request, HttpSession session ,HttpServletResponse response) throws Exception {
		if((int)session.getAttribute("u_authority") ==7) { 
			int result = 0;
			BannedDTO dto = new BannedDTO();
			String u_id = request.getParameter("u_id");
			dto.setU_id(u_id);
			dto.setBu_reason(request.getParameter("ur_reason"));
			dto.setAdmin_id((String)session.getAttribute("u_id"));
			PrintWriter pw = response.getWriter();
			
			result = adminService.report(dto);
			adminService.user_report(u_id);
			
			String count = result + "";
			pw.print(count);
		}	
	}
	@GetMapping(value = "/admin_report")
	public ModelAndView admin_report(HttpServletRequest request, HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) { 	
			ModelAndView mv = new ModelAndView("admin_report");
			String u_id = request.getParameter("u_id");
			List<String> list = adminService.studentReport(u_id);
			mv.addObject("list",list);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	@GetMapping(value = "/admin_student_back")
	public String admin_student_back(HttpServletRequest request, HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) { 	
			String u_id = request.getParameter("u_id");
			adminService.back(u_id);
			
			return "redirect:/admin_studentLecture?u_id="+u_id;
		}else {
			return "/404";
		}
	}
	
	//환불신청내역 불러오기
	@GetMapping(value = "/admin_student_refund")
	public ModelAndView admin_student_refund(HttpSession session, HttpServletRequest request) {
		if((int)session.getAttribute("u_authority") ==7) { 	
			ModelAndView mv = new ModelAndView("admin_student_refund");
			List<String> list = adminService.refundList();
			mv.addObject("list",list);
			
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	//실제 환불처리가 될 메소드
	@ResponseBody
	@PostMapping(value = "/admin_student_refund")
	public void  admin_student_refund(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if((int)session.getAttribute("u_authority") == 7) {
			PrintWriter pw = response.getWriter();
			
			int result = 0;
			String p_no = request.getParameter("p_no");
			String u_id = request.getParameter("u_id");
			result = adminService.lecture_refund(p_no, u_id);
			
			pw.print(result);
		}
	}
	
	
	@GetMapping(value = "/payment_list")
	public ModelAndView payment_list (HttpServletRequest request, HttpSession session) {
		if((int)session.getAttribute("u_authority") ==7) { 	
			ModelAndView mv = new ModelAndView("admin_payment_list");
		//	List<String> list = adminService.paymentList();
		//	mv.addObject("list",list);
			
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	
	
}
