package com.learning.Common.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.NoticeDAO;
import com.learning.DTO.NoticeDTO;
import com.learning.DTO.PageDTO;
@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	public List<NoticeDTO> noticeList(PageDTO page) {
		return noticeDAO.list(page);
	}
	public NoticeDTO noticeDetail(int n_no) {
		return noticeDAO.noticedetail(n_no);
	}
	public int totalCount(int n_cate) {
		return noticeDAO.totalCount(n_cate);
	}
	
}
