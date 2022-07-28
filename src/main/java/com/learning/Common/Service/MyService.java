package com.learning.Common.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Common.DAO.MyServiceDAO;

@Service
public class MyService {
	@Autowired
	private MyServiceDAO myServiceDAO;

	public List<String> myLectureList(String u_id) {
		return myServiceDAO.myLectureList(u_id);
	}

	public List<String> myInfo(String u_id) {
		return myServiceDAO.myInfo(u_id);
	}
	
}
