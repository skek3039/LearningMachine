package com.learning.User.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.learning.User.DTO.*;
import com.learning.User.Form.*;

@Repository
public class ULectureDAO {

	private final String namespace = "ULectureMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<LectureForm> popLecture(){
		
		return sqlSession.selectList(namespace + ".popLecture");
	}
	
}
