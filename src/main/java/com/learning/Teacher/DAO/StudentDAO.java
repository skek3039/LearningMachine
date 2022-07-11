package com.learning.Teacher.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.LectureDTO;

@Repository
public class StudentDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<LectureDTO> lectureList(String u_id) {
		return sqlSession.selectList("student.student_lectureList", u_id);
	}
	
	
	public List<String> studentList(String t_id) {
		return sqlSession.selectList("student.studentList",t_id);
	}
	 
}
