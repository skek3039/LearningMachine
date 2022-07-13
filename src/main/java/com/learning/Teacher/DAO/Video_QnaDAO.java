package com.learning.Teacher.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.LectureDTO;

@Repository
public class Video_QnaDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<LectureDTO> video_qnaList(Map<String, Object> map) {
		return sqlSession.selectList("video_qna.t_video_qnaList",map);
	}

	public int video_qna(LectureDTO video_qna) {
		sqlSession.update("video_qna.t_video_confirm",video_qna);
		return sqlSession.insert("video_qna.t_video_qna", video_qna);
	}

	public int totalCount() {
		return sqlSession.selectOne("video_qna.totalCount");
	}

}
