	package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.learning.User.Service.ULectureService;
import com.learning.User.Service.UserService;

import java.util.*;
import com.learning.User.Form.*;

@Controller
public class ULectureController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ULectureService lectureService;

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
	public String lectureDetail(@RequestParam(name = "l_code") String l_code, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");

		rq.setAttribute("LectureDetail", lectureService.LectureDetail(u_id, l_code));
		rq.setAttribute("LectureQnas", lectureService.LuectureQnas(u_id, l_code));
		rq.setAttribute("LectureVideos", lectureService.LectureVideos(l_code));
		rq.setAttribute("RecentVideo", userService.RecentLectureVideo(u_id, l_code)); //해당 강의 최근 동영상(v_no)
		
		return "user/LectureDetail";
	}

	@GetMapping(value = "/LectureVideo")
	public String lectureVideo(@RequestParam(name = "v_no") int v_no, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String l_code = lectureService.CheckLectureRegister(v_no);
		//n번째 동영상(미리보기 3개를 위해 key값이 1부터 올라가는 값을 파라미터로 받음)
		int order = (rq.getParameter("order") != null)?Integer.parseInt(rq.getParameter("order")):0;
		Map<Integer, VideoForm> Videos = null;
		VideoForm form = null;
		
		if (l_code == null) {

			return "redirect:/404";

		} else if (u_id != null && lectureService.RegisterVideo(l_code, u_id) == 1) {

			Videos = lectureService.LectureVideos(l_code);
			try {
				if(order > 0) {
					UserAttendanceForm UAForm = new UserAttendanceForm();
					UAForm.setV_no(v_no);
					UAForm.setU_id(u_id);
					UAForm.setL_code(l_code);
					userService.LectureVideoAttendance(UAForm);
					rq.setAttribute("LectureVideos", lectureService.LectureVideos(l_code));
					rq.setAttribute("Video", Videos.get(order));
				}else {
					
					for(int i = 0; i < Videos.size(); i++) {
						
						form = Videos.get(i + 1);
						if(form.getV_no() == v_no) {
							
							rq.setAttribute("Video", form);
							break;
						}
					}
				}
			}catch(Exception e){
				
				return "redirect:/404";
			}
			return "user/video";
		} else {

			Videos = lectureService.LectureVideos(l_code);
			
			if(order > 3) {
				
				return "redirect:/Pay?l_code=" + l_code;
			}else {
				try {
					
					rq.setAttribute("LectureVideos", lectureService.LectureVideos(l_code));
					rq.setAttribute("Video", Videos.get(order));
				}catch(Exception e){
					
					return "redirect:/404";
				}
			}
			return "user/video";
		}
	}
}
