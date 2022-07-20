package com.learning.Teacher.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.LectureDTO;

@Repository
public class StudentDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<LectureDTO> lectureList(Map<String, Object> map) {
		return sqlSession.selectList("student.student_lectureList", map);
	}
	
	public List<String> studentList(Map<String, Object> map) {
		return sqlSession.selectList("student.studentList",map);
	}

	public List<LectureDTO> lectureNameSearch(String l_name) {
		return sqlSession.selectList("student.searchList", l_name);
	}

	public int totalCount(String name) {
		return sqlSession.selectOne("student.totalCount",name);
	}

	public int stulistCount() {
		return sqlSession.selectOne("student.stulistCount");
	}
	 
}
