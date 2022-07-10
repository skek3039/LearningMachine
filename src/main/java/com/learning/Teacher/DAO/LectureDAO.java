package com.learning.Teacher.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.LectureDTO;

@Repository
public class LectureDAO {
	
	@Autowired
	private SqlSession sqlSession;
	public List<LectureDTO> lectureApplyList(String u_id) {
		return sqlSession.selectList("Teacher.lectureApplyList",u_id);
	}
	
	public List<LectureDTO> lectureList(String u_id){
		return sqlSession.selectList("Teacher.lectureList",u_id);
	}

	public int lecture_request(LectureDTO lecture_request) {
		return sqlSession.insert("Teacher.lecture_request", lecture_request);
	}


}
