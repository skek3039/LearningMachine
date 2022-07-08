package com.learning.Common.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.learning.Common.DAO.MessageDAO;
import com.learning.DTO.MessageDTO;

@Service
public class MessageService {

	@Autowired
	private MessageDAO messageDAO;
	
	public List<MessageDTO> RecentMessage(String u_id){
		
		return messageDAO.RecentMessage(u_id);
	}
	
}
