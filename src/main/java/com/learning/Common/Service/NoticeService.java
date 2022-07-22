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
	public NoticeDTO noticeDetail(NoticeDTO detail) {
		return noticeDAO.noticedetail(detail);
	}
	public int totalCount(int n_cate) {
		return noticeDAO.totalCount(n_cate);
	}
	public int noticecountUp(int n_no) {
		return noticeDAO.noticecountUp(n_no);
	}
	public int noticeWrite(NoticeDTO noticeWrite) {
		return noticeDAO.noticeWrite(noticeWrite);
	}
	public List<NoticeDTO> faq(PageDTO page) {
		return noticeDAO.faq(page);
	}
	public int faqWrite(NoticeDTO faq) {
		return noticeDAO.faqWrite(faq);
	}
	public NoticeDTO faqdetail(NoticeDTO faqdetail) {
		return noticeDAO.faqdetail(faqdetail);
	}
	
}
