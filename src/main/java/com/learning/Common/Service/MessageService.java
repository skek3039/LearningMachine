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
	
	public List<MessageDTO> RecentMessage(String u_id) throws ParseException{
		
		List<MessageDTO> list = messageDAO.RecentMessage(u_id);
		
		for(MessageDTO mDTO : list) {
			
			mDTO.setLe_date(Util.YMDHM(mDTO.getLe_date()));
		}
		
		return list;
	}
	
}
