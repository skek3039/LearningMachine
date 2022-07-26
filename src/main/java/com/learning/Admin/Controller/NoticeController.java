package com.learning.Admin.Controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Common.Service.NoticeService;
import com.learning.DTO.LectureDTO;
import com.learning.DTO.NoticeDTO;
import com.learning.DTO.PageDTO;
import com.learning.utill.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private Util util;
	
	@GetMapping(value = "/Lm")
	public String Lm(){
		return "Lm";
	}
	
	@GetMapping(value = "/noticeWrite")
	public String noticeWrite(HttpSession session) {
		if (session.getAttribute("u_id") != null) {
			return "noticeWrite";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping(value = "/noticeWrite")
	public String noticeWrite(HttpServletRequest request )  {
		HttpSession session = request.getSession();
		
		NoticeDTO noticeWrite = new NoticeDTO();
		noticeWrite.setU_id((String) session.getAttribute("u_id"));
		noticeWrite.setN_title(request.getParameter("n_title"));
		noticeWrite.setN_content(request.getParameter("n_content"));
		
		if (session.getAttribute("u_id") != null && request.getParameter("n_title").equals("") && request.getParameter("n_content") != null) {
			
		}
		int result = noticeService.noticeWrite(noticeWrite);
		
			if (result == 1) {
				return "redirect:/notice"; // 글쓰기 성공
			} else {
				return "redirect:/failure"; // 실패했습니다. 다시 시도하세요.
			}
		}
	
	
	//공지사항 상세보기페이지구현
	@GetMapping(value = "/noticedetail")
	public ModelAndView noticedetail(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView("noticeDetail");
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		NoticeDTO detail = new NoticeDTO();
		
	      detail.setN_no(n_no);
	   
	      Cookie[] cookies = request.getCookies();
	      Cookie viewCookie = null;
	      
	      if(cookies != null && cookies.length > 0) {
	         for(int i=0; i<cookies.length ; i++) {
	            if(cookies[i].getName().equals("cookie"+n_no)) {
	               viewCookie = cookies[i];
	            }
	         }
	      }
	      NoticeDTO dto = noticeService.noticeDetail(detail);
	      if(detail !=null ) {
	         if(viewCookie == null) {
	            Cookie newCookie = new Cookie("cookie"+n_no , "|" + n_no + "|" );
	            response.addCookie(newCookie);
	            int result = noticeService.noticecountUp(n_no);
	            if(result > 0) {
	               System.out.println("조회수 증가");
	            }else {
	               System.out.println("조회수 증가에러");
	            }
	         }else {
	            String value= viewCookie.getValue();
	         }
	      }

	
		mv.addObject("dto", dto);			
		return mv;
	}
	//공지사항 상세보기페이지구현
	@GetMapping(value = "/noticedetail2")
	public ModelAndView noticedetail2(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView("noticeDetail2");
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		NoticeDTO detail = new NoticeDTO();
		
		detail.setN_no(n_no);
		
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i<cookies.length ; i++) {
				if(cookies[i].getName().equals("cookie"+n_no)) {
					viewCookie = cookies[i];
				}
			}
		}
		NoticeDTO dto = noticeService.noticeDetail(detail);
		if(detail !=null ) {
			if(viewCookie == null) {
				Cookie newCookie = new Cookie("cookie"+n_no , "|" + n_no + "|" );
				response.addCookie(newCookie);
				int result = noticeService.noticecountUp(n_no);
				if(result > 0) {
					System.out.println("조회수 증가");
				}else {
					System.out.println("조회수 증가에러");
				}
			}else {
				String value= viewCookie.getValue();
			}
		}
		
		
		mv.addObject("dto", dto);			
		return mv;
	}
	
	//공지사항 리스트 불러오기
	@RequestMapping(value = "/notice")
	public ModelAndView notice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("notice");
		
		//카테고리 잡기
		int n_category = 1;
		if (request.getParameter("n_category") != null) {
			n_category = util.str2int(request.getParameter("n_category"));
		}
		
		int pageNo = 1;
		if (request.getParameter("pageNo")!=null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
		int listScale = 10;
		// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
		int pageScale = 10;			
		// totalRecordCount 전체 게시물 건수				
		int totalCount = noticeService.totalCount(n_category);
		
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
		page.setN_cate(n_category);


		List<NoticeDTO> noticeList = noticeService.noticeList(page);
		
		
		mv.addObject("noticeList", noticeList);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("n_cate", n_category);
		
		return mv;
	}
}
