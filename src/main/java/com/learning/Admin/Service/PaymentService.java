package com.learning.Admin.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.Admin.DAO.PaymentDAO;

@Service
public class PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;

	public List<String> paymentList(Map<String, Object> map) {
		return paymentDAO.paymentList(map);
	}

	public List<Map<String, Object>> payment(int year) {
		
		List<Map<String, Object>> list = paymentDAO.payment(year); //결과 리스트
		List<Map<String, Object>> finallist = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = null;
		int cnt =  0;
		for(int i = 1; i<13; i++) {
			map = new HashMap<String, Object>();
			map.put("month", Integer.toString(i));
			finallist.add(map);
		}
		for(Map<String, Object> m : finallist) {
			if(cnt + 1 <= list.size() && m.get("month").toString().equals(list.get(cnt).get("month").toString())) {
				m.put("total", list.get(cnt).get("total").toString());
				m.put("year", list.get(cnt).get("year").toString());
				cnt++;
			}else {
				m.put("total", 0);
			}
		}
		return finallist;
	}

	public List<String> circle() {
		return paymentDAO.circle();
	}

	public List<String> refundList() {
		return paymentDAO.refundList();
	}

	public List<String> gender() {
		return paymentDAO.gender();
	}

}
