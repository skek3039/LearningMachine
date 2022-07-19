package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.ULectureDAO;
import com.learning.User.DAO.UserDAO;

import java.text.ParseException;
import java.util.*;
import com.learning.User.Form.*;
import com.learning.utill.LectureListComparator;
import com.learning.utill.Util;

@Service
public class ULectureService {

	@Autowired
	private ULectureDAO lectureDAO;

	@Autowired
	private UserDAO userDAO;

	public List<ULectureForm> PopularLectureList(String u_id) {

		List<ULectureForm> LectureList = lectureDAO.LectureList();// 기본적으로 인기순으로 강의가져옴
		if (u_id == null) {

			return LectureList;
		} else {
			List<ULectureForm> RegistedList = userDAO.RegistedLecture(u_id);

			for (ULectureForm lectureform : LectureList) {

				for (ULectureForm registedform : RegistedList) {

					if (lectureform.getL_code().equals(registedform.getL_code())) {

						lectureform.setPayment_whether(1);
					}
				}
			}

			return LectureList;
		}
	}

	public List<ULectureForm> RecentLectureList(String u_id) {

		List<ULectureForm> LectureList = lectureDAO.LectureList();

		// lectureListComparator 객체에서 override를 통해 LectureForm의 l_date로 정렬
		// 최신순서대로 정렬 됨
		Collections.sort(LectureList, new LectureListComparator());

		if (u_id == null) {

			return LectureList;
		} else {
			List<ULectureForm> RegistedList = userDAO.RegistedLecture(u_id);

			for (ULectureForm lectureform : LectureList) {

				for (ULectureForm registedform : RegistedList) {

					if (lectureform.getL_code().equals(registedform.getL_code())) {

						lectureform.setPayment_whether(1);
					}
				}
			}

			return LectureList;
		}
	}

	public ULectureForm LectureDetail(String u_id, String l_code) {

		ULectureForm LectureForm = lectureDAO.LectureDetail(l_code);

		List<URegiForm> regiList = null;

		if (u_id == null) {

			return LectureForm;
		} else {

			regiList = userDAO.RegiList(u_id);
			if (regiList.size() != 0) {
				for (URegiForm form : regiList) {

					if (LectureForm.getL_code().equals(form.getL_code())) {
						LectureForm.setPayment_whether(1);
					}
				}
			}

			return LectureForm;
		}

	}
	

	public List<ULectureQnaForm> LuectureQnas(String u_id, String l_code) throws ParseException {

		List<ULectureQnaForm> qnaList = lectureDAO.LectureQna(l_code);
		ULectureQnaReplyForm reply = null;

		for (ULectureQnaForm qna : qnaList) {

			reply = lectureDAO.LectureQnaReply(qna.getLqa_no()); //밖으로뺴
			
			qna.setLqa_date(Util.YMD(qna.getLqa_date()));
			
			if (reply != null && qna.getLqa_no() == reply.getLqa_no()) {

				
				reply.setLqar_date(Util.YMD(reply.getLqar_date()));
				qna.setT_id(reply.getT_id());
				qna.setT_name(reply.getT_name());
				qna.setT_nickname(reply.getT_nickname());
				qna.setLqar_content(reply.getLqar_content());
				qna.setLqar_date(reply.getLqar_date());
				
			}

			if (u_id != null && qna.getU_id().equals(u_id))
				qna.setMy_qna(1);

		}

		return qnaList;

	}
	
	public Map<Integer, VideoForm> LectureVideos(String l_code){
		
		List<VideoForm> vList = lectureDAO.LectureVideos(l_code);
		Map<Integer, VideoForm> vMap = new HashMap<Integer, VideoForm>();
		for (int i = 1; i <= vList.size(); i++) {
			
			vMap.put(i, vList.get(i - 1));
		}
		
		return vMap;
	}

	public String CheckLectureRegister(int v_no) {
		
		return lectureDAO.VideoLectureCheck(v_no);
	}
	
	public int RegisterVideo(String l_code, String u_id) {
		
		int regi = 0;
		
		for(URegiForm form : userDAO.RegiList(u_id)) {
			
			if(form.getL_code().equals(l_code)) {
				regi = 1;
				break;
			}
		}
		
		return regi;
	}
	
	public List<ULectureReviewForm> LectureReviews(String l_code) throws ParseException{
		
		List<ULectureReviewForm> list = lectureDAO.LectureReviews(l_code);
		
		for(ULectureReviewForm form : list) {
			form.setLr_date(Util.YMD(form.getLr_date()));
		}
		
		return list;
	}
}
