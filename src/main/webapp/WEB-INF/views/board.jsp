<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


		 <table class="table table-hover" style="width: 90%; margin: 0 auto" >
						  <thead class="thead-dark">
						    <tr>
						      <th>no.</th>
						      <th>제목</th>
						      <th>닉네임</th>
						      <th>날짜</th>
						 	  <th>조회수</th>
						    </tr>
						  </thead>
						<c:forEach items="${board }" var = "b"> 
						  <tbody id = "detailTable">
						   <tr>
						   		<td>${b.b_no }</td>
						   		<td><a href = "./boardDetail?b_no=${b.b_no }"> ${b.b_title } </a> <small></small></td>
						   		<td>${b.u_nickname }</td>
						   		<td>${b.b_date }</td>
						   		<td>${b.b_view }</td>
						   </tr>
						  </tbody>
						</c:forEach>
			</table>	
		<br>
		<br>
		<div id = "more_btn_div" align="center">
			<a id="more_btn_a" href="javascript:moreList();"><button class="btn btn-outline-dark">More</button></a>
		</div>
