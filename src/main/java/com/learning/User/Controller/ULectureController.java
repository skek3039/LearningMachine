package com.learning.User.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.learning.User.Service.ULectureService;
import java.util.*;
import com.learning.User.Form.*;

@Controller
public class ULectureController {

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

		return "user/LectureDetail";
	}

	@GetMapping(value = "/LectureVideo")
	public String lectureVideo(@RequestParam(name = "v_no") int v_no, HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String l_code = lectureService.CheckLectureRegister(v_no);

		if (l_code == null) {

			return "redirect:/404";

		} else if (u_id != null && lectureService.RegisterVideo(l_code, u_id) == 1) {

		} else {

		}

		return "user/video";
	}
}
