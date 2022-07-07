package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.LectureDAO;
import java.util.*;
import com.learning.User.Form.*;

@Service
public class LectureService {

	@Autowired
	private LectureDAO lectureDAO;
	
	public List<LectureForm> popLecture(){
		 
		return lectureDAO.popLecture();
	}
}
