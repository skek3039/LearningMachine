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
		return sqlSession.selectOne("lecture.totalCount");
	}

	public int totalCount1() {
		return sqlSession.selectOne("lecture.totalCount1");
	}

	public List<String> lectureCate() {
		return sqlSession.selectList("lecture.cate");
	}

	public LectureDTO lecture_lookup(LectureDTO lecture_lookup) {
		return sqlSession.selectOne("lecture.lecture_Lookup", lecture_lookup);
	}

	public Object lecture_lookup2(LectureDTO lecture_lookup) {
		return sqlSession.selectOne("lecture.lecture_Lookup2", lecture_lookup);
	}

	public int totalCount2() {
		return sqlSession.selectOne("lecture.totalCount2");
	}

	public List<LectureDTO> lecture_refusal(Map<String, Object> map) {
		return sqlSession.selectList("lecture.lecture_refusal", map);
	}

	public int lecture_update_write(LectureDTO lecture_update_write) {
		sqlSession.update("lecture.lecture_update_recognize",lecture_update_write);
		return sqlSession.update("lecture.lecture_update_write", lecture_update_write);
	}

	public Object lecture_update(LectureDTO lecture_update) {
		return sqlSession.selectOne("lecture.lecture_update", lecture_update);
	}







}
