package com.learning.Teacher.Controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.LectureDTO;
import com.learning.DTO.PageDTO;
import com.learning.Teacher.Service.LectureService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
			int pageNo = 1;
			if (request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
			int listScale = 10;
			// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
			int pageScale = 10;			
			// totalRecordCount 전체 게시물 건수				
			int totalCount = lectureService.totalCount();
			
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

			List<LectureDTO> lectureApplyList = lectureService.lectureApplyList(map);
			mv.addObject("lectureApplyList", lectureApplyList);
			mv.addObject("paginationInfo", paginationInfo);
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
			int pageNo = 1;
			if (request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
			int listScale = 10;
			// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
			int pageScale = 10;			
			// totalRecordCount 전체 게시물 건수				
			int totalCount = lectureService.totalCount1();
			
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
			
			List<LectureDTO> lectureList = lectureService.lectureList(map);
			mv.addObject("lectureList", lectureList);
			mv.addObject("paginationInfo", paginationInfo);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	//신청 강의 상세보기
	@RequestMapping(value= "/lecture_Lookup")
	public String lecture_Lookup(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		int la_no = Integer.parseInt(request.getParameter("la_no"));
		if ((int) session.getAttribute("u_authority") > 3) {
			
			LectureDTO lecture_lookup = new LectureDTO();
			lecture_lookup.setLa_no(la_no);
			
			request.setAttribute("dto", lectureService.lecture_lookup(lecture_lookup));
			return "lecture_Lookup";
		} else {
			return "redirect:/404";

		}
	}
	
	//승인된 강의 상세보기
		@RequestMapping(value= "/lecture_Lookup2")
		public String lecture_Lookup2(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 3) {
				
				LectureDTO lecture_lookup = new LectureDTO();
				lecture_lookup.setL_code(request.getParameter("l_code"));
				request.setAttribute("dto", lectureService.lecture_lookup2(lecture_lookup));
				
				String l_code = request.getParameter("l_code");
				List<LectureDTO> video_List = lectureService.video_List(l_code);
				request.setAttribute("video_List", video_List);
				
				return "lecture_Lookup2";
			} else {
				return "redirect:/404";

			}
		}
		//승인거부 상세보기
		@RequestMapping(value= "/lecture_Lookup3")
		public String lecture_Lookup3(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int la_no = Integer.parseInt(request.getParameter("la_no"));
			if ((int) session.getAttribute("u_authority") > 3) {
				
				LectureDTO lecture_lookup = new LectureDTO();
				lecture_lookup.setLa_no(la_no);
				
				request.setAttribute("dto", lectureService.lecture_lookup(lecture_lookup));
				return "lecture_Lookup3";
			} else {
				return "redirect:/404";

			}
		}	
	
	// 강의 신청 제출
	@RequestMapping(value = "/lecture_request")
	public ModelAndView lecure_request(HttpServletRequest request, HttpSession session) {
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("lecture_request");
			
			List<String> cate = lectureService.lectureCate();
			System.out.println(cate);
			mv.addObject("cate",cate);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
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
			lecture_request.setC_code(request.getParameter("c_code"));
			lecture_request.setL_curriculum(request.getParameter("l_curriculum"));
			lecture_request.setL_thumbnail(request.getParameter("l_thumbnail"));
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
			ModelAndView mv = new ModelAndView("lecture_detail2");				
			mv.addObject("list",list);
			return mv; 
		}else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	// 승인거부 리스트 페이지
	@RequestMapping(value = "/lecture_refusal")
	public ModelAndView lecture_refusal(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("lecture_refusal");
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
			int totalCount = lectureService.totalCount2();
			
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

			List<LectureDTO> lecture_refusal = lectureService.lecture_refusal(map);
			mv.addObject("lecture_refusal", lecture_refusal);
			mv.addObject("paginationInfo", paginationInfo);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	
	//승인 거부 글 수정
	@RequestMapping(value = "/lecture_update")
	public ModelAndView lecture_update(HttpServletRequest request, HttpSession session) {
		int la_no = Integer.parseInt(request.getParameter("la_no"));
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("lecture_update");
			List<String> cate = lectureService.lectureCate();
			LectureDTO lecture_update = new LectureDTO();
			lecture_update.setLa_no(la_no);
			mv.addObject("cate",cate);
			request.setAttribute("dto", lectureService.lecture_update(lecture_update));
			
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	//수정 글 쓰기
	@RequestMapping(value = "/lecture_update.do")
	public String lecture_update_write(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			String u_id = (String) session.getAttribute("u_id");
			LectureDTO lecture_update_write = new LectureDTO();
			lecture_update_write.setT_id(u_id);
			lecture_update_write.setL_name(request.getParameter("l_name"));
			lecture_update_write.setL_info(request.getParameter("l_info"));
			lecture_update_write.setC_code(request.getParameter("c_code"));
			lecture_update_write.setL_curriculum(request.getParameter("l_curriculum"));
			lecture_update_write.setLa_no(Integer.parseInt(request.getParameter("la_no")));
			lectureService.lecture_update_write(lecture_update_write);
			return "redirect:/lecture_refusal";
		} else {
			return "redirect:/404";

		}
	}
	
	@RequestMapping(value = "/lecture_delete")
	public String lecture_delete(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		int la_no = Integer.parseInt(request.getParameter("la_no"));
		if ((int) session.getAttribute("u_authority") > 3) {
			String u_id = (String) session.getAttribute("u_id");
			LectureDTO lecture_delete = new LectureDTO();
			lecture_delete.setLa_no(la_no);
			lecture_delete.setT_id(u_id);
			
			lectureService.lecture_delete(lecture_delete);
			
			return "redirect:/lecture_refusal";
		} else {
			return "redirect:/404";

		}
	}
	
	//승인 완료 글 수정
		@RequestMapping(value = "/lecture_update2")
		public ModelAndView lecture_update2(HttpServletRequest request, HttpSession session) {
			String l_code = request.getParameter("l_code");
			if ((int) session.getAttribute("u_authority") > 3) {
				ModelAndView mv = new ModelAndView("lecture_update2");
				List<String> cate = lectureService.lectureCate();
				LectureDTO lecture_update2 = new LectureDTO();
				lecture_update2.setL_code(l_code);
				mv.addObject("cate",cate);
				request.setAttribute("dto", lectureService.lecture_update2(lecture_update2));
				
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
		}
		//수정 글 쓰기
		@RequestMapping(value = "/lecture_update2.do")
		public String lecture_update_write2(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 3) {
				String u_id = (String) session.getAttribute("u_id");
				LectureDTO lecture_update_write2 = new LectureDTO();
				lecture_update_write2.setT_id(u_id);
				lecture_update_write2.setL_name(request.getParameter("l_name"));
				lecture_update_write2.setL_info(request.getParameter("l_info"));
				lecture_update_write2.setL_curriculum(request.getParameter("l_curriculum"));
				lecture_update_write2.setL_code(request.getParameter("l_code"));
				lecture_update_write2.setC_code(request.getParameter("c_code"));
				lecture_update_write2.setL_thumbnail(request.getParameter("l_thumbnail"));
				lectureService.lecture_update_write2(lecture_update_write2);
				
				return "redirect:/lecture_detail";
			} else {
				return "redirect:/404";

			}
		}
		
		//업로드한 비디오 상세보기
		@RequestMapping(value= "/video_upload_detail")
		public String video_upload_detail(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int v_no = Integer.parseInt(request.getParameter("v_no"));
			if ((int) session.getAttribute("u_authority") > 3) {
				
				LectureDTO video_upload_detail = new LectureDTO();
				video_upload_detail.setV_no(v_no);
				video_upload_detail.setL_code(request.getParameter("l_code"));
				request.setAttribute("dto", lectureService.video_upload_detail(video_upload_detail));
				return "video_upload_detail";
			} else {
				return "redirect:/404";

			}
		}
		
		//비디오 올리기
		@RequestMapping(value = "/video_upload")
		public ModelAndView video_upload(HttpServletRequest request, HttpSession session) {
			if ((int) session.getAttribute("u_authority") > 3) {
				ModelAndView mv = new ModelAndView("video_upload");
				mv.addObject("l_code", request.getParameter("l_code"));
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
		}
		//비디오 올리기
		@RequestMapping(value = "/video_upload.do")
		public String video_upload1(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 3) {
				LectureDTO video_upload = new LectureDTO();
				video_upload.setL_code(request.getParameter("l_code"));
				video_upload.setV_root(request.getParameter("v_root"));
				video_upload.setV_videotitle(request.getParameter("v_videotitle"));
				video_upload.setV_introduce(request.getParameter("v_introduce"));
				lectureService.video_upload(video_upload);
				return "redirect:/lecture_Lookup2?l_code="+ video_upload.getL_code();
			} else {
				return "redirect:/404";

			}
		}
		
		//비디오 업로드 수정
		@RequestMapping(value = "/video_upload_update")
		public ModelAndView video_upload_update(HttpServletRequest request, HttpSession session) {
			int v_no = Integer.parseInt(request.getParameter("v_no"));
			if ((int) session.getAttribute("u_authority") > 3) {
				ModelAndView mv = new ModelAndView("video_upload_update");
				LectureDTO video_upload_update = new LectureDTO();
				video_upload_update.setV_no(v_no);
				request.setAttribute("dto", lectureService.video_upload_update(video_upload_update));
				
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
		}
		//비디오 업로드 수정 글 쓰기
		@RequestMapping(value = "/video_upload_update.do")
		public String video_update_write(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 3) {
				String u_id = (String) session.getAttribute("u_id");
				LectureDTO video_update_write = new LectureDTO();
				video_update_write.setT_id(u_id);
				video_update_write.setV_videotitle(request.getParameter("v_videotitle"));
				video_update_write.setV_introduce(request.getParameter("v_introduce"));
				video_update_write.setV_root(request.getParameter("v_root"));
				video_update_write.setV_no(Integer.parseInt(request.getParameter("v_no")));
				System.out.println(Integer.parseInt(request.getParameter("v_no")));
				lectureService.video_update_write(video_update_write);
				return "redirect:/video_upload_detail?v_no="+ video_update_write.getV_no();
			} else {
				return "redirect:/404";

			}
		}
		
		@RequestMapping(value = "/video_upload_delete")
		public String video_upload_delete(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int v_no = Integer.parseInt(request.getParameter("v_no"));
			if ((int) session.getAttribute("u_authority") > 3) {
				String u_id = (String) session.getAttribute("u_id");
				LectureDTO video_upload_delete = new LectureDTO();
				video_upload_delete.setL_code(request.getParameter("l_code"));
				video_upload_delete.setV_no(v_no);
				video_upload_delete.setT_id(u_id);
				
				lectureService.video_upload_delete(video_upload_delete);
				
				return "redirect:/lecture_Lookup2?l_code="+ video_upload_delete.getL_code();
			} else {
				return "redirect:/404";

			}
		}		
				
}
