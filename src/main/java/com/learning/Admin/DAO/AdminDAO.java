package com.learning.Admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.BannedDTO;
import com.learning.DTO.BoardDTO;
import com.learning.DTO.LectureDTO;
import com.learning.DTO.NoticeDTO;
import com.learning.DTO.PageDTO;
import com.learning.DTO.userDTO;
import com.learning.User.DTO.ULectureDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession sqlSession;

	public int totalCount(int check_total) {
		String tname= null;
		switch (check_total) {
		case 1: 
			tname= "user";		
			break;
		case 2 : 
			tname= "user_teacher_reported_View";
		case 3 :
			tname= "lecture_info_view";
		case 4 :
			tname= "teacher_apply";
		default:
			break;
		}
		return sqlSession.selectOne("Admin.totalCount",tname);		
	}
	
	public List<userDTO> userList() {
		return sqlSession.selectList("Admin.userList");
	}

	public List<userDTO> userSearch(String u_name) {
		return sqlSession.selectList("Admin.userSearch",u_name);
	}

	public List<String> studentLecture(String u_id) {
		return sqlSession.selectList("Admin.studentLecture", u_id);
	}

	public List<String> studentReport(String u_id, PageDTO page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(page !=null) {
			map.put("u_id", u_id);
			map.put("page", page);
			return sqlSession.selectList("Admin.studentReport",map);
		}else {
			map.put("u_id", u_id);
			return sqlSession.selectList("Admin.studentReport",map);
		}
	}

	public int report(BannedDTO dto) {
		return sqlSession.insert("Admin.report",dto);
	}

	public void user_report(String u_id) {
		sqlSession.update("Admin.userReport",u_id);
	}

	public void back(String u_id) {
		sqlSession.update("Admin.back",u_id);
		sqlSession.delete("Admin.backdelete", u_id);
	}

	public List<String> teacherList() {
		return sqlSession.selectList("Admin.teacherList");
	}

	public List<String> studentBanList() {
		return sqlSession.selectList("Admin.studentBanList");
	}

	public List<userDTO> teacherSearch(String t_nickname) {
		return sqlSession.selectList("Admin.teacherSerch", t_nickname);
	}

	public List<String> refundList() {
		return sqlSession.selectList("Admin.refundList");
	}

	public List<String> admin_lectureRequest(String la_no) {
		return sqlSession.selectList("Admin.lectureRequest",la_no);
	}
	public List<String> teachervideo(String t_nickname) {
		return sqlSession.selectList("Admin.teachervideo");
	}

	public List<String> teacherBanList() {
		return sqlSession.selectList("Admin.teacgerBanList");
	}

	public int lecture_refund(String p_no, String u_id) {
		sqlSession.update("Admin.lecture_refund", p_no);
		sqlSession.delete("Admin.lecture_refund1",p_no);
		return sqlSession.delete("Admin.lecture_refund2",p_no);
	}

	public int lectureGet(Map<String, Object> map ) {
		sqlSession.insert("Admin.lectureGet",map);
		return sqlSession.insert("Admin.lectureCate",map);
	}

	public void lectureGet1(Map<String, Object> map, String c1) {
		if(c1.equals("1")) {
			sqlSession.update("Admin.lectureGet2",map);							
		}else {
			sqlSession.update("Admin.lectureGet3",map);							
		}
	}
	public List<String> teacherDetail(String u_id) {
		return sqlSession.selectList("Admin.teacherDetail",u_id);
	}

	public List<String> teacherRequest(String u_id, PageDTO page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(page !=null) {
			map.put("u_id", u_id);
			map.put("page", page);
			return sqlSession.selectList("Admin.teacherRequest",map);
		}else {
			map.put("u_id", u_id);
			return sqlSession.selectList("Admin.teacherRequest",map);
		}
	}

	public List<String> teacherRe(String u_id) {
		return sqlSession.selectList("Admin.teacherRe",u_id);
	}

	public int teacherAccept(Map<String, Object> map) {
		sqlSession.update("Admin.teacherAccept1",map);
		sqlSession.update("Admin.teacherAccept2",map);
		return sqlSession.insert("Admin.teacherAccept",map);
	}

	public List<String> categorylist() {
		return sqlSession.selectList("Admin.categoryList");
	}

	public int addCategory(String c_name, String check) {
		if(check.equals("1")) {
			return sqlSession.insert("Admin.addCategory",c_name);
		}else {
			return sqlSession.insert("Admin.deleteCategory",c_name);			
		}
	}

	public List<NoticeDTO> admin_notice(Map<String, Object> map) {
		return sqlSession.selectList("Admin.admin_notice", map);
	}

	public int notice_totalCount() {
		return sqlSession.selectOne("Admin.notice_totalCount");
	}

	public int notice_request(NoticeDTO notice_request) {
		return sqlSession.insert("Admin.notice_request", notice_request);
	}

	public Object notice_update(NoticeDTO notice_update) {
		return sqlSession.selectOne("Admin.notice_update", notice_update);
	}

	public int notice_delete(NoticeDTO notice_delete) {
		return sqlSession.delete("Admin.notice_delete", notice_delete);
	}

	public List<BoardDTO> boardList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.boardList", map);
	}

	public int community_totalCount() {
		return sqlSession.selectOne("Admin.community_totalCount");
	}

	public int board_delete(BoardDTO board_delete) {
		return sqlSession.delete("Admin.board_delete", board_delete);
	}

	public Object notice_update1(NoticeDTO notice_update1) {
		return sqlSession.update("Admin.notice_update1", notice_update1);
	}



}
