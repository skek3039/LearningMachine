package com.learning.Admin.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.NoticeDTO;
import com.learning.DTO.PageDTO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	
	public List<NoticeDTO> list(PageDTO page) {
		return sqlSession.selectList("notice.notice",page);
	}

	public NoticeDTO noticedetail(int n_no) {
		return sqlSession.selectOne("notice.noticedetail",n_no);
	}

	public int totalCount(int n_cate) {
		return sqlSession.selectOne("notice.totalCount",n_cate);
	}


}
