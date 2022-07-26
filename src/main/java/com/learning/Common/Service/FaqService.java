package com.learning.Common.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.FaqDAO;
import com.learning.DTO.FaqDTO;

@Service
public class FaqService {
	@Autowired
	private FaqDAO faqDao;

	public List<FaqDTO> faqList() {
		return faqDao.faqList();
	}

}
