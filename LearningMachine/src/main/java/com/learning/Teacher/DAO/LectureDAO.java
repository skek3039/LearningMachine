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
	
	public List<LectureDTO> lectureList(String u_id){
		System.out.println("??");
		return sqlSession.selectList("Teacher.lectureList",u_id);
	}

}
