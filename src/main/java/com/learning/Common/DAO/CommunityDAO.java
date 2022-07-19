package com.learning.Common.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.LectureDTO;
import com.learning.DTO.PageDTO;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int totalCount(String name) {
		return sqlSession.selectOne("Community.totalCount",name);
	}

	public List<String> qnaList(PageDTO page) {
		return sqlSession.selectList("Community.qnaList",page);
	}

}
