package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.ULectureDAO;
import com.learning.User.DAO.UserDAO;

import java.util.*;
import com.learning.User.Form.*;
import com.learning.utill.LectureListComparator;

@Service
public class ULectureService {

	@Autowired
	private ULectureDAO lectureDAO;

	@Autowired
	private UserDAO userDAO;
	
	public List<LectureForm> PopularLectureList(String u_id) {

		List<LectureForm> LectureList = lectureDAO.LectureList();// 기본적으로 인기순으로 강의가져옴
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
		
		//lectureListComparator 객체에서 override를 통해 LectureForm의 l_date로 정렬
		//최신순서대로 정렬 됨
		Collections.sort(LectureList, new LectureListComparator()); 
		
		
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
