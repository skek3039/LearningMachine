package com.learning.utill;

import java.util.Comparator;

import com.learning.User.Form.LectureForm;

public class LectureListComparator implements Comparator<LectureForm>{

	@Override
	public int compare(LectureForm o1, LectureForm o2) {

		String l_date1 = o1.getL_date();
		String l_date2 = o2.getL_date();
		
		if(l_date1.compareTo(l_date2) > 0) {
			
			return -1;
		}else if(l_date1.compareTo(l_date2) < 0) {
			return 1;
		}else {
			
			return 0;
		}
		
	}
}
