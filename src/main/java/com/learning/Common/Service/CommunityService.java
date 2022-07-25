package com.learning.Common.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.learning.Common.DAO.CommunityDAO;
import com.learning.DTO.LectureDTO;

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

	public List<LectureDTO> communitySearch(String lqa_title) {
		return communityDAO.communitySearch(lqa_title);
	}

}
