package com.learning.Teacher.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.DAO.LectureDAO;


@Service
public class LectureService {

	@Autowired
	private LectureDAO lectureDAO;
	
	public List<LectureDTO> lectureList(String u_id){
		return lectureDAO.lectureList(u_id);
	}
}
