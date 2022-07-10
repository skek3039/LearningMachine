<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

		 <div class="card bg-dark text-white" style="width: 20%; height: 801px; float:left;">

				<div class="card-body p-5 text-left">
					<h5 style="text-align: left; color: white;">관리자</h5>
					<details>
    					<summary>매출관리</summary>
    						<a href="./payment">매출조회</a> <br>
    						<a href="./payment_list">결제내역조회</a> <br>
    						<a href="./payment_refunt">환불내역조회</a><br>
   	 				</details>
					<details>
    					<summary>학생관리</summary>
    						<a href="./admin_student">학생조회</a> <br>
    						<a href="./admin_student_report">신고리스트</a> <br>
    						<a href="./admin_student_refund">환불신청내역</a> <br>
					</details>
					<details>
    					<summary>강사관리</summary>
    						<a href="./admin_teacher">강사조회</a> <br>
    						<a href="#">강의관리</a> <br>
    						<a href="./admin_lectureRequest">강의신청내역</a> <br>
   	 				</details>
				</div>
			</div>