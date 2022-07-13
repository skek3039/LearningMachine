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

	public List<LectureDTO> video_qnaDetail(String vq_no) {
		return video_qnaDAO.video_qnaDetail(vq_no);
	}

	public List<LectureDTO> video_answer(Map<String, Object> map) {
		return video_qnaDAO.video_answer(map);
	}

	public List<LectureDTO> qna_answer_detail(String vq_no) {
		return video_qnaDAO.qna_answer_detail(vq_no);
	}

	public List<LectureDTO> v_qna_update(String vq_no) {
		return video_qnaDAO.v_qna_update(vq_no);
	}

	public int v_qna_write(LectureDTO v_qna_write) {
		return video_qnaDAO.v_qna_write(v_qna_write);
	}






	

}
