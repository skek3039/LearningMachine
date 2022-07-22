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

	public NoticeDTO noticedetail(NoticeDTO detail) {
		return sqlSession.selectOne("notice.noticedetail",detail);
	}

	public int totalCount(int n_cate) {
		return sqlSession.selectOne("notice.totalCount",n_cate);
	}

	public int noticecountUp(int n_no) {
		return sqlSession.update("notice.noticecountUp",n_no);
	}

	public int noticeWrite(NoticeDTO noticeWrite) {
		return sqlSession.insert("notice.noticeWrite", noticeWrite);
	}

	public NoticeDTO faq(NoticeDTO faq) {
		return (NoticeDTO) sqlSession.selectList("notice.faq", faq);
	}

	public List<NoticeDTO> faq(PageDTO page) {
		return sqlSession.selectList("notice.faq",page);
	}

	public int faqWrite(NoticeDTO faq) {
		return sqlSession.insert("notice.faqWrite", faq);
	}

	public NoticeDTO faqdetail(NoticeDTO faqdetail) {
		return sqlSession.selectOne("notice.faqdetail",faqdetail);
	}



}
