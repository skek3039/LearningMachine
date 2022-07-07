package com.learning.Common.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.userDTO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSession sqlSession;
	public userDTO login(userDTO dto) {
		return sqlSession.selectOne("Login.login", dto);
	}
}
