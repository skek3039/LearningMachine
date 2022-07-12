package com.learning.Teacher.Service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.DTO.PageDTO;
import com.learning.Teacher.DAO.LectureDAO;


@Service
public class LectureService {

	@Autowired
	private LectureDAO lectureDAO;
	public List<LectureDTO> lectureApplyList(String u_id) {
		return lectureDAO.lectureApplyList(u_id);
	}
	
	public List<LectureDTO> lectureList(String u_id){
		return lectureDAO.lectureList(u_id);
	}
	

	public int lecture_request(LectureDTO lecture_request) {
		return lectureDAO.lecture_request(lecture_request);
	}

	public List<LectureDTO> letureNameSearch(String l_name) {
		return lectureDAO.letureNameSearch(l_name);
	}

	public int totalCount() {
		return lectureDAO.totalCount();
	}


	
}
