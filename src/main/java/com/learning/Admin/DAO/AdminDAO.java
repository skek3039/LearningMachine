package com.learning.Admin.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.BannedDTO;
import com.learning.DTO.TeacherDTO;
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

	public int report(BannedDTO dto) {
		return sqlSession.insert("Admin.report",dto);
	}

	public void user_report(String u_id) {
		sqlSession.update("Admin.userReport",u_id);
	}

	public void back(String u_id) {
		sqlSession.update("Admin.back",u_id);
		sqlSession.delete("Admin.backdelete", u_id);
	}

	public List<String> teacherList() {
		return sqlSession.selectList("Admin.teacherList");
	}

}
