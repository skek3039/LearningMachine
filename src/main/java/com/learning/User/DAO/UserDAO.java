package com.learning.User.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.User.Form.LectureForm;
import com.learning.User.Form.UserAttendanceForm;

@Repository
public class UserDAO {

	private final String namespace = "UserMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserAttendanceForm> RecentVideo(String u_id) {
		
		return sqlSession.selectList(namespace + ".RecentVideo", u_id);
	}

	public List<LectureForm> RegistedLecture(String u_id){
		
		return sqlSession.selectList(namespace + ".RegistedLecture", u_id);
	}
}
