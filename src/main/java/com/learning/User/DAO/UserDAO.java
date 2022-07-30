package com.learning.User.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.learning.DTO.MessageDTO;
import com.learning.DTO.userDTO;
import com.learning.User.DTO.WishlistDTO;
import com.learning.User.Form.ULectureForm;
import com.learning.User.Form.ULectureQnaForm;
import com.learning.User.Form.ULectureReviewForm;
import com.learning.User.Form.URegiForm;
import com.learning.User.Form.UserAttendanceForm;

@Repository
public class UserDAO {

	private final String namespace = "UserMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public userDTO UserInfo(String u_id) {
	
		return sqlSession.selectOne(namespace + ".UserInfo", u_id);
		
	}
	
	public List<UserAttendanceForm> RecentVideo(String u_id) {
		
		return sqlSession.selectList(namespace + ".RecentVideo", u_id);
	}
	
	//내가 듣는 강의 목록
	public List<URegiForm> RegiList(String u_id){
		
		return sqlSession.selectList(namespace + ".RegistrationList", u_id);
	}
	
	//내가 듣는 강의와 정보 리스트들
	public List<ULectureForm> RegistedLecture(String u_id){
		
		return sqlSession.selectList(namespace + ".RegistedLecture", u_id);
	}
	
	public int RecentLectureVideo(UserAttendanceForm form) {
		
		if(sqlSession.selectOne(namespace + ".RecentLectureVideo", form) == null) {
			return 0;
		}else {
			
			return sqlSession.selectOne(namespace + ".RecentLectureVideo", form);
		}
	}
	
	public int CheckLectureRegist(URegiForm form) {
		
		return sqlSession.selectOne(namespace + ".CheckLectureRegist", form);
	}
	public String CheckAttendance(UserAttendanceForm form) {
		
		return sqlSession.selectOne(namespace + ".UCheckAttendance", form);
	}
	
	public int UserAttendanceInsert(UserAttendanceForm form) {
		
		return sqlSession.insert(namespace + ".UInsertVideoAttendance", form);
	}
	
	public int UpdateVideoAttendance(UserAttendanceForm form) {
		
		return sqlSession.update(namespace + ".UpdateVideoAttendance", form);
	}
	
	public int CheckLectureReview(ULectureReviewForm form) {
		
		return sqlSession.selectOne(namespace + ".CheckLectureReivew",form);
	}
	
	public int CheckLectureQnaCount(ULectureQnaForm form) {
		
		return sqlSession.selectOne(namespace + ".CheckLectureQnaCount", form);
	}

	//wishlist
	
	public int CheckWishList(WishlistDTO dto) {
		
		return sqlSession.selectOne(namespace + ".CheckWishList", dto);
	}
	
	public List<WishlistDTO> Wishlist(String u_id){
		
		return sqlSession.selectList(namespace + ".WishList", u_id);
	}

	public int AddWishlist(WishlistDTO dto) {
		
		return sqlSession.insert(namespace + ".AddWishlist", dto);
	}
	
	public int DeleteWishList(WishlistDTO dto) {
		
		return sqlSession.delete(namespace + ".DeleteWishList", dto);
	}




















}