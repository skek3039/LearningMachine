package com.learning.Common.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Common.DAO.CommunityDAO;
import com.learning.DTO.PageDTO;

@Service
public class CommunityService {

	@Autowired
	private CommunityDAO communityDAO;
	
	public int totalCount(String name) {
		return communityDAO.totalCount(name);
	}

	public List<String> QnAList(PageDTO page) {
		return communityDAO.qnaList(page);
	}

}
