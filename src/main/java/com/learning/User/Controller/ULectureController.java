package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.learning.User.Service.ULectureService;
import com.learning.User.Service.UserService;
import com.learning.utill.*;

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
	public String lectureDetail(@RequestParam(name = "l_code") String l_code, HttpServletRequest rq)
			throws ParseException {

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
				videoform.setPay_whether(1);
				
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

				return "redirect:/Pay?l_code=" + l_code; // payment컨트롤러에서 유저확인 후 로그인 보낼지 확인
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

	@PostMapping(value = "/LectureReviewWrite.do")
	@ResponseBody
	public int LectureReview(@RequestParam(name = "l_code") String l_code, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String lr_title = null;
		String lr_content = null;
		String lr_grade = null;

		ULectureReviewForm lectureReviewForm = null;

		if (u_id == null) {
			System.out.println("로그인하셈");
			return 0;
		} else {
			
			if (userService.CheckLectureReview(u_id, l_code) == 1) {

				return 2;
			} else {
				if (userService.CheckLectureRegist(u_id, l_code) == 1) {

					lr_title = rq.getParameter("lr_title");
					lr_content = rq.getParameter("lr_content");
					lr_grade = rq.getParameter("lr_grade");

					lectureReviewForm = new ULectureReviewForm();

					lectureReviewForm.setU_id(u_id);
					lectureReviewForm.setLr_title(Util.html(lr_title));
					lectureReviewForm.setLr_content(lr_content);
					lectureReviewForm.setL_code(l_code);
					lectureReviewForm.setLr_grade(lr_grade);

					return lectureService.InsertLectureReview(lectureReviewForm);
				} else {

					return 0;
				}
			}
		}
	}

	@RequestMapping(value = "/LectureQnaWrite.do")
	@ResponseBody
	public int LectureQnA(@RequestParam(name = "l_code") String l_code, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String lqa_title = null;
		String lqa_content = null;

		ULectureQnaForm qnaform = null;
		if (u_id == null) {

			return 0;
		} else {
			if (userService.CheckLectureQnaCount(u_id, l_code) >= 3) {

				return 2;
			} else {
				lqa_title = rq.getParameter("lqa_title");
				lqa_content = rq.getParameter("lqa_content");
				qnaform = new ULectureQnaForm();

				qnaform.setU_id(u_id);
				qnaform.setL_code(l_code);
				qnaform.setLqa_title(Util.html(lqa_title));
				qnaform.setLqa_content(lqa_content);

				return lectureService.InsertLectureQnA(qnaform);
			}
		}
	}

	@RequestMapping(value = "/LectureReviewEdit.do")
	@ResponseBody
	public int LectureReviewEdit(@RequestParam(name = "l_code") String l_code, HttpServletRequest rq) {

		String s_id = (String) rq.getSession().getAttribute("u_id");
		String u_id = rq.getParameter("u_id");
		String lr_title = null;
		String lr_content = null;
		ULectureReviewForm lectureReviewForm = null;

		if (s_id == null || s_id == null || !s_id.equals(u_id)) {

			return 0;
		} else {

			lr_title = rq.getParameter("lr_title");
			lr_content = rq.getParameter("lr_content");

			if (lr_title.equals("") || lr_title == null || lr_content.equals("") || lr_content == null)
				return 2;
			else {
				lectureReviewForm = new ULectureReviewForm();

				lectureReviewForm.setU_id(s_id);
				lectureReviewForm.setL_code(l_code);
				lectureReviewForm.setLr_title(Util.html(lr_title));
				lectureReviewForm.setLr_content(lr_content);

				return lectureService.EditLectureReview(lectureReviewForm);
			}
		}
	}

	@RequestMapping(value = "/LectureReviewRemove.do")
	@ResponseBody
	public int LectureReviewRemove(@RequestParam(name = "l_code") String l_code, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");

		return lectureService.RemoveLectureReview(u_id, l_code);
	}

	@RequestMapping(value = "/LectureQnaEdit.do")
	@ResponseBody
	public int LectureQnaEdit(@RequestParam(name = "lqa_no") int lqa_no, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String lqa_title = null;
		String lqa_content = null;

		ULectureQnaForm lectureQnaForm = null;

		if (u_id == null) {

			return 0;
		} else {

			lqa_title = rq.getParameter("lqa_title");
			lqa_content = rq.getParameter("lqa_content");
			lectureQnaForm = new ULectureQnaForm();

			lectureQnaForm.setLqa_no(lqa_no);
			lectureQnaForm.setU_id(u_id);
			lectureQnaForm.setLqa_title(Util.html(lqa_title));
			lectureQnaForm.setLqa_content(lqa_content);

			return lectureService.UpdateLectureQna(lectureQnaForm);
		}
	}

	@RequestMapping(value = "/LectureQnaRemove.do")
	@ResponseBody
	public int LectureQnaRemove(@RequestParam(name = "lqa_no") int lqa_no, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");

		if (u_id == null) {

			return 0;
		} else {

			return lectureService.RemoveLectureQna(u_id, lqa_no);
		}
	}

	@RequestMapping(value = "/LectureVideoQnaWrite.do")
	public String LectureVideoQnaWrite(@RequestParam(name = "v_no") int v_no, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String vq_title = null;
		String vq_content = null;
		ULectureVideoQnaForm lectureVideoQnaForm = null;
		if (u_id == null) {

			return "redirect:/login";
		} else {
			// 질문 입력값 조건(길이 및 null)문 삽입

			vq_title = rq.getParameter("vq_title");
			vq_content = rq.getParameter("vq_content");
			lectureVideoQnaForm = new ULectureVideoQnaForm();

			lectureVideoQnaForm.setU_id(u_id);
			lectureVideoQnaForm.setV_no(v_no);
			lectureVideoQnaForm.setVq_title(Util.html(vq_title));
			lectureVideoQnaForm.setVq_content(vq_content);

			lectureService.InsertLectureVideoQna(lectureVideoQnaForm);
			
			return "redirect:/LectureVideo?v_no=" + v_no;
		}
	}

	@RequestMapping(value = "/LectureVideoQnaEdit.do")
	@ResponseBody
	public int LectureVideoQnaEdit(@RequestParam(name = "vq_no") int vq_no, HttpServletRequest rq) {
		String u_id = (String) rq.getSession().getAttribute("u_id");
		String vq_title = null;
		String vq_content = null;

		ULectureVideoQnaForm lecturVideoQnaForm = null;
		if (u_id == null) {

			return 0;
		} else {

			vq_title = rq.getParameter("vq_title");
			vq_content = rq.getParameter("vq_content");
			lecturVideoQnaForm = new ULectureVideoQnaForm();

			lecturVideoQnaForm.setVq_no(vq_no);
			lecturVideoQnaForm.setU_id(u_id);
			lecturVideoQnaForm.setVq_title(Util.html(vq_title));
			lecturVideoQnaForm.setVq_content(vq_content);

			return lectureService.UpdateLectureVideoQna(lecturVideoQnaForm);
		}
	}

	@RequestMapping(value = "/LectureVideoQnaRemove.do")
	@ResponseBody
	public int LectureVideoQnaRemove(@RequestParam(name = "vq_no")int vq_no, HttpServletRequest rq) {
		
		String u_id = (String) rq.getSession().getAttribute("u_id");

		if (u_id == null) {

			return 0;
		} else {

			return lectureService.RemoveLectureVideoQna(u_id, vq_no);
		}
	}
}
