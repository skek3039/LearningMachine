package com.learning.Teacher.Service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DTO.LectureDTO;
import com.learning.Teacher.DAO.Video_QnaDAO;

@Service
public class Video_QnaService {
	
	@Autowired
	private Video_QnaDAO video_qnaDAO;

	public List<LectureDTO> video_qnaList(Map<String, Object> map) {
		return video_qnaDAO.video_qnaList(map);
	}

	public int video_qna(LectureDTO video_qna) {
		return video_qnaDAO.video_qna(video_qna);
	}

	public int totalCount() {
		return video_qnaDAO.totalCount();
	}


	

}
