<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
	<c:when test="${sessionScope.u_authority > 3 || sessionScope.u_authority eq null}">
		<div class="container-xxl bg-primary hero-header">
			<div class="container">
				<div class="row g-5 align-items-center">
					<div class="col-lg-6 text-center text-lg-start">
						<h1 class="text-white mb-4 animated zoomIn">Learning Machine</h1>
						<p class="text-white pb-3 animated zoomIn">마케팅보다는 좋은 콘텐츠에 집중합니다.<br> 좋지 않은 콘텐츠라도 홍보와 포장을 통해 이윤을 남길 수 있지만,<br><strong><I> 우리는 콘텐츠에 집중합니다.</I></strong> <br> 좋은 콘텐츠를 통해 자연스럽게 알려지고, 소개하게 되어 모두 함께 성장하는 공간을 만들겠습니다.</p>
						<a href="./LectureList"
							class="btn btn-outline-light rounded-pill border-2 py-3 px-5 animated slideInRight">강의 살펴보기</a>
					</div>
					<div class="col-lg-6 text-center text-lg-start">
						<img class="img-fluid animated zoomIn" src="img/hero.png" alt="">
					</div>
				</div>
			</div>
		</div>
		</html>
	</c:when>
	<c:otherwise>
		<div class="container-xxl py-6">
			<div class="container" id="user_main">
				<div class="row g-5">
					<div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
						<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">내 강의</div>
						<table class="table" style="text-align: center;">
							<c:choose>
								<c:when test="${fn:length(RegistedLecture) eq 0}">
									<thead\>
										<tr>
											<th>수강하는 강의가 없어요</th>
											<c:forEach var="i" begin="0" end="${3 - fn:length(RegistedLecture)}">
											<tr>
												<td> .</td>
											</tr>
									</c:forEach>
										</tr>
									</thead>
								</c:when>
								<c:when test="${fn:length(RegistedLecture) >= 5}">
									<tbody>
										<c:forEach items="${RegistedLecture}" var="i" begin ="0" end = "4">
											<tr>
												<th scope="row">${i.l_name}</th>
												<td>${i.t_nickname}</td>
												<td><small>출석률 : ${i.attendance_rate}%</small></td>
											</tr>
										</c:forEach>
									</tbody>
								</c:when>
								<c:otherwise>
									<tbody>
									<c:forEach items ="${RegistedLecture}" var="i">
											<tr>
												<th scope="row"><a href="./LectureDetail?l_code=${i.l_code}">${i.l_name}</a></th>
												<td>${i.t_nickname}</td>
												<td><small>출석률 : ${i.attendance_rate}%</small></td>
											</tr>
									</c:forEach>
									<c:forEach var="i" begin="0" end="${4 - fn:length(RegistedLecture)}">
											<tr>
												<td colspan="3"> .</td>
												<td></td>
												<td></td>
											</tr>
									</c:forEach>
								</tbody>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
						<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">최근들은
							강의</div>
						<table class="table" style="text-align: center;">
							<c:choose>
								<c:when test="${fn:length(RecentVideo) eq 0}">
									<thead\>
										<tr>
											<th>최근에 들은 강의가 없어요</th>
											<c:forEach var="i" begin="0" end="${3 - fn:length(RecentVideo)}">
											<tr>
												<td> .</td>
											</tr>
										</c:forEach>
										</tr>
									</thead>
								</c:when>
								<c:when test="${fn:length(RecentVideo) >= 5}">
									<tbody>
										<c:forEach items="${RecentVideo}" var="i" begin ="0" end = "4">
											<tr>
												<th scope="row">${i.l_name}</th>
												<td>${i.t_nickname}</td>
												<td><small><a href="./LectureVideo?v_no=${i.v_no}">${i.v_videotitle}</a></small></td>
												<td><small>${i.va_date}</small></td>
											</tr>
										</c:forEach>
									</tbody>
								</c:when>
								<c:otherwise>
									<tbody>
										<c:forEach items="${RecentVideo}" var="i">
											<tr>
												<th scope="row"><a href="./LectureDetail?l_code=${i.l_code}">${i.l_name}</a></th>
												<td>${i.t_nickname}</td>
												<td><small><a href="./LectureVideo?v_no=${i.v_no}">${i.v_videotitle}</a></small></td>
												<td><small>${i.va_date}</small></td>
											</tr>
										</c:forEach>
										<c:forEach var="i" begin="0" end="${4 - fn:length(RecentVideo)}">
											<tr>
												<td colspan="4"> .</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
						<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">내
							질문</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">First</th>
									<th scope="col">Last</th>
									<th scope="col">Handle</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td colspan="2">Larry the Bird</td>
									<td>@twitter</td>
								</tr>
							</tbody>
						</table>
						
					</div>
					<div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
						<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">최근 온 쪽지</div>
							<table class="table" style="text-align: center;">
							<c:choose>
								<c:when test="${fn:length(RecentMessage) eq 0}">
									<thead\>
										<tr>
											<th>최근에 온 쪽지가 없어요</th>
											<c:forEach var="i" begin="0" end="${3 - fn:length(RecentMessage)}">
											<tr>
												<td> .</td>
											</tr>
										</c:forEach>
										</tr>
									</thead>
								</c:when>
								<c:when test="${fn:length(RecentMessage) >= 5}">
									<tbody>
										<c:forEach items="${RecentMessage}" var="i" begin ="0" end = "4">
											<tr>
												<th scope="row">${i.from_nickname}</th>
												<td>${i.le_content}</td>
												<td><small>${i.le_date}</small></td>
											</tr>
										</c:forEach>
									</tbody>
								</c:when>
								<c:otherwise>
									<tbody>
										<c:forEach items="${RecentMessage}" var="i">
											<tr>
												<th scope="row">${i.from_nickname}</th>
												<td>${i.le_content}</td>
												<td><small>${i.le_date}</small></td>
											</tr>
										</c:forEach>
										<c:forEach var="i" begin="0" end="${4 - fn:length(RecentMessage)}">
											<tr>
												<td colspan="3"> .</td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
	</c:choose>