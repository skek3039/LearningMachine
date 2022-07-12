package com.learning.Teacher.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.DAO.Video_QnaDAO;

@Service
public class Video_QnaService {
	
	@Autowired
	private Video_QnaDAO video_qnaDAO;

	public List<LectureDTO> video_qnaList() {
		return video_qnaDAO.video_qnaList();
	}

	

}
