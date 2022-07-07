package com.learning.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.DAO.NoticeDAO;
import com.learning.DTO.NoticeDTO;
import com.learning.DTO.userDTO;

@Service
public class BoardService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	public List<NoticeDTO> noticeList() {
		return noticeDAO.list();
	}
}
