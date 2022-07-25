<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>러닝머신 :: ${LectureDetail.l_name}</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">

	<!-- Favicon -->
	<link href="img/favicon.ico" rel="icon">

	<!-- Google Web Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
		rel="stylesheet">

	<!-- Icon Font Stylesheet -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

	<!-- Libraries Stylesheet -->
	<link href="./resources/lib/animate/animate.min.css" rel="stylesheet">
	<link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

	<!-- Customized Bootstrap Stylesheet -->
	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">

	<!-- Template Stylesheet -->
	<link href="./resources/css/style.css" rel="stylesheet">
	<link href="./resources/css/admin.css" rel="stylesheet">

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/lib/wow/wow.min.js"></script>
	<script src="./resources/lib/easing/easing.min.js"></script>
	<script src="./resources/lib/waypoints/waypoints.min.js"></script>
	<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="./resources/js/main.js"></script>
	<style type="text/css">
		< style>@font-face {
			font-family: 'LeferiPoint-WhiteObliqueA';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}

		#rDone{
			margin: 0 auto;
		}
		body {
			font-family: LeferiPoint-WhiteObliqueA;
		}

		details {
			border-bottom: 1px solid #efefef;
			color: #666;
			font-size: 16px;
			padding: 15px;
		}

		details[open] summary {
			font-weight: 800;
		}

		details>summary {
			color: white;
			font-size: 17px;
			padding: 15px 0;
		}

		ul.tabs {
			margin: 0px;
			padding: 0px;
			list-style: none;
		}

		ul.tabs li {
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 25px;
			cursor: pointer;
		}

		ul.tabs li.current {
			background: #ededed;
			color: #222;
		}

		.tab-content {
			display: none;
		}

		.tab-content.current {
			display: flex;
		}

		.star-rating {
			width: 304px;
			height: 10px;
		}

		.star-rating,
		.star-rating span {
			display: inline-block;
			height: 55px;
			overflow: hidden;
			background: url(./img/ReviewStar.png)no-repeat;
		}

		.star-rating span {
			background-position: left bottom;
			line-height: 0;
			vertical-align: top;
		}



		.background {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100vh;
			background-color: rgba(0, 0, 0, 0.3);
			z-index: 1000;

			/* 숨기기 */
			z-index: -1;
			opacity: 0;
		}

		.show {
			opacity: 1;
			z-index: 1000;
			transition: all 0.5s;
		}

		.window {
			position: relative;
			width: 100%;
			height: 100%;
		}

		.popup {
			padding: 10px;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color: #ffffff;
			box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);

			/* 임시 지정 */
			width: 70%;
			height: 70%;

			/* 초기에 약간 아래에 배치 */
			transform: translate(-50%, -40%);
			overflow-y: auto;
		}

		.show .popup {
			transform: translate(-50%, -50%);
			transition: all 0.5s;
		}

		#closebtn {
			position: fixed;
			top: 0;
			right: 0;
			padding: 10px;
		}
	</style>

	<script type="text/javascript">
		$(document).ready(function () {

			$('ul.tabs li').click(function () {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

		});
		function OpenModal(lqa_no) {
			var OpenModal = document.querySelector(".background" + lqa_no);
			OpenModal.classList.add("show");
		}

		function CloseModal(lqa_no) {
			var CloseModal = document.querySelector(".background" + lqa_no);
			CloseModal.classList.remove("show");
		}
	</script>
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

		<jsp:include page="./header.jsp" />
		<div style="padding-top: 110px;">
			<h3>&nbsp;&nbsp;${LectureDetail.l_name} ${LectureVideos.key['1'].value.v_videotitle}</h3>
		</div>
		<div style="padding-top: 20px; text-align: center;">
		</div>
		<div class="container">
			<div class="row g-5 align-items-center">
				<div class="col-lg-6 wow zoomIn" data-wow-delay="0.1s">
					<c:choose>
						<c:when test="${sessionScope.u_id eq null || LectureDetail.payment_whether eq 0}">
							<img class="img-fluid" src="img/about.png">
						</c:when>
						<c:otherwise>
							<table class="table" style="text-align: center;">
								<thead>
									<tr>
										<th style="width: 50%">제목</th>
										<th style="width: 30%">출석</th>
										<th style="width: 20%"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${LectureVideos}" var="Map">
										<c:set var="key" value="${Map.key}" />
										<tr>
											<td>[${Map.key}강] ${Map.value.v_videotitle}</td>
											<td>
												<c:choose>
													<c:when test="${Map.value.attendance eq 1}">
														출석
													</c:when>
													<c:otherwise>
														미수강
													</c:otherwise>
												</c:choose>
											</td>
											<td><a class="btn btn-outline-light"
													style="background-color: rgba(55, 110, 92, 0.781);"
													href="./LectureVideo?v_no=${Map.value.v_no}">듣기</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
					<!-- <a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="">Read More</a> -->
					<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">${LectureDetail.l_category}
					</div>
					<h2>${LectureDetail.l_name}</h2>
					<h3 class="mb-4">강의 소개</h3>
					<h6><small>${LectureDetail.total_register}명 수강중</small>, <small>${LectureDetail.total_review}명의
							리뷰(${LectureDetail.grade_avg }점)</small></h6>
					<span class='star-rating'>
						<span style="width : ${LectureDetail.grade_avg * 20}%;"></span>
					</span>
					<p class="mb-4">${LectureDetail.l_info}</p>
					<c:if test="${sessionScope.u_id eq null}">
						<div>
							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-3">강의정보</li>
								<li class="tab-link" data-tab="tab-4">미리보기</li>
							</ul>
						</div>
					</c:if>
					<div class="row g-3 mb-4 tab-content current" id="tab-3" style="padding: 5px;">
						<div class="col-12 d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-primary">
								<i class="fa fa-chart-line text-white"></i>
							</div>
							<div class="ms-4">
								<h6>${LectureDetail.t_nickname}선생님 스펙</h6>
								<span>${LectureDetail.t_spec}</span>
							</div>
						</div>
						<div class="col-12 d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-primary">
								<i class="fa fa-money-bill-wave text-white"></i>
							</div>
							<div class="ms-4">
								<h6>${LectureDetail.l_name} 강의 가격</h6>
								<h4><strong
										style="color: red; vertical-align: middle;">${LectureDetail.l_price}</Strong>원
									</h4>
							</div>
						</div>
					</div>
					<div class="row g-3 mb-4 tab-content" id="tab-4" style="padding: 5px;">
						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th style="width: 50%">제목</th>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${LectureVideos}" var="Map" begin="0" end="2">
									<c:set var="key" value="${Map.key}" />
									<tr>
										<td>[${Map.key}강] ${Map.value.v_videotitle}</td>
										<td><a class="btn btn-outline-light"
												style="background-color: rgba(55, 110, 92, 0.781);"
												href="./LectureVideo?v_no=${Map.value.v_no}">듣기</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<c:choose>
						<c:when test="${sessionScope.u_id eq null}">
							<a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="./Pay?l_code=${LectureDetail.l_code}">결제하기</a>
							<a href=" ./Wish?l_code=${LectureDetail.l_code}" class="btn btn-outline-light rounded-pill border-2 py-3 px-5 animated slideInRight"
									style="color: gray;">찜하기</a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${LectureDetail.payment_whether eq 1}">
									<a href="./LectureVideo?v_no=${FirstVideo}"
										class="btn btn-outline-light rounded-pill border-2 py-3 px-5 animated slideInRight"
										style="color: gray;">처음부터 듣기</a>
									<c:if test="${RecentVideo > 0}">
										<a class="btn btn-primary rounded-pill py-3 px-5 mt-2"
											href="./LectureVideo?v_no=${RecentVideo}">이어듣기</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="./Pay?l_code=${LectureDetail.l_code}">결제하기</a>
									<a href=" ./Wish?l_code=${LectureDetail.l_code}" class="btn btn-outline-light rounded-pill border-2 py-3 px-5 animated slideInRight"
										style="color: gray;">찜하기</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- Call to Action-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">${LectureDetail.l_curriculum}</p>
			</div>
		</div>
		<!-- Content Row-->
		<div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">강의 리뷰</li>
				<li class="tab-link" data-tab="tab-2">강의 Q&A</li>
			</ul>
		</div>
		<div class="row tab-content current" id="tab-1">
			<!-- 로그인 되어있으면서 결제가 된 강의라면 리뷰 남기기 버튼 및 창 생성 -->
			<c:if test="${sessionScope.u_id ne null && LectureDetail.payment_whether eq 1}">
				<a class="btn btn-primary" role="button" onclick="OpenModal('Review${LectureDetail.l_code}')"
					style="width: 120px; margin: 4px auto; right: 0;">리뷰남기기</a>
				<div class="background backgroundReview${LectureDetail.l_code}">
					<div class="window">
						<div class="popup">
							<button id="closebtn" onclick="CloseModal('Review${LectureDetail.l_code}');">닫기</button>
							입력창들
						</div>
						<div>
							<div></div>
						</div>
					</div>
				</div>
			</c:if>
			<div class="row gx-4 gx-lg-5" style="margin: 0 auto;">
				<c:forEach items="${LectureReviews}" var="i">
					<div class="col-md-4 mb-5" style="height: 330px;">
						<div class="card h-100">
							<div class="card-body">
								<h2 class="card-title">${i.lr_title }</h2>
								<h6>${i.u_nickname} / <small style="color: rgb(51, 179, 211);">${i.lr_grade}점</small>
								</h6>
								<c:set var="content" value="${i.lr_content}" />
								<c:choose>
									<c:when test="${fn:length(content) < 100}">
										<p class="card-text">${i.lr_content}</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">
											${fn:substring(content,0,101)}
										</p>
										<button onclick="OpenModal('${i.u_id}');">자세히 보기</button>
										<div class="background background${i.u_id}">
											<div class="window">
												<div class="popup">
													<button id="closebtn" onclick="CloseModal('${i.u_id}');">닫기</button>
													<h2 class="card-title">${i.lr_title}</h2>
													<h6>${i.u_nickname}</h6>
													<p class="card-text">${i.lr_content}</p>
												</div>
												<div>
													<div></div>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="card-footer">
								<h6><small>${i.lr_date}</small></h6>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row tab-content" id="tab-2">
			<c:if test="${sessionScope.u_id ne null}">
				<a class="btn btn-primary" role="button" onclick="OpenModal('qna${LectureDetail.l_code}')"
					style="width: 120px; margin: 4px auto; right: 0;">질문하기</a>
				<div class="background backgroundqna${LectureDetail.l_code}">
					<div class="window">
						<div class="popup">
							<button id="closebtn" onclick="CloseModal('qna${LectureDetail.l_code}');">닫기</button>
							질문입력창
						</div>
						<div>
							<div></div>
						</div>
					</div>
				</div>
			</c:if>
			<div class="row gx-4 gx-lg-5" style="margin: 0 auto;">
				<c:forEach items="${LectureQnas}" var="i">
					<!-- 질문과 답변 모달창 -->
					<div class="background background${i.lqa_no}${i.u_id}">
						<div class="window">
							<div class="popup">
								<button id="closebtn" onclick="CloseModal('${i.lqa_no}${i.u_id}');">닫기</button>
								<h2 class="card-title">답변된 질문</h2>
								${i.lqar_title}<br>
								${i.lqar_content}
							</div>
							<div>
								<div></div>
							</div>
						</div>
					</div>
					<!--/ 질문과 답변 모달창 -->
					<div class="col-md-4 mb-5" style="height: 330px;">
						<div class="card h-100">
							<div class="card-body">
								<c:if test="${i.lqa_confirm eq 1}">
									<div id="rDone" class="d-inline-block border rounded-pill text-primary px-4 mb-3">답변완료</div>
								</c:if>
								<h2 class="card-title">${i.lqa_title}</h2>
								<h6>${i.u_nickname}</h6>
								<c:set var="content" value="${i.lqa_content}" />
								<c:choose>
									<c:when test="${fn:length(content) < 100}">
										<p class="card-text">${i.lqa_content}</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">
											${fn:substring(content,0,101)}
										</p>
									</c:otherwise>
								</c:choose>
								<c:if test="${i.lqa_confirm eq 1}">
									<button onclick="OpenModal('${i.lqa_no}${i.u_id}');">답변 보기</button>
								</c:if>
							</div>
							<div class="card-footer">
								<h6><small>${i.lqa_date}</small></h6>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="./team.jsp" /> --%>
	<jsp:include page="./footer.jsp" />


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
	<script type="text/javascript">
		$('body > ul > li').click(function () {
			if ($(this).hasClass('active')) {
				$(this).find(' > ul').stop().slideUp(300);
				$(this).removeClass('active');
			} else {
				$(this).find(' > ul').stop().slideDown(300);
				$(this).addClass('active');
			}
		});
	</script>
</body>

</html>