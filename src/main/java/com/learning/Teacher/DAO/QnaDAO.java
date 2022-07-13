package com.learning.Teacher.DAO;

import java.util.List;

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

}
