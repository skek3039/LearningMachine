package com.learning.Common.Contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.Cookie;
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
import com.learning.Common.Service.CommunityService;
import com.learning.DTO.BoardDTO;
import com.learning.DTO.LectureDTO;
import com.learning.DTO.PageDTO;
import com.learning.utill.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import retrofit2.http.GET;

@Controller
public class HomeController {

	@Autowired
	private CommunityService communityService;
	@Autowired
	private AdminService adminService;
	
	private String name = null;
	
	@GetMapping(value = "/404")
	public String error404() {
		return "404";
	}
	@GetMapping(value = "/admin_category")
	public ModelAndView category() {
		ModelAndView mv = new ModelAndView("admin_category");
		List<String> cate = adminService.categoryList() ;
		
		mv.addObject("cate",cate);
		return mv;
	}
	
	@GetMapping(value = "/boardWrite")
	public String boardWrtie() {
		return "boardWrite";
	}
	
	@GetMapping(value = "boardModify")
	public ModelAndView boardModify(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("boardModify");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		BoardDTO board = communityService.boardDetail(b_no);
		
		mv.addObject("board",board);
		
		return mv;
	}
	
	@PostMapping(value = "boardModify")
	public String boardModify(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		BoardDTO dto = new BoardDTO();
		dto.setB_no(b_no);
		dto.setB_title(request.getParameter("b_title"));
		dto.setB_content(request.getParameter("b_content"));
		
		communityService.boardModify(dto);
		
		return "redirect:/boardDetail?b_no="+b_no;
	}
	
	
	//자유게시판 글쓰기처리
	@PostMapping(value = "boardWrite.do")
	public String boardWrite(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		BoardDTO dto = new BoardDTO();
		dto.setU_id((String)session.getAttribute("u_id"));
		dto.setB_title(request.getParameter("b_title"));
		dto.setB_content(request.getParameter("b_content"));
		
		int result = communityService.boardWrite(dto);
		System.out.println(result);
		
		return "redirect:/community";
	}
	
	@RequestMapping(value = "/boardDelete.do")
	public String boardDelete(HttpServletRequest request) {
		communityService.boardDelete(request.getParameter("b_no"));
		
		return "redirect:/community";
	}
	

	@GetMapping(value = "/community")
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mv = new ModelAndView("community");
		name ="lecture_qna";
		int pageNo = 1;
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		// recordCountPageNo 한 페이지당 게시되는 게시물 수 yes
		int listScale = 20;
		// pageSize = 페이지 리스트에 게시되는 페이지 수 yes
		int pageScale = 5;
		// totalRecordCount 전체 게시물 건수
		int totalCount = communityService.totalCount(name);
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
		
		if(request.getParameter("c_name") != null) {			
			map.put("c_name", request.getParameter("c_name"));
		}
		map.put("page", page);
		List<String> list = communityService.QnAList(map);
		List<BoardDTO> board = communityService.boardList();
		
		List<String> category = adminService.categoryList();
		mv.addObject("list",list);
		
		mv.addObject("board",board);
		mv.addObject("category",category);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		return mv;
	}
	
	//자유게시판 상세보기
	@GetMapping(value = "/boardDetail")
	public ModelAndView boardDetail(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView("boardDetail");
		int b_no = Integer.parseInt(request.getParameter("b_no"));

		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i<cookies.length ; i++) {
				if(cookies[i].getName().equals("cookie"+b_no)) {
					viewCookie = cookies[i];
				}
			}
		}
		
		BoardDTO board = communityService.boardDetail(b_no);
		if(board !=null ) {
			if(viewCookie == null) {
				Cookie newCookie = new Cookie("cookie"+b_no , "|" + b_no + "|" );
				response.addCookie(newCookie);
				int result = communityService.boardCountUp(b_no);
				if(result > 0) {
					System.out.println("조회수 증가");
				}else {
					System.out.println("조회수 증가에러");
				}
			}else {
				String value= viewCookie.getValue();
			}
		}
		
		List<BoardDTO> comment = communityService.commentList(b_no);
		
		mv.addObject("comment",comment);
		mv.addObject("boardDetail",board);
		return mv;
	}
	
	
	
	@ResponseBody
	@GetMapping(value = "community_category")
	public List<String> community_category(HttpServletRequest request){		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(request.getParameter("c_name") != null) {			
			map.put("c_name", request.getParameter("c_name"));
		}
		List<String> list1 = communityService.QnAList(map);
		return list1; 	
	}	

	//강의검색불러오기
	@GetMapping(value = "/community_communityName" , produces="text/plain;charset=utf-8")
	public ModelAndView community_communityName(HttpServletRequest request, HttpSession session) {	
		Map<String, Object> map = new HashMap<String, Object>();
			String lqa_title = request.getParameter("lqa_title"); 
		
			List<String> category = adminService.categoryList();
		
			List<LectureDTO> list = communityService.communitySearch(lqa_title);	
			ModelAndView mv = new ModelAndView("community2");				
			mv.addObject("category",category);
			mv.addObject("list",list);
			return mv; 
	}
	
	//댓글작성
	@PostMapping(value = "/boardCommentwrite")
	public @ResponseBody void boardCommentwirte(HttpServletRequest request , HttpSession session , HttpServletResponse response) throws IOException {
		BoardDTO dto = new BoardDTO();
		dto.setU_id((String)session.getAttribute("u_id"));
		dto.setB_no(Integer.parseInt(request.getParameter("b_no")));
		dto.setBr_content((String)request.getParameter("br_content"));
		
		int result = communityService.commentWrite(dto);
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
	}
}