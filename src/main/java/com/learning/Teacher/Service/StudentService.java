package com.learning.Teacher.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.DAO.StudentDAO;

@Service
public class StudentService {
	
	@Autowired
	private StudentDAO studentDAO;

	public List<LectureDTO> lectureList(Map<String, Object> map) {
		return studentDAO.lectureList(map);
	}
	
	
	 public List<String> studentList(String t_id){ 
		 return studentDAO.studentList(t_id); 
	}

	public List<LectureDTO> lectureNameSearch(String l_name) {
		return studentDAO.lectureNameSearch(l_name);
	}


	public int totalCount() {
		return studentDAO.totalCount();
	}
	 
}
