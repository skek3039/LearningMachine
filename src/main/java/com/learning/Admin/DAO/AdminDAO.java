package com.learning.Admin.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.userDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<userDTO> userList() {
		return sqlSession.selectList("Admin.userList");
	}

	public List<userDTO> userSearch(String u_name) {
		return sqlSession.selectList("Admin.userSearch",u_name);
	}

	public List<String> studentLecture(String u_id) {
		return sqlSession.selectList("Admin.studentLecture", u_id);
	}

	public List<String> studentReport(String u_id) {
		return sqlSession.selectList("Admin.studentReport",u_id);
	}

}
