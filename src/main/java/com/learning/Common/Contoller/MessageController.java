package com.learning.Common.Contoller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonParser;
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
	public Map<Integer, MessageDTO> chattingroom(@RequestParam(name = "from_id") String from_id,
			HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");
		Map<Integer, MessageDTO> Chat = null;
		if (u_id == null || from_id == null) {

			return null;
		} else {
			Chat = messageService.ChattingRoom(u_id, from_id);

			if (Chat == null || Chat.size() == 0) {

				return null;
			} else {

				messageService.ReadMessage(u_id, from_id);

				return Chat;
			}
		}
	}

	@RequestMapping(value = "/SendMessage")
	@ResponseBody
	public int sendMessage(@RequestParam(name = "to_id") String to_id, HttpServletRequest rq) {

		String from_id = (String) rq.getSession().getAttribute("u_id");
		String le_content = rq.getParameter("le_content");
		MessageDTO mdto = null;

		if (from_id == null) {

			return 0;
		} else {
			if (le_content.length() == 0) {

				return 2;
			} else {
				mdto = new MessageDTO();
				
				mdto.setLe_content(le_content);
				mdto.setTo_id(to_id);
				mdto.setFrom_id(from_id);
				
				return messageService.SendMessage(mdto);
			}
		}
	}

	@RequestMapping(value = "/DeleteMessage")
	@ResponseBody
	public int deleteMessage(@RequestParam(name="le_no")int le_no,HttpServletRequest rq) {

		String u_id = (String) rq.getSession().getAttribute("u_id");

		if (u_id == null || le_no == 0) {

			return 0;
		} else {

			return messageService.DeleteMessage(le_no, u_id);
		}
	}

}
