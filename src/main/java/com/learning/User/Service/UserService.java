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
}
