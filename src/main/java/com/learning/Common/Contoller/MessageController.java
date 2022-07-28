package com.learning.Common.Contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.learning.Common.Service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	//읽음, 삭제 설정
	//삭제안된거(m_del = 0)인거만 가져올 것
}
