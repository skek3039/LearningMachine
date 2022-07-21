<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

		 <div class="card bg-dark text-white" style="width: 20%;height: 1175px; float:left; ">

				<div class="card-body p-5 text-left"><br><br><br>
					<h3 style="text-align: left; color: white;">관리자</h3>
					<details>
    					<summary>매출관리</summary>
    						<a href="./payment">매출조회</a> <br>
    						<a href="./payment_list">결제내역조회</a> <br>
    						<a href="./payment_refund">환불내역조회</a><br>
   	 				</details>
					<details>
    					<summary>학생관리</summary>
    						<a href="./admin_student">학생조회</a> <br>
    						<a href="./admin_student_report">신고리스트</a> <br>
    						<a href="./admin_student_refund">환불신청내역</a> <br>
					</details>
					<details>
    					<summary>강의관리</summary>
    						<a href="./admin_teacher">강사조회</a> <br>
    						<a href="./admin_category">카테고리조회</a> <br>
    						<a href="./admin_teacher_request">강사신청내역</a> <br>
    						<!-- <a href="./admin_lecture_management">강의관리</a> <br> -->
    						<a href="./admin_lecture_request">강의신청내역</a> <br>
   	 				</details>
					<details>
    					<summary>게시판관리</summary>
    						<a href="./admin_teacher">공지사항</a> <br>
   	 				</details>
				</div>
			</div>