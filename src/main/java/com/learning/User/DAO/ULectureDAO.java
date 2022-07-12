package com.learning.User.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.learning.User.Form.*;

@Repository
public class ULectureDAO {

	private final String namespace = "ULectureMapper";

	@Autowired
	private SqlSession sqlSession;

	public List<ULectureForm> LectureList() {

		return sqlSession.selectList(namespace + ".ULectureList");
	}

	public ULectureForm LectureDetail(String l_code) {

		return sqlSession.selectOne(namespace + ".ULectureDetail", l_code);
	}

	public List<VideoForm> LectureVideos(String l_code) {

		return sqlSession.selectList(namespace + ".ULectureVideos", l_code);
	}

	public List<ULectureQnaForm> LectureQna(String l_code) {

		return sqlSession.selectList(namespace + ".ULectureQnas", l_code);
	}

	public List<ULectureQnaReplyForm> LectureQnaReply(String l_code) {

		return sqlSession.selectList(namespace + ".ULectureQnaReplys", l_code);
	}

	public List<ULectureViedoQnaForm> LectureVideoQna(String l_code) {

		return sqlSession.selectList(namespace + "ULectureVideoQnas", l_code);
	}

	public List<ULectureVideoQnaReplyForm> LectureVideoQnaReply(String l_code) {

		return sqlSession.selectList(namespace + "ULectureVideoQnaReplys", l_code);
	}
}
