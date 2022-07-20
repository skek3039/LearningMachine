package com.learning.Common.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Common.DAO.CommunityDAO;

@Service
public class CommunityService {

	@Autowired
	private CommunityDAO communityDAO;
	
	public int totalCount(String name) {
		return communityDAO.totalCount(name);
	}

	public List<String> QnAList(Map<String, Object> map) {
		return communityDAO.qnaList(map);
	}

	public List<String> categoryList() {
		// TODO Auto-generated method stub
		return null;
	}

}
