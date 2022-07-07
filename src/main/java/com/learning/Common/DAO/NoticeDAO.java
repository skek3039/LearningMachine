package com.learning.Common.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.NoticeDTO;
import com.learning.DTO.userDTO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	/*
	 * public List<userDTO> write(userDTO dto) { return
	 * sqlSession.selectList("notice.write", write); }
	 */
	public List<NoticeDTO> list() {
		return sqlSession.selectList("notice.notice");
	}


}
