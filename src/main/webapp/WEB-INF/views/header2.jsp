<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.u_id eq null }">
		<div class="container-xxl bg-primary hero-header">
			<div class="container">
				<div class="row g-5 align-items-center">
					<div class="col-lg-6 text-center text-lg-start">
						<h1 class="text-white mb-4 animated zoomIn">Learning Machine</h1>
						<p class="text-white pb-3 animated zoomIn">나누는 보람만큼 커지는 보상</p>
						<a href=""
							class="btn btn-outline-light rounded-pill border-2 py-3 px-5 animated slideInRight">Learn
							More</a>
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
						<div
							class="d-inline-block border rounded-pill text-primary px-4 mb-3">최근들은
							강의</div>
							${RecentVideo}
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
						<div
							class="d-inline-block border rounded-pill text-primary px-4 mb-3">내
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
						<div
							class="d-inline-block border rounded-pill text-primary px-4 mb-3">쪽지</div>
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
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>