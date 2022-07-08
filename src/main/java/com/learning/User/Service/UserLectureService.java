package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.UserLectureDAO;
import java.util.*;
import com.learning.User.Form.*;

@Service
public class UserLectureService {

	@Autowired
	private UserLectureDAO lectureDAO;
	
	public List<LectureForm> popLecture(){
		 
		return lectureDAO.popLecture();
	}
}
