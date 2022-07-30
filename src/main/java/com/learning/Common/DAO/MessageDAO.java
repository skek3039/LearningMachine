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
	
	public List<MessageDTO> ChattingRoom(MessageDTO dto){
		
		return sqlSession.selectList(namespace + ".ChattingRoom", dto);
	}
	
	public int ReadMessage(MessageDTO dto) {
		
		return sqlSession.update(namespace + ".ReadMessage", dto);
	}
	
	public String CheckMessageWriter(int le_no) {
		
		return sqlSession.selectOne(namespace + ".CheckMessageWriter", le_no);
	}
	
	public int DeleteMessage(int le_no) {
		
		return sqlSession.update(namespace + ".DeleteMessage", le_no);
	}
}
