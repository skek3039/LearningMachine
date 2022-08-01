package com.learning.Admin.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Admin.Service.AdminService;
import com.learning.Admin.Service.PaymentService;
import com.learning.DTO.BannedDTO;
import com.learning.DTO.BoardDTO;
import com.learning.DTO.LectureDTO;
import com.learning.DTO.NoticeDTO;
import com.learning.DTO.PageDTO;
import com.learning.DTO.userDTO;
import com.learning.User.DTO.ULectureDTO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PaymentService paymentService;

	@GetMapping(value = "/admin")
	public ModelAndView admin(HttpSession session) {
		if ((int) session.getAttribute("u_authority") == 7) {
			ModelAndView mv = new ModelAndView("admin");
			List<String> report = adminService.studentReport(null,null);
			List<String> refund = adminService.refundList();
			List<String> lecture = adminService.admin_lectureRequest(null);
			List<String> payment = paymentService.paymentList(null);
			List<String> refundRate = paymentService.refundRate();
		
			int count = adminService.msgList();
			mv.addObject("count",count);
			mv.addObject("refundRate",refundRate);
			mv.addObject("report",report);
			mv.addObject("refund",refund);
			mv.addObject("lecture",lecture);
			mv.addObject("payment", payment);
			System.out.println(count);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
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
				dto.setL_info(request.getParameter("l_info"));
				dto.setL_code(UUID.randomUUID().toString().replace("-", ""));
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("dto", dto);
				map.put("c_name", (String)request.getParameter("c_name"));
				map.put("c_code", (String)request.getParameter("c_code"));
				map.put("la_no", request.getParameter("la_no"));
				result = adminService.admin_lectureGet(map);
				adminService.admin_lectureGet1(map,c1);
				if (result == 1) {
					check = "redirect:/admin_lecture_request";
				} else {
					check = "redirect:/404";
				}
			}
		}else if (c1.equals("2")) {// 승인거부 했을때.
				Map<String, Object> map = new HashMap<String, Object>();
				if ((int) session.getAttribute("u_authority") == 7) {
					map.put("la_no", request.getParameter("la_no"));
					map.put("c1", "2");
					map.put("la_reason", request.getParameter("la_reason"));
					adminService.admin_lectureGet1(map,c1);
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
			int check_total = 4;
			String u_id = null;
			
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
			List<String> list = adminService.admin_teacherRequest(u_id, page);
			mv.addObject("list", list);
			mv.addObject("paginationInfo", paginationInfo);
			mv.addObject("pageNo", pageNo);

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

	//강사승인 및 승인거부 처리
	@PostMapping(value= "admin_teacher_request")
	public void admin_teacher_request(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if ((int) session.getAttribute("u_authority") == 7) {
		String u_id = request.getParameter("u_id");
		List<String> t_apply = adminService.teacherRe(u_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("t_id", u_id);
		map.put("t_apply", t_apply);
		int result = adminService.teacherAccept(map);
		PrintWriter pw = response.getWriter();
		pw.print(result);
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
			List<userDTO> list = adminService.userList();
			mv.addObject("list", list);
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("u_id", u_id);
			List<String> payment = paymentService.paymentList(map);
		
			mv.addObject("payment",payment);
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
	public void admin_student_report(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
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
	
	
	//카테고리추가
	@GetMapping(value = "/addCategory")
	public @ResponseBody void addCategory(HttpServletRequest request) {
		String c_name = request.getParameter("c_name");
		String check = request.getParameter("check");
		
		int result = adminService.addCategory(c_name,check);
	}

	// 공지사항 페이지
	@RequestMapping(value = "/admin_notice")
	public ModelAndView admin_notice(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 6) {
			ModelAndView mv = new ModelAndView("admin_notice");
			String u_id = (String) session.getAttribute("u_id");
			int pageNo = 1;
			if (request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
			int listScale = 10;
			// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
			int pageScale = 10;			
			// totalRecordCount 전체 게시물 건수				
			int totalCount = adminService.notice_totalCount();
			
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("u_id", u_id);
			map.put("page", page);

			List<NoticeDTO> noticeList = adminService.noticeList(map);
			mv.addObject("noticeList", noticeList);
			mv.addObject("paginationInfo", paginationInfo);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	//공지사항 쓰기
	@RequestMapping(value = "/notice_request")
	public ModelAndView notice_request(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 6) {
			ModelAndView mv = new ModelAndView("notice_request");
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	//공지사항 글 쓰기
	@RequestMapping(value = "/notice_request.do")
	public String update(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 6) {
			String u_id = (String) session.getAttribute("u_id");

			NoticeDTO notice_request = new NoticeDTO();
			notice_request.setU_id(u_id);
			notice_request.setN_title(request.getParameter("title"));
			notice_request.setN_content(request.getParameter("content"));
			adminService.notice_request(notice_request);
				return "redirect:/admin_notice";
			}else {
				return "redirect:/404";
				
			}
		}
		//공지사항 글 수정
		@RequestMapping(value = "/notice_update")
		public ModelAndView notice_update(HttpServletRequest request, HttpSession session) {
			int n_no = Integer.parseInt(request.getParameter("n_no"));
			if ((int) session.getAttribute("u_authority") > 6) {
				ModelAndView mv = new ModelAndView("notice_update");
				NoticeDTO notice_update = new NoticeDTO();
				notice_update.setN_no(n_no);
				request.setAttribute("dto", adminService.notice_update(notice_update));
				
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
	}	
		//공지사항 글 쓰기
		@RequestMapping(value = "/notice_update.do")
		public String notice_update_write(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 6) {
				String u_id = (String) session.getAttribute("u_id");

				NoticeDTO notice_update1 = new NoticeDTO();
				notice_update1.setU_id(u_id);
				notice_update1.setN_no(Integer.parseInt(request.getParameter("n_no")));
				notice_update1.setN_title(request.getParameter("title"));
				notice_update1.setN_content(request.getParameter("content"));
				adminService.notice_update1(notice_update1);
					return "redirect:/admin_notice";
				}else {
					return "redirect:/404";
					
				}
			}	
		//글 삭제
		@RequestMapping(value = "/notice_delete")
		public String notice_delete(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int n_no = Integer.parseInt(request.getParameter("n_no"));
			if ((int) session.getAttribute("u_authority") > 6) {
				String u_id = (String) session.getAttribute("u_id");
				NoticeDTO notice_delete = new NoticeDTO();
				notice_delete.setN_no(n_no);
				notice_delete.setU_id(u_id);
				
				adminService.notice_delete(notice_delete);
				
				return "redirect:/admin_notice";
			} else {
				return "redirect:/404";

			}
		}
		
		// 자유게시판 페이지
		@RequestMapping(value = "/admin_community")
		public ModelAndView admin_community(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 6) {
				ModelAndView mv = new ModelAndView("admin_community");
				String u_id = (String) session.getAttribute("u_id");
				int pageNo = 1;
				if (request.getParameter("pageNo")!=null) {
					pageNo = Integer.parseInt(request.getParameter("pageNo"));
				}
				// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
				int listScale = 10;
				// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
				int pageScale = 10;			
				// totalRecordCount 전체 게시물 건수				
				int totalCount = adminService.community_totalCount();
				
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
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("u_id", u_id);
				map.put("page", page);

				List<BoardDTO> boardList = adminService.boardList(map);
				mv.addObject("boardList", boardList);
				mv.addObject("paginationInfo", paginationInfo);
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
		}
		//글 삭제
		@RequestMapping(value = "/board_delete")
		public String board_delete(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int b_no = Integer.parseInt(request.getParameter("b_no"));
			if ((int) session.getAttribute("u_authority") > 6) {
				String u_id = (String) session.getAttribute("u_id");
				BoardDTO board_delete = new BoardDTO();
				board_delete.setB_no(b_no);
				board_delete.setU_id(u_id);
				
				adminService.board_delete(board_delete);
				
				return "redirect:/admin_community";
			} else {
				return "redirect:/404";

			}
		}
				
}