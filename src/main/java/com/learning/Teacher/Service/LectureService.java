package com.learning.Teacher.Service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.DTO.PageDTO;
import com.learning.Teacher.DAO.LectureDAO;


@Service
public class LectureService {

	@Autowired
	private LectureDAO lectureDAO;
	public List<LectureDTO> lectureApplyList(Map<String, Object> map) {
		return lectureDAO.lectureApplyList(map);
	}
	
	public List<LectureDTO> lectureList(Map<String, Object> map){
		return lectureDAO.lectureList(map);
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

	public int totalCount1() {
		return lectureDAO.totalCount1();
	}

	public List<String> lectureCate() {
		return lectureDAO.lectureCate();
	}

	public LectureDTO lecture_lookup(LectureDTO lecture_lookup) {
		return lectureDAO.lecture_lookup(lecture_lookup);
	}

	public Object lecture_lookup2(LectureDTO lecture_lookup) {
		return lectureDAO.lecture_lookup2(lecture_lookup);
	}

	public int totalCount2() {
		return lectureDAO.totalCount2();
	}

	public List<LectureDTO> lecture_refusal(Map<String, Object> map) {
		return lectureDAO.lecture_refusal(map);
	}

	public int lecture_update_write(LectureDTO lecture_update_write) {
		return lectureDAO.lecture_update_write(lecture_update_write);
	}

	public Object lecture_update(LectureDTO lecture_update) {
		return lectureDAO.lecture_update(lecture_update);
	}

	public int lecture_delete(LectureDTO lecture_delete) {
		return lectureDAO.lecture_delete(lecture_delete);
	}

	public Object lecture_update2(LectureDTO lecture_update2) {
		return lectureDAO.lecture_update2(lecture_update2);
	}

	public int lecture_update_write2(LectureDTO lecture_update_write2) {
		return lectureDAO.lecture_update_write2(lecture_update_write2);
		
	}












	
}
