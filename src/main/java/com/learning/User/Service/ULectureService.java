package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.ULectureDAO;
import com.learning.User.DAO.UserDAO;

import java.util.*;
import com.learning.User.Form.*;

@Service
public class ULectureService {

	@Autowired
	private ULectureDAO lectureDAO;

	@Autowired
	private UserDAO userDAO;

	public List<LectureForm> PopularLectureList(String u_id) {

		List<LectureForm> LectureList = lectureDAO.LectureList();
		if (u_id == null) {

			return LectureList;
		} else {
			List<LectureForm> RegistedList = userDAO.RegistedLecture(u_id);

			for (LectureForm lectureform : LectureList) {

				for (LectureForm registedform : RegistedList) {

					if (lectureform.getL_code().equals(registedform.getL_code())) {

						lectureform.setPayment_whether(1);
					}
				}
			}

			return LectureList;
		}
	}

	public List<LectureForm> RecentLectureList(String u_id) {

		List<LectureForm> LectureList = lectureDAO.LectureList();
		if (u_id == null) {

			return LectureList;
		} else {
			List<LectureForm> RegistedList = userDAO.RegistedLecture(u_id);

			for (LectureForm lectureform : LectureList) {

				for (LectureForm registedform : RegistedList) {

					if (lectureform.getL_code().equals(registedform.getL_code())) {

						lectureform.setPayment_whether(1);
					}
				}
			}

			
			
			return LectureList;
		}
	}
}
