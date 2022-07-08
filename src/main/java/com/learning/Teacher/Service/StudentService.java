package com.learning.Teacher.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.DAO.StudentDAO;

@Service
public class StudentService {
	
	@Autowired
	private StudentDAO studentDAO;

	public List<LectureDTO> lectureList() {
		return studentDAO.lectureList();
	}
	
	
	 public List<String> studentList(String t_id){ 
		 return studentDAO.studentList(t_id); 
	}
	 
}
