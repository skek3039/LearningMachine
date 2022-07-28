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
		LectureForm.setL_price(Util.PriceCut(LectureForm.getL_price()));
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

		// Left Join으로 이렇게 복잡하게 할 필요 없음.
		for (ULectureQnaForm qna : qnaList) {

			reply = lectureDAO.LectureQnaReply(qna.getLqa_no());

			qna.setLqa_date(Util.YMD(qna.getLqa_date()));

			if (reply != null && qna.getLqa_no() == reply.getLqa_no()) {

				reply.setLqar_date(Util.YMD(reply.getLqar_date()));
				qna.setT_id(reply.getT_id());
				qna.setT_name(reply.getT_name());
				qna.setT_nickname(reply.getT_nickname());
				qna.setLqar_title(reply.getLqar_title());
				qna.setLqar_content(reply.getLqar_content());
				qna.setLqar_date(reply.getLqar_date());

			}

			if (u_id != null && qna.getU_id().equals(u_id))
				qna.setMy_qna(1);

		}

		return qnaList;

	}

	public Map<Integer, VideoForm> LectureVideos(String u_id, String l_code) {

		List<VideoForm> vList = lectureDAO.LectureVideos(l_code);

		UserAttendanceForm attnForm = null;

		Map<Integer, VideoForm> vMap = new HashMap<Integer, VideoForm>();

		if (u_id == null) {
			for (int i = 0; i < vList.size(); i++) {

				vMap.put(i + 1, vList.get(i));
			}

			return vMap;
		} else {

			for (int i = 0; i < vList.size(); i++) {
				attnForm = new UserAttendanceForm();

				attnForm.setU_id(u_id);
				attnForm.setL_code(l_code);
				attnForm.setV_no(vList.get(i).getV_no());

				if (userDAO.CheckAttendance(attnForm) != null) {

					vList.get(i).setAttendance(Integer.parseInt(userDAO.CheckAttendance(attnForm)));
				}

				vMap.put(i + 1, vList.get(i));
			}

			return vMap;
		}

	}

	public List<ULectureVideoQnaForm> LectureVideoQnas(int v_no) {

		return lectureDAO.LectureVideoQnas(v_no);
	}

	public String CheckLectureRegister(int v_no) {

		return lectureDAO.VideoLectureCheck(v_no);
	}

	public int RegisterVideo(String l_code, String u_id) {

		int regi = 0;

		for (URegiForm form : userDAO.RegiList(u_id)) {

			if (form.getL_code().equals(l_code)) {
				regi = 1;
				break;
			}
		}

		return regi;
	}

	public List<ULectureReviewForm> LectureReviews(String l_code) throws ParseException {

		List<ULectureReviewForm> list = lectureDAO.LectureReviews(l_code);

		for (ULectureReviewForm form : list) {
			form.setLr_date(Util.YMD(form.getLr_date()));
		}

		return list;
	}

	public int InsertLectureQnA(ULectureQnaForm form) {

		return lectureDAO.InsertLectureQnA(form);
	}

	public int InsertLectureReview(ULectureReviewForm form) {

		return lectureDAO.InsertLectureReview(form);
	}
	
	public int InsertLectureVideoQna(ULectureVideoQnaForm form) {

		return lectureDAO.InsertLectureVideoQnA(form);
	}

	public int EditLectureReview(ULectureReviewForm form) {

		if (lectureDAO.CheckLectureReviewWriter(form) == 1) {

			return lectureDAO.UpdateLectureReview(form);
		} else {

			return 0;
		}
	}

	public int RemoveLectureReview(String u_id, String l_code) {

		ULectureReviewForm form = null;
		if (u_id == null) {

			return 0;
		} else {

			form = new ULectureReviewForm();

			form.setU_id(u_id);
			form.setL_code(l_code);

			if (lectureDAO.CheckLectureReviewWriter(form) == 1) {

				return lectureDAO.RemoveLectureReview(form);
			} else {

				return 0;
			}

		}

	}

	public int UpdateLectureQna(ULectureQnaForm form) {

		Map<String, Object> CheckLectureQna = lectureDAO.CheckLectureQna(form.getLqa_no());
		String u_id = null;
		int lqa_confirm = 0;

		if (CheckLectureQna != null && CheckLectureQna.size() != 0) {

			u_id = (String) CheckLectureQna.get("u_id");
			lqa_confirm = (int) CheckLectureQna.get("lqa_confirm");

			if (form.getU_id().equals(u_id)) {
				if (lqa_confirm != 0) {

					return 3;
				} else {
					
					return lectureDAO.UpdateLectureQna(form);
				}
			} else {

				return 0;
			}

		} else {

			return 2;
		}
	}

	
	public int RemoveLectureQna(String u_id, int lqa_no) {
		
		Map<String, Object> CheckLectureQna = lectureDAO.CheckLectureQna(lqa_no);
		
		if(((String)CheckLectureQna.get("u_id")).equals(u_id)) {
			
			return lectureDAO.RemoveLectureQna(lqa_no);
		}else {
			
			return 0;
		}
	}
	
	public int UpdateLectureVideoQna(ULectureVideoQnaForm form) {

		Map<String, Object> CheckLectureVideoQna = lectureDAO.CheckLectureQna(form.getVq_no());
		String u_id = null;
		int vq_confirm = 0;

		if (CheckLectureVideoQna != null && CheckLectureVideoQna.size() != 0) {

			u_id = (String) CheckLectureVideoQna.get("u_id");
			vq_confirm = (int) CheckLectureVideoQna.get("vq_confirm");

			if (form.getU_id().equals(u_id)) {
				if (vq_confirm != 0) {

					return 3;
				} else {
					
					return lectureDAO.UpdateLectureVideoQna(form);
				}
			} else {

				return 0;
			}

		} else {

			return 2;
		}
	}

	
	public int RemoveLectureVideoQna(String u_id, int vq_no) {
		
		Map<String, Object> CheckLectureVideoQna = lectureDAO.CheckLectureVideoQna(vq_no);
		
		if(((String)CheckLectureVideoQna.get("u_id")).equals(u_id)) {
			
			return lectureDAO.RemoveLectureVideoQna(vq_no);
		}else {
			
			return 0;
		}
	}
}




















