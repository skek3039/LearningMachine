package com.learning.Admin.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.BannedDTO;
import com.learning.DTO.userDTO;
import com.learning.User.DTO.ULectureDTO;

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

	public List<String> studentBanList() {
		return sqlSession.selectList("Admin.studentBanList");
	}

	public List<userDTO> teacherSearch(String t_nickname) {
		return sqlSession.selectList("Admin.teacherSerch", t_nickname);
	}

	public List<String> refundList() {
		return sqlSession.selectList("Admin.refundList");
	}

	public List<String> admin_lectureRequest(String la_no) {
		return sqlSession.selectList("Admin.lectureRequest",la_no);
	}
	public List<String> teachervideo(String t_nickname) {
		return sqlSession.selectList("Admin.teachervideo");
	}

	public List<String> teacherBanList() {
		return sqlSession.selectList("Admin.teacgerBanList");
	}

	public int lecture_refund(String p_no, String u_id) {
		sqlSession.delete("Admin.lecture_refund1",p_no);
		return sqlSession.update("Admin.lecture_refund", p_no);
	}

	public int lectureGet(ULectureDTO dto ) {
		
		return sqlSession.insert("Admin.lectureGet",dto);
	}

	public void lectureGet1(String la_no) {
		sqlSession.update("Admin.lectureGet2",la_no);				
	}
	public void lectureGet2(String la_no) {
		sqlSession.update("Admin.lectureGet3",la_no);
	}

}
