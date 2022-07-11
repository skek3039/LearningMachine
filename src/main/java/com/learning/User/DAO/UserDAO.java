package com.learning.User.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.User.Form.LectureForm;
import com.learning.User.Form.URegiForm;
import com.learning.User.Form.UserAttendanceForm;

@Repository
public class UserDAO {

	private final String namespace = "UserMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserAttendanceForm> RecentVideo(String u_id) {
		
		return sqlSession.selectList(namespace + ".RecentVideo", u_id);
	}
	
	//내가 듣는 강의 목록
	public List<URegiForm> RegiList(String u_id){
		
		return sqlSession.selectList(namespace + ".RegistrationList", u_id);
	}
	
	//내가 듣는 강의와 정보들
	public List<LectureForm> RegistedLecture(String u_id){
		
		return sqlSession.selectList(namespace + ".RegistedLecture", u_id);
	}
}
