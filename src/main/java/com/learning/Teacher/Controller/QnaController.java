package com.learning.Teacher.Controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.LectureDTO;
import com.learning.DTO.PageDTO;
import com.learning.Teacher.Service.QnaService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class QnaController {
	@Autowired 
	QnaService qnaService;
	
	// qna 리스트 불러오기
		@RequestMapping(value = "/qna")
		public ModelAndView qna(HttpServletRequest request, HttpSession session) {
			if ((int) session.getAttribute("u_authority") > 3) {
				
				ModelAndView mv = new ModelAndView("qna");
				String lqa_no = null;
				int pageNo = 1;
				if (request.getParameter("pageNo")!=null) {
					pageNo = Integer.parseInt(request.getParameter("pageNo"));
				}
			
			// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
			int listScale = 10;
			// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
			int pageScale = 10;			
			// totalRecordCount 전체 게시물 건수				
			int totalCount = qnaService.totalCount();
			
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
			map.put("lqa_no", lqa_no);
			map.put("page", page);
			List<LectureDTO> qnaList = qnaService.qnalist(page);
			mv.addObject("qnaList", qnaList);
			mv.addObject("paginationInfo", paginationInfo);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
}
		//Q&A답글 페이지	
		@RequestMapping(value = "/qna_reply")
		public String qna_reply(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			
			int lqa_no = Integer.parseInt(request.getParameter("lqa_no"));
			if ((int)session.getAttribute("u_authority") > 3) {

				LectureDTO qna_reply = new LectureDTO();
				qna_reply.setLqa_no(lqa_no);
				
				request.setAttribute("dto", qnaService.qna_reply(qna_reply));
				return "qna_reply";
			}else {
				return "redirect:/404";
			}
		}
		
		//Q&A 답변 작성
		@RequestMapping(value = "/qna_reply.do")
		public String write(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 3) {
				String u_id = (String) session.getAttribute("u_id");

				LectureDTO qna_reply2 = new LectureDTO();
				qna_reply2.setT_id(u_id);
				qna_reply2.setLqar_title(request.getParameter("title"));
				qna_reply2.setLqar_content(request.getParameter("content"));
				qna_reply2.setLqa_no(Integer.parseInt(request.getParameter("lqa_no")));
				int result = qnaService.qna_reply2(qna_reply2);
				System.out.println(result);
				if(result ==1) {	
					return "redirect:/qna";//상세페이지로 변경해야됨
				}else {
					return "redirect:/404";
					
				}
			} else {
				return "redirect:/404";

			}
		}
		
		//Q&A 답글 완료
		@RequestMapping(value = "/qna_detail")
		public String video_qna_detail(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int lqa_no = Integer.parseInt(request.getParameter("lqa_no"));
			if ((int) session.getAttribute("u_authority") > 3) {
				System.out.println(lqa_no);
				LectureDTO qna_detail = new LectureDTO();
				qna_detail.setLqa_no(lqa_no);
				
				request.setAttribute("dto", qnaService.qna_detail(qna_detail));
				System.out.println(qnaService.qna_detail(qna_detail).toString());
				
				return "qna_detail";
			} else {
				return "redirect:/404";
			}
		}
		
		//답변 완료 Q&A리스트
		@RequestMapping(value = "/qna_answer")
		public ModelAndView video_answer(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 3) {
				ModelAndView mv = new ModelAndView("qna_answer");
				String lqa_no=null;
				int pageNo = 1;
				if (request.getParameter("pageNo")!=null) {
					pageNo = Integer.parseInt(request.getParameter("pageNo"));
				}
				// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
				int listScale = 10;
				// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
				int pageScale = 10;			
				// totalRecordCount 전체 게시물 건수				
				int totalCount = qnaService.totalCount();
				
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
				map.put("lqa_no", lqa_no);
				map.put("page", page);
				
				List<LectureDTO> qna_answer = qnaService.qna_answer(map);
				
				mv.addObject("qna_answer", qna_answer);
				mv.addObject("paginationInfo", paginationInfo);
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
		}
		//글 수정
		@RequestMapping(value = "/qna_update")
		public ModelAndView qna_update(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int lqa_no = Integer.parseInt(request.getParameter("lqa_no"));
			if ((int) session.getAttribute("u_authority") > 3) {
				ModelAndView mv = new ModelAndView("qna_update");
				LectureDTO qna_update = new LectureDTO();
				qna_update.setLqa_no(lqa_no);
				request.setAttribute("dto", qnaService.qna_update(qna_update));
				
				return mv;
			} else {
				ModelAndView mv = new ModelAndView("404");
				return mv;
			}
		}
		//수정 글 쓰기
		@RequestMapping(value = "/qna_update.do")
		public String update(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			if ((int) session.getAttribute("u_authority") > 3) {
				String u_id = (String) session.getAttribute("u_id");

				LectureDTO qna_write = new LectureDTO();
				qna_write.setT_id(u_id);
				qna_write.setLqar_title(request.getParameter("title"));
				qna_write.setLqar_content(request.getParameter("content"));
				qna_write.setLqa_no(Integer.parseInt(request.getParameter("lqa_no")));
				int result = qnaService.qna_write(qna_write);
				System.out.println(result);
				if(result ==1) {	
					return "redirect:/qna_answer";
				}else {
					return "redirect:/404";
					
				}
			} else {
				return "redirect:/404";

			}
		}
	

}

