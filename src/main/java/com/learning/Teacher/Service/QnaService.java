package com.learning.Teacher.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.DAO.QnaDAO;

@Service
public class QnaService {
	@Autowired QnaDAO qnaDAO;
	
	public List<LectureDTO> qnalist() {
		return qnaDAO.qnaList();
	}

	public int qnalistCount() {
		return qnaDAO.qnalistCount();
	}



}
