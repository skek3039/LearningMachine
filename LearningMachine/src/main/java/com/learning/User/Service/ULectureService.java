package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.ULectureDAO;
import java.util.*;
import com.learning.User.Form.*;

@Service
public class ULectureService {

	@Autowired
	private ULectureDAO lectureDAO;
	
	public List<LectureForm> popLecture(){
		 
		return lectureDAO.popLecture();
	}
}
