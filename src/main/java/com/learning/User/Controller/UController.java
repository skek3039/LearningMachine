package com.learning.User.Controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.learning.Common.Service.MessageService;
import com.learning.User.Form.ULectureForm;
import com.learning.User.Service.ULectureService;
import com.learning.User.Service.UserService;

@Controller
public class UController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ULectureService lectureService;
	
	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "/")
	public String index(HttpServletRequest rq) throws ParseException {
		

		String u_id = (String) rq.getSession().getAttribute("u_id");
		List<ULectureForm> popLecture = lectureService.PopularLectureList(u_id);
		
		for(int i=0;i<popLecture.size();i++) {
			popLecture.get(i).setL_curriculum(popLecture.get(i).getL_curriculum().replaceAll("<(.*?)>", ""));
		}
		rq.setAttribute("popLecture", popLecture);
		
		if (u_id != null) {
			
			rq.setAttribute("RecentVideo", userService.RecentVideo(u_id));
			rq.setAttribute("RecentMessage", messageService.RecentMessage(u_id));
			rq.setAttribute("RegistedLecture", userService.RegistedLecture(u_id)); //유저가 수강하는 강의 목록
			
			return "index";
		} else {
			return "index";
		}
	}
}
