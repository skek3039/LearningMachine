package com.learning.Teacher.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.LectureDTO;

@Repository
public class LectureDAO {
	
	@Autowired
	private SqlSession sqlSession;
	public List<LectureDTO> lectureApplyList(Map<String, Object> map) {
		return sqlSession.selectList("lecture.t_lectureApplyList",map);
	}
	
	public List<LectureDTO> lectureList(Map<String, Object> map){
		return sqlSession.selectList("lecture.t_lectureList",map);
	}

	public int lecture_request(LectureDTO lecture_request) {
		return sqlSession.insert("lecture.t_lecture_request", lecture_request);
	}

	public List<LectureDTO> letureNameSearch(String l_name) {
		return sqlSession.selectList("lecture.t_letureNameSearch", l_name);
	}

	public int totalCount() {
		return sqlSession.selectOne("lecture.totlaCount");
	}

	public int totalCount1() {
		return sqlSession.selectOne("lecture.totlaCount1");
	}

	public List<String> lectureCate() {
		return sqlSession.selectList("lecture.cate");
	}

	public LectureDTO lecture_lookup(LectureDTO lecture_lookup) {
		return sqlSession.selectOne("lecture.lecture_Lookup", lecture_lookup);
	}





}
