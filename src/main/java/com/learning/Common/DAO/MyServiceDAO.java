package com.learning.Common.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyServiceDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<String> myLectureList(String u_id) {
		return sqlSession.selectList("MyService.myLectureList",u_id);
	}

	public List<String> myInfo(String u_id) {
		return sqlSession.selectList("MyService.myInfo",u_id);
	}
}
