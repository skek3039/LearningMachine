package com.learning.Common.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.learning.DTO.*;

@Repository
public class MessageDAO {

	private final String namespace = "MessageMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MessageDTO> RecentMessage(String u_id){
		
		return sqlSession.selectList(namespace + ".RecentMessage",u_id);
	}
}
