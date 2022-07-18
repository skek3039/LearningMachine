package com.learning.Teacher.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.LectureDTO;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<LectureDTO> qnaList() {
		return sqlSession.selectList("QnA.qnaList");
	}

	public int qnalistCount() {
		return sqlSession.selectOne("QnA.qnalistCount");
	}

	public LectureDTO qna_reply(LectureDTO qna_reply) {
		return sqlSession.selectOne("QnA.qna_reply", qna_reply);
	}

	public int qna_reply2(LectureDTO qna_reply2) {
		sqlSession.update("QnA.lqa_confirm", qna_reply2);
		return sqlSession.insert("QnA.qna_reply2", qna_reply2);
	}

	public Object qna_detail(LectureDTO qna_detail) {
		return sqlSession.selectOne("QnA.qna_detail", qna_detail);
	}

	public int totalCount() {
		return sqlSession.selectOne("QnA.totalCount");
	}

	public List<LectureDTO> qna_answer(Map<String, Object> map) {
		return sqlSession.selectList("QnA.qna_answer", map);
	}

	

	

}
