package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.learning.User.Service.ULectureService;
import com.learning.User.Service.UserService;

import java.text.ParseException;
import java.util.*;
import com.learning.User.Form.*;

@Controller
public class ULectureController {

	@Autowired
	private UserService userService;

	@Autowired
	private ULectureService lectureService;

	// 카테고리 리스트도 보내주기 추가해야함
	@GetMapping(value = "/LectureList")
	public String lectureList(HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");

		List<ULectureForm> RecentList = lectureService.RecentLectureList(u_id);
		List<ULectureForm> PopularList = lectureService.PopularLectureList(u_id);

		rq.setAttribute("RecentList", RecentList);
		rq.setAttribute("PopularList", PopularList);

		return "user/lecture";
	}

	@GetMapping(value = "/LectureDetail")
	public String lectureDetail(@RequestParam(name = "l_code") String l_code, HttpServletRequest rq) throws ParseException {

		String u_id = (String) rq.getSession().getAttribute("u_id");

		// 카테고리 리스트도 보내주기 추가해야함
		rq.setAttribute("LectureDetail", lectureService.LectureDetail(u_id, l_code));
		rq.setAttribute("LectureQnas", lectureService.LuectureQnas(u_id, l_code));
		rq.setAttribute("LectureReviews", lectureService.LectureReviews(l_code));
		
		Map<Integer, VideoForm> LectureVideoMap = lectureService.LectureVideos(u_id, l_code);
		rq.setAttribute("LectureVideos", LectureVideoMap);
		if (LectureVideoMap.size() != 0) {
			rq.setAttribute("FirstVideo", LectureVideoMap.get(1).getV_no());
			rq.setAttribute("RecentVideo", userService.RecentLectureVideo(u_id, l_code)); // 해당 강의 최근 동영상(v_no)
		}
		return "user/LectureDetail";
	}

	@GetMapping(value = "/LectureVideo")
	public String lectureVideo(@RequestParam(name = "v_no") int v_no, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String l_code = lectureService.CheckLectureRegister(v_no);
		// n번째 동영상(미리보기 3개를 위해 key값이 1부터 올라가는 값을 파라미터로 받음)
		Map<Integer, VideoForm> Videos = null;
		VideoForm videoform = null;
		int order = 0;

		if (l_code == null) {

			return "redirect:/404";

		} else if (u_id != null && lectureService.RegisterVideo(l_code, u_id) == 1) {

			Videos = lectureService.LectureVideos(u_id, l_code);
			UserAttendanceForm UAForm = new UserAttendanceForm();
			for (int key : Videos.keySet()) {

				if (Videos.get(key).getV_no() == v_no) {

					order = key;
					break;
				}
			}
			try {
				UAForm.setV_no(v_no);
				UAForm.setU_id(u_id);
				UAForm.setL_code(l_code);
				userService.LectureVideoAttendance(UAForm);
				
				videoform = Videos.get(order);
				
				rq.setAttribute("LectureVideos", lectureService.LectureVideos(u_id, l_code));
				rq.setAttribute("Video", videoform);
				rq.setAttribute("VideoQnas", lectureService.LectureVideoQnas(v_no));
			} catch (Exception e) {

				e.printStackTrace();
				return "redirect:/404";
			}
			return "user/video";
		} else {

			Videos = lectureService.LectureVideos(u_id, l_code);
			for (int key : Videos.keySet()) {

				if (Videos.get(key).getV_no() == v_no) {

					order = key;
					break;
				}
			}
			if (order > 3) {

				return "redirect:/Pay?l_code=" + l_code; //payment컨트롤러에서 유저확인 후 로그인 보낼지 확인
			} else {
				try {

					videoform = Videos.get(order);
					
					rq.setAttribute("LectureVideos", lectureService.LectureVideos(u_id, l_code));
					rq.setAttribute("Video", videoform);
					rq.setAttribute("VideoQnas", lectureService.LectureVideoQnas(v_no));
				} catch (Exception e) {
					e.printStackTrace();

					return "redirect:/404";
				}
			}
			return "user/video";
		}
		
	}
	@RequestMapping(value = "/LectureQnaWrite.do")
	@ResponseBody
	public int LectureQnA(@RequestParam(name = "l_code")String l_code, HttpServletRequest rq) {
		
		String u_id = (String) rq.getSession().getAttribute("u_id");
		String lqa_title = rq.getParameter("lqa_title");
		String lqa_content = rq.getParameter("lqa_content");
		
		System.out.println(lqa_title + lqa_content + l_code);
		if(u_id == null) {
			
			return 0;
		}else {
			
			return 1;
		}
	}
	
	@PostMapping(value = "/LectureReviewWrite.do")
	@ResponseBody
	public int LectureReview(@RequestParam(name = "l_code")String l_code, HttpServletRequest rq) {
		
		String u_id = (String) rq.getSession().getAttribute("u_id");
		String lr_title = rq.getParameter("lr_title");
		String lr_content = rq.getParameter("lr_content");
		
		System.out.println("title = " + lr_title + "content = "+lr_content + "l code = "+l_code);
		if(u_id == null) {
			
			return 0;
		}else {
			
			return 1;
		}
	}
}
