package com.learning.Admin.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;
import java.util.UUID;

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
import com.learning.DTO.PageDTO;
import com.learning.DTO.userDTO;
import com.learning.User.DTO.ULectureDTO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@GetMapping(value = "/admin")
	public String admin(HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			return "admin";
		} else {
			return "redirect:/404";
		}
	}
	
	
	
	//강의 관리
	@GetMapping(value = "/admin_lecture_management")
	public ModelAndView admin_lecture_management(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_lecture_management");
		
		return mv;
	}
	
	
	
	//강의신청내역 상세보기
	@GetMapping(value = "/admin_lectureDetail")
	public ModelAndView admin_lectureDetail(HttpSession session, HttpServletRequest request) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_lectureDetail");
			String la_no = request.getParameter("la_no");
			List<String> list = adminService.admin_lectureRequest(la_no);

			mv.addObject("list", list);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	// 강의신청리스트 보기.
	@GetMapping(value = "/admin_lecture_request")
	public ModelAndView admin_lecture_request(HttpSession session, HttpServletRequest request) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_lecture_request");
			String la_no = null;
			List<String> list = adminService.admin_lectureRequest(la_no);

			mv.addObject("list", list);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	
	//강의신청내역 (승인/승인거부) 처리
	@GetMapping(value = "/admin_lecture_get")
	public String admin_lecture_get(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String check = null;
		String c1 = request.getParameter("check");
		int result = 0;
		if (c1.equals("1")) {
			if ((int) session.getAttribute("u_authority") == 7) {
				ULectureDTO dto = new ULectureDTO();
				dto.setL_curriculum(request.getParameter("l_curriculum"));
				dto.setL_name(request.getParameter("l_name"));
				dto.setL_price(Integer.parseInt(request.getParameter("l_price")));
				dto.setT_id(request.getParameter("t_id"));
				dto.setL_code(UUID.randomUUID().toString().replace("-", ""));

				result = adminService.admin_lectureGet(dto);
				adminService.admin_lectureGet1(request.getParameter("la_no"),c1);
				if (result == 1) {
					check = "redirect:/admin_lecture_request";
				} else {
					check = "redirect:/404";
				}
			}
		}else if (c1.equals("2")) {// 승인거부 했을때.
				if ((int) session.getAttribute("u_authority") == 7) {
					adminService.admin_lectureGet1(request.getParameter("la_no"),c1);
					check = "redirect:/admin_lecture_request";
				} else {
					check = "redirect:/404";
				}
			}
		
		return check;
	}

	
	//강사신청내역보기
	@GetMapping(value = "admin_teacher_request")
	public ModelAndView admin_teacher_request(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_teacher_request");
			String u_id = null;
			List<String> list = adminService.admin_teacherRequest(u_id);
			mv.addObject("list", list);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	
	//신청강사 상세정보보기
	@GetMapping(value = "admin_teacher_re")
	public ModelAndView admin_teacher_re(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_teacher_re");
			String u_id = request.getParameter("u_id");
			List<String> list = adminService.teacherRe(u_id);
			
			mv.addObject("list",list);
			return mv;
		}else{
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}


	// 강사리스트 불러오기
	@GetMapping(value = "/admin_teacher")
	public ModelAndView admin_teacher(HttpServletRequest request, HttpSession session) throws ParseException {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_teacher");
			int check_total = 3;
			int pageNo = 1;
			if (request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
			int listScale = 10;
			// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
			int pageScale = 10;			
			// totalRecordCount 전체 게시물 건수				
			int totalCount = adminService.totalCount(check_total);
			// 전자정부페이징 호출
			PaginationInfo paginationInfo = new PaginationInfo();
			// 값 대입
			paginationInfo.setCurrentPageNo(pageNo);
			paginationInfo.setRecordCountPerPage(listScale);
			paginationInfo.setPageSize(pageScale);
			paginationInfo.setTotalRecordCount(totalCount);
			// 전자정부 계산하기
			int startPage = paginationInfo.getFirstRecordIndex();
			int lastpage = paginationInfo.getRecordCountPerPage();
			
			// 서버로 보내기
			PageDTO page = new PageDTO();
			page.setStartPage(startPage);
			page.setLastPage(lastpage);
	
			List<String> list = adminService.teacherList();
			mv.addObject("list", list);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	

	//강사 상세정보보기
	@GetMapping(value = "/admin_teacherDetail")
	public ModelAndView admin_teacherDetail(HttpSession session, HttpServletRequest request) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_teacherDetail");
			String u_id = request.getParameter("t_id");
			List<String> list = adminService.teacherDetail(u_id);
			mv.addObject("list",list);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	
	
	// 강사 검색 불러오기
	@GetMapping(value = "/admin_teacherSearch", produces = "text/plain;charset=utf-8")
	public ModelAndView admin_teacherSearch(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			String t_nickname = request.getParameter("t_nickname");
			List<userDTO> list = adminService.teacherSearch(t_nickname);
	
			ModelAndView mv = new ModelAndView("admin_teacher");
			mv.addObject("list", list);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}



	// 학생리스트 불러오기
	@GetMapping(value = "/admin_student")
	public ModelAndView admin_student(HttpSession session, HttpServletRequest request) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_student");
			int check_total = 1;
			int pageNo = 1;
			if (request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
			int listScale = 10;
			// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
			int pageScale = 10;			
			// totalRecordCount 전체 게시물 건수				
			int totalCount = adminService.totalCount(check_total);
			// 전자정부페이징 호출
			PaginationInfo paginationInfo = new PaginationInfo();
			// 값 대입
			paginationInfo.setCurrentPageNo(pageNo);
			paginationInfo.setRecordCountPerPage(listScale);
			paginationInfo.setPageSize(pageScale);
			paginationInfo.setTotalRecordCount(totalCount);
			// 전자정부 계산하기
			int startPage = paginationInfo.getFirstRecordIndex();
			int lastpage = paginationInfo.getRecordCountPerPage();
			
			// 서버로 보내기
			PageDTO page = new PageDTO();
			page.setStartPage(startPage);
			page.setLastPage(lastpage);
			
			List<userDTO> list = adminService.userList(page);
			mv.addObject("list", list);
			mv.addObject("paginationInfo", paginationInfo);
			mv.addObject("pageNo", pageNo);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	// 학생검색불러오기
	@GetMapping(value = "/admin_studentSearch", produces = "text/plain;charset=utf-8")
	public ModelAndView admin_studentSearch(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			String u_name = request.getParameter("u_name");
			List<userDTO> list = adminService.userSearch(u_name);

			ModelAndView mv = new ModelAndView("admin_student");
			mv.addObject("list", list);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	// 선택된 학생의 정보 불러오기
	@GetMapping(value = "/admin_studentLecture")
	public ModelAndView admin_studentLecture(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_studentLecture");
			String u_id = request.getParameter("u_id");
			List<String> list = adminService.studentLecture(u_id);
			List<String> report = adminService.studentReport(u_id,null);

			mv.addObject("list", list);
			mv.addObject("report", report);

			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	// 신고리스트 불러오기
	@GetMapping(value = "/admin_student_report")
	public ModelAndView admin_student_report(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_student_report");
			String u_id = null;
			int check_total = 2;
			int pageNo = 1;
			if (request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
			int listScale = 5;
			// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
			int pageScale = 5;			
			// totalRecordCount 전체 게시물 건수				
			int totalCount = adminService.totalCount(check_total);
			// 전자정부페이징 호출
			PaginationInfo paginationInfo = new PaginationInfo();
			// 값 대입
			paginationInfo.setCurrentPageNo(pageNo);
			paginationInfo.setRecordCountPerPage(listScale);
			paginationInfo.setPageSize(pageScale);
			paginationInfo.setTotalRecordCount(totalCount);
			// 전자정부 계산하기
			int startPage = paginationInfo.getFirstRecordIndex();
			int lastpage = paginationInfo.getRecordCountPerPage();
			
			// 서버로 보내기
			PageDTO page = new PageDTO();
			page.setStartPage(startPage);
			page.setLastPage(lastpage);
			
			List<String> list = adminService.studentReport(u_id, page);
			List<String> list1 = adminService.studentBanList();

			mv.addObject("list", list);
			mv.addObject("ban", list1);
			mv.addObject("paginationInfo",paginationInfo);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	//학생신고리스트보기
	@PostMapping(value = "/admin_student_report")
	public void admin_student_report(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws Exception {
		if ((int) session.getAttribute("u_authority") == 7) {
			int result = 0;
			BannedDTO dto = new BannedDTO();
			String u_id = request.getParameter("u_id");
			dto.setU_id(u_id);
			dto.setBu_reason(request.getParameter("ur_reason"));
			dto.setAdmin_id((String) session.getAttribute("u_id"));
			PrintWriter pw = response.getWriter();

			result = adminService.report(dto);
			adminService.user_report(u_id);

			String count = result + "";
			pw.print(count);
		}
	}

	// 신고내역불러오기
	@GetMapping(value = "/admin_report")
	public ModelAndView admin_report(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_report");
			String u_id = request.getParameter("u_id");
			
			List<String> list = adminService.studentReport(u_id,null);
			mv.addObject("list", list);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	// 정지된 학생 복구처리
	@GetMapping(value = "/admin_student_back")
	public String admin_student_back(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			String u_id = request.getParameter("u_id");
			adminService.back(u_id);

			return "redirect:/admin_studentLecture?u_id=" + u_id;
		} else {
			return "/404";
		}
	}

	// 환불신청내역 불러오기
	@GetMapping(value = "/admin_student_refund")
	public ModelAndView admin_student_refund(HttpSession session, HttpServletRequest request) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_student_refund");
			List<String> list = adminService.refundList();
			mv.addObject("list", list);

			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	// 실제 환불처리가 될 메소드
	@ResponseBody
	@PostMapping(value = "/admin_student_refund")
	public void admin_student_refund(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if ((int) session.getAttribute("u_authority") == 7) {
			PrintWriter pw = response.getWriter();

			int result = 0;
			String p_no = request.getParameter("p_no");
			String u_id = request.getParameter("u_id");
			result = adminService.lecture_refund(p_no, u_id);

			pw.print(result);
		}
	}

	@GetMapping(value = "/payment_list")
	public ModelAndView payment_list(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin_payment_list");
			// List<String> list = adminService.paymentList();
			// mv.addObject("list",list);

			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

}
