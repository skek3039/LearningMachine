package com.learning.Common.Service;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.learning.Common.DAO.MessageDAO;
import com.learning.DTO.MessageDTO;
import com.learning.utill.Util;

@Service
public class MessageService {

	@Autowired
	private MessageDAO messageDAO;
	
	//최근에 메시지가 온 채팅방(사람과의 대화방) 리스트
	public List<MessageDTO> RecentMessage(String u_id) throws ParseException{
		
		List<MessageDTO> list = messageDAO.RecentMessage(u_id);
		
		for(MessageDTO mDTO : list) {
			
			mDTO.setLe_date(Util.YMDHM(mDTO.getLe_date()));
		}
		
		return list;
	}

	//특정인(from_id)과의 대화 내용들리스트
	
	
	
	//메시지 삭제
}