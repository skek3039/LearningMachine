package com.learning.Teacher.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.Service.Video_QnaService;

@Controller
public class VideoQnaController {
	
	@Autowired
	private Video_QnaService video_qnaService;
	//비디오 Q&A리스트
	@RequestMapping(value = "/video_qna")
	public ModelAndView video_qna(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("video_qna");
			String vq_no=null;
			List<LectureDTO> video_qnaList = video_qnaService.video_qnaList(vq_no);
			mv.addObject("video_qnaList", video_qnaList);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}
	//비디오 Q&A 답글 페이지
	@RequestMapping(value = "/video_qna_reply")
	public ModelAndView qna_reply(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			ModelAndView mv = new ModelAndView("video_qna_reply");
			String vq_no = request.getParameter("vq_no");
			System.out.println(vq_no);
			List<LectureDTO> video_qnaList = video_qnaService.video_qnaList(vq_no);
			mv.addObject("video_qnaList", video_qnaList);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("404");
			return mv;
		}
	}

	//글쓰기
	@RequestMapping(value = "/video_qna_reply.do")
	public String write(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if ((int) session.getAttribute("u_authority") > 3) {
			String u_id = (String) session.getAttribute("u_id");

			LectureDTO video_qna = new LectureDTO();
			video_qna.setT_id(u_id);
			video_qna.setVqr_title(request.getParameter("title"));
			video_qna.setVqr_content(request.getParameter("content"));
			video_qna.setVq_no(Integer.parseInt(request.getParameter("vq_no")));
			int result = video_qnaService.video_qna(video_qna);
			System.out.println(result);
			if(result ==1) {	
				return "redirect:/video_qna";//상세페이지로 변경해야됨
			}else {
				return "redirect:/404";
				
			}
		} else {
			return "redirect:/404";

		}
	}
	

}
