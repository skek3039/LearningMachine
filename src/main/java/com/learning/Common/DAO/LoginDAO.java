package com.learning.Common.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.learning.DTO.TeacherDTO;
import com.learning.DTO.userDTO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSession sqlSession;
	public userDTO login(userDTO dto) {
		return sqlSession.selectOne("Login.login", dto);
	}
	public int join(userDTO dto) {
		return sqlSession.insert("Login.join", dto);
	}
	public int checkID(String u_id) {
		return sqlSession.selectOne("Login.checkID", u_id);
	}
	public ModelAndView ModelAndView(String email) {
		return sqlSession.selectOne("Login.ModelAndView", email);
	}
	public int forgotPW(userDTO user) {
		return sqlSession.selectOne("Login.Check", user);
	}
	public int resetPw(userDTO user) {
		return sqlSession.update("Login.resetPw", user);
	}
	public int checkEmail(String u_email) {
		return sqlSession.selectOne("Login.checkEmail", u_email);
	}
	public int checkNickname(String u_nickname) {
		return sqlSession.selectOne("Login.checkNickname", u_nickname);
	}
	public int join2(userDTO dto) {
		return sqlSession.insert("Login.join2", dto);
	}
	public int join3(TeacherDTO dto1) {
		return sqlSession.insert("Login.join3", dto1);
	}
	public int myDrop(String u_id) {
		return sqlSession.update("Login.myDrop",u_id);
	}
	public String find_id(String u_email) throws Exception{
		return sqlSession.selectOne("Login.find_id", u_email);
	}
}
