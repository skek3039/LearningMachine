package com.learning.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.User.DAO.ULectureDAO;
import com.learning.User.DAO.UserDAO;

import java.util.*;
import com.learning.User.Form.*;
import com.learning.utill.LectureListComparator;

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

	public List<ULectureQnaForm> LuectureQnas(String u_id, String l_code) {

		List<ULectureQnaForm> qnaList = lectureDAO.LectureQna(l_code);
		List<ULectureQnaReplyForm> replyList = lectureDAO.LectureQnaReply(l_code);

		if (u_id != null) {
			for (ULectureQnaForm qna : qnaList) {

				if (replyList == null)
					break;
				for (ULectureQnaReplyForm reply : replyList) {

					if (qna.getLqa_no() == reply.getLqa_no()) {

						qna.setT_id(reply.getT_id());
						qna.setT_name(reply.getT_name());
						qna.setLqr_title(reply.getLqr_title());
						qna.setLqr_content(reply.getLqr_content());
						qna.setLqr_date(reply.getLqr_date());
					}
				}

				if (qna.getU_id().equals(u_id))
					qna.setMy_qna(1);

			}
			
			return qnaList;
		} else {

			return qnaList;
		}
	}

}
