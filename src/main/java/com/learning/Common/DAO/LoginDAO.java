package com.learning.Common.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

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
	public userDTO forgotPW(userDTO user) {
		return sqlSession.selectOne("Login.Check", user);
	}
	public int resetPw(userDTO user) {
		return sqlSession.update("Login.resetPw", user);
	} 
}
