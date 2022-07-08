package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

import com.learning.User.DAO.*;
import com.learning.User.Form.*;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ULectureDAO lectureDAO;
	
	public List<UserAttendanceForm> RecentVideo(String u_id){
		
		return userDAO.RecentVideo(u_id);
	}
	
	public List<LectureForm> RegistedLecture(String u_id){
		
		List<LectureForm> ResistedLecture = userDAO.RegistedLecture(u_id);
		
		List<LectureForm> lectureList = null;
		List<LectureForm> userLecture = null;
		if(ResistedLecture == null) {
			
			return null;
		}else {
			
			lectureList = lectureDAO.LectureList();
			userLecture = new ArrayList<LectureForm>();
			
			for(LectureForm lectureform : lectureList) {
				for(LectureForm regiform : ResistedLecture) {
					
					if(lectureform.getL_code().equals(regiform.getL_code())) {
						
						userLecture.add(lectureform);
					}
				}
			}

			return userLecture;
		}
		
	}
}
