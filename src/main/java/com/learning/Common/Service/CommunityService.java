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
import com.learning.DTO.BoardDTO;
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


	public List<LectureDTO> communitySearch(String lqa_title) {
		return communityDAO.communitySearch(lqa_title);
	}

	public List<BoardDTO> boardList() {
		return communityDAO.boardList();
	}

	public BoardDTO boardDetail(int b_no) {
		return communityDAO.boardDetail(b_no);
	}

}
