package com.learning.Admin.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.FaqDTO;

@Repository
public class FaqDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<FaqDTO> faqList() {
		return sqlSession.selectList("Faq.faqList");
	}

}
