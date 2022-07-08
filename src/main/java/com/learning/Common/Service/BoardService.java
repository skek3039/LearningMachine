package com.learning.Common.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.NoticeDAO;
import com.learning.DTO.NoticeDTO;
@Service
public class BoardService {
	@Autowired
	private NoticeDAO noticeDAO;

	public List<NoticeDTO> noticeList() {
		return noticeDAO.list();
	}
	public NoticeDTO noticeDetail(int n_no) {
		return noticeDAO.noticedetail(n_no);
	}
	
}
