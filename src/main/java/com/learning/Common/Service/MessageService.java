package com.learning.Common.Service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.learning.Common.DAO.MessageDAO;
import com.learning.DTO.MessageDTO;
import com.learning.utill.Util;

@Service
public class MessageService {

	@Autowired
	private MessageDAO messageDAO;

	// 최근에 메시지가 온 채팅방(사람과의 대화방) 리스트
	public List<MessageDTO> RecentMessage(String u_id) throws ParseException {

		List<MessageDTO> list = messageDAO.RecentMessage(u_id);

		for (MessageDTO mDTO : list) {

			mDTO.setLe_date(Util.YMDHM(mDTO.getLe_date()));
		}

		return list;
	}

	// 특정인(from_id)과의 대화 내용들리스트
	public Map<Integer, MessageDTO> ChattingRoom(String to_id, String from_id) {

		MessageDTO dto = new MessageDTO();
		Map<Integer, MessageDTO> map = new HashMap<Integer, MessageDTO>();
		int i = 1;
		dto.setTo_id(to_id);
		dto.setFrom_id(from_id);

		List<MessageDTO> MessageList = messageDAO.ChattingRoom(dto);

		for (MessageDTO message : MessageList) {

			if (message.getFrom_id().equals(to_id)) {

				message.setSend(1);

				if (message.getLe_del() == 1) {
					message.setDel(1);
				}
			}

			map.put(i++, message);
		}

		return map;
	}

	// 메시지 확인
	public int ReadMessage(String to_id, String from_id) {

		MessageDTO dto = new MessageDTO();

		dto.setFrom_id(from_id);
		dto.setTo_id(to_id);

		return messageDAO.ReadMessage(dto);
	}

	// 메시지 전송
	public int SendMessage(MessageDTO dto) {

		return messageDAO.SendMessage(dto);
	}

	// 메시지 삭제(읽었을 경우 안읽었을경우에 처리 다르게)
	public int DeleteMessage(int le_no, String u_id) {
		System.out.println(messageDAO.CheckMessageWriter(le_no));
		System.out.println(u_id);
		if (messageDAO.CheckMessageWriter(le_no).equals(u_id)) {

			if (messageDAO.CheckMessageConfirm(le_no) == 1) {
				return messageDAO.DeleteMessage(le_no);
			} else {
				return messageDAO.RemoveMessage(le_no);
			}
		} else {

			return 0;
		}
	}

}