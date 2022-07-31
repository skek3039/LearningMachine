package com.learning.Common.Contoller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.learning.Common.Service.MessageService;
import java.util.*;
import com.learning.DTO.*;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;

	// 읽음, 삭제 설정
	// 삭제안된거(m_del = 0)인거만 가져올 것

	@RequestMapping(value = "/message")
	public String messasge(HttpServletRequest rq) throws ParseException {

		String u_id = (String) rq.getSession().getAttribute("u_id");

		if (u_id == null) {

			return "redirect:/login";
		} else {

			rq.setAttribute("MessageList", messageService.RecentMessage(u_id));

			return "user/message";
		}
	}

	@RequestMapping(value = "/ChattingRoom")
	@ResponseBody
	public List<MessageDTO> chattingroom(HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		String from_id = rq.getParameter("form_id");
		List<MessageDTO> Chat = null;
		if (u_id == null || from_id == null) {

			return null;
		} else {
			Chat = messageService.ChattingRoom(u_id, from_id);

			if (Chat == null || Chat.size() == 0) {

				return null;
			} else {
				if (messageService.ReadMessage(u_id, from_id) == 0) {
					return null;
				} else {
					return Chat;
				}
			}
		}
	}
	
	@RequestMapping(value = "/DeleteMessage")
	@ResponseBody
	public int deleteMessage(HttpServletRequest rq) {
		
		String u_id = (String)rq.getSession().getAttribute("u_id");
		int le_no = (rq.getParameter("le_no") != null)?Integer.parseInt(rq.getParameter("le_no")):0;
		
		if(u_id == null || le_no == 0) {
			
			return 0;
		}else {
			
			return messageService.DeleteMessage(le_no, u_id);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
