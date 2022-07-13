package com.learning.User.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.learning.User.Form.*;
import com.learning.utill.Util;

@Repository
public class ULectureDAO {

	private final String namespace = "ULectureMapper";

	@Autowired
	private SqlSession sqlSession;

	public List<ULectureForm> LectureList() {

		List<ULectureForm> list = sqlSession.selectList(namespace + ".ULectureList");
		
		for(ULectureForm form : list) {
			
			form.setL_price(Util.PriceCut(form.getL_price()));
		}
		return list;
	}

	public ULectureForm LectureDetail(String l_code) {

		ULectureForm form = sqlSession.selectOne(namespace + ".ULectureDetail", l_code);
		form.setL_price(Util.PriceCut(form.getL_price()));

		return form;
	}

	public List<VideoForm> LectureVideos(String l_code) {

		return sqlSession.selectList(namespace + ".ULectureVideos", l_code);
	}

	public String VideoLectureCheck(int v_no) {
		
		return sqlSession.selectOne(namespace + ".UVideoLnameCheck", v_no);
	}
	
	public List<ULectureQnaForm> LectureQna(String l_code) {

		return sqlSession.selectList(namespace + ".ULectureQnas", l_code);
	}

	public ULectureQnaReplyForm LectureQnaReply(int lqa_no) {

		return sqlSession.selectOne(namespace + ".ULectureQnaReplys", lqa_no);
	}

	public List<ULectureViedoQnaForm> LectureVideoQna(String l_code) {

		return sqlSession.selectList(namespace + "ULectureVideoQnas", l_code);
	}

	public List<ULectureVideoQnaReplyForm> LectureVideoQnaReply(String l_code) {

		return sqlSession.selectList(namespace + "ULectureVideoQnaReplys", l_code);
	}
}
