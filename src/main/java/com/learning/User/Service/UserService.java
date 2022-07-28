package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.*;

import com.learning.User.DAO.*;
import com.learning.User.Form.*;
import com.learning.utill.Util;
import com.learning.DTO.*;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private ULectureDAO lectureDAO;

	public userDTO UserInfo(String u_id) {
		
		return userDAO.UserInfo(u_id);
	}
	
	public List<UserAttendanceForm> RecentVideo(String u_id) throws ParseException {

		List<UserAttendanceForm> list = userDAO.RecentVideo(u_id);

		for (UserAttendanceForm form : list) {

			form.setVa_date(Util.YMD(form.getVa_date()));
		}
		return list;
	}

	public List<ULectureForm> RegistedLecture(String u_id) {

		List<ULectureForm> ResistedLecture = userDAO.RegistedLecture(u_id);

		List<ULectureForm> lectureList = null;
		List<ULectureForm> userLecture = null;
		if (ResistedLecture == null) {

			return null;
		} else {

			lectureList = lectureDAO.LectureList();
			userLecture = new ArrayList<ULectureForm>();

			for (ULectureForm lectureform : lectureList) {
				for (ULectureForm regiform : ResistedLecture) {

					if (lectureform.getL_code().equals(regiform.getL_code())) {

						lectureform.setAttendance_rate(regiform.getAttendance_rate());
						userLecture.add(lectureform);
					}
				}
			}

			return userLecture;
		}

	}

	public int RecentLectureVideo(String u_id, String l_code) {

		UserAttendanceForm form = new UserAttendanceForm();
		form.setU_id(u_id);
		form.setL_code(l_code);

		return userDAO.RecentLectureVideo(form);

	}
	
	public void LectureVideoAttendance(UserAttendanceForm form) {
		String result = userDAO.CheckAttendance(form);

		if(result == null) {
			
			userDAO.UserAttendanceInsert(form);
		}else{
			
			userDAO.UpdateVideoAttendance(form);
		}
	}

	public int CheckLectureRegist(String u_id, String l_code) {

		URegiForm form = new URegiForm();
		form.setU_id(u_id);
		form.setL_code(l_code);
		
		return userDAO.CheckLectureRegist(form);
	}
	
	public int CheckLectureReview(String u_id, String l_code) {
		
		ULectureReviewForm form = new ULectureReviewForm();
		
		form.setU_id(u_id);;
		form.setL_code(l_code);
		
		return userDAO.CheckLectureReview(form);
	}
	
	public int CheckLectureQnaCount(String u_id, String l_code) {
		
		ULectureQnaForm form = new ULectureQnaForm();
		
		form.setU_id(u_id);
		form.setL_code(l_code);
		
		return userDAO.CheckLectureQnaCount(form);
	}
}





















