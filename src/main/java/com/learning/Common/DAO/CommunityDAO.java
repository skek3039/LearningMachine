package com.learning.Common.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.BoardDTO;
import com.learning.DTO.LectureDTO;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int totalCount(String name) {
		return sqlSession.selectOne("Community.totalCount",name);
	}

	public List<String> qnaList(Map<String, Object> map) {
		return sqlSession.selectList("Community.qnaList",map);
	}

	public List<LectureDTO> communitySearch(String lqa_title) {
		return sqlSession.selectList("Community.communitySearch", lqa_title);
	}

	public List<BoardDTO> boardList() {
		return sqlSession.selectList("Community.boardList");
	}

	public BoardDTO boardDetail(int b_no) {
		return sqlSession.selectOne("Community.boardDetail",b_no);
	}

	public int commentWrite(BoardDTO dto) {
		return sqlSession.insert("Community.commentWrite",dto);
	}

	public List<BoardDTO> commentList(int b_no) {
		return sqlSession.selectList("Community.commentList",b_no);
	}

	public int boardWrite(BoardDTO dto) {
		return sqlSession.insert("Community.boardWrite" , dto);
		
	}

	public void boardDelete(String b_no) {
		sqlSession.update("Community.boardDelete", b_no);
	}

	public void boardModify(BoardDTO dto) {
		sqlSession.update("Community.boardModify",dto);
	}

	public int boardCountUp(int b_no) {
		return sqlSession.update("Community.boardCountUp", b_no);
	}

	public List<String> commentTotal() {
		return sqlSession.selectList("Community.commentTotal");
	}

	public void commentDelete(int br_no) {
		sqlSession.delete("Community.commentDelete", br_no);
	}

	public void commentUpdate(BoardDTO dto) {
		sqlSession.update("Community.commentUpdate",dto);
	}

}
