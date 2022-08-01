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
	<script src="./resources/summernote/summernote-lite.js"></script>
	<script src="./resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
	<!-- Template Javascript -->
	<script src="./resources/js/main.js"></script>
	<style type="text/css">
		#rDone {
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

		.star-rating1 {
			width: 304px;
			height: 10px;
		}

		.star-rating1,
		.star-rating1 span {
			display: inline-block;
			height: 55px;
			overflow: hidden;
			background: url(./img/ReviewStar.png)no-repeat;
		}

		.star-rating1 span {
			background-position: left bottom;
			line-height: 0;
			vertical-align: top;
		}

		.star-rating {
			display: flex;
			flex-direction: row-reverse;
			font-size: 2.25rem;
			line-height: 2.5rem;
			justify-content: space-around;
			padding: 0 0.2em;
			text-align: center;
			width: 5em;
		}

		.star-rating input {
			display: none;
		}

		.star-rating label {
			-webkit-text-fill-color: transparent;
			/* Will override color (regardless of order) */
			-webkit-text-stroke-width: 2.3px;
			-webkit-text-stroke-color: #2b2a29;
			cursor: pointer;
		}

		.star-rating :checked~label {
			-webkit-text-fill-color: gold;
		}

		.star-rating label:hover,
		.star-rating label:hover~label {
			-webkit-text-fill-color: #fff58c;
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

		#ubutton {

			width: 24px;
		}

		.btn .btn-outline-light{
			border: rgb(100, 89, 89);
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

			$('.summernote').summernote({
				placeholder: 'content',
				minHeight: 370,
				maxHeight: null,
				focus: true,
				lang: 'ko-KR'
			});
		});
		function OpenModal(lqa_no) {
			var OpenModal = document.querySelector(".background" + lqa_no);
			OpenModal.classList.add("show");
		}

		function CloseModal(lqa_no) {
			var CloseModal = document.querySelector(".background" + lqa_no);
			CloseModal.classList.remove("show");
		}

		function LectureQNASubmit() {

			var lqa_title = $('input[name=lqa_title]').val();
			var lqa_content = $('textarea[name="lqa_content"]').summernote('code');
			$.ajax({

				type: "post",
				url: "/web/LectureQnaWrite.do?l_code=" + '${LectureDetail.l_code}',
				data: {
					lqa_title: lqa_title,
					lqa_content: lqa_content
				},
				success: function () {

					window.location.reload();
				},
				error: function () {
					alert('머선 일이고');
				}
			}).done(function (result) {
				if (result == 1) {
					$('input[name=lqa_title]').val("");
					alert('질문이 등록되었습니다');
					CloseModal('qna');
				} else if (result == 0) {

					alert('권한이 없습니다.');
					CloseModal('qna');
				} else if (result == 2) {

					alert('질문은 최대 3개만 올릴 수 있습니다.');
					CloseModal('qna');
				}
			});
		}

		function LectureReviewSubmit() {

			var lr_title = $('input[name=lr_title]').val();
			var lr_content = $('textarea[name="lr_content"]').summernote('code');
			var lr_grade = $("input[type=radio][name='rating']:checked").val();
			$.ajax({

				type: "post",
				url: "/web/LectureReviewWrite.do?l_code=" + '${LectureDetail.l_code}',
				data: {
					lr_title: lr_title,
					lr_content: lr_content,
					lr_grade : lr_grade
				},
				success: function () {

					window.location.reload();
				},
				error: function () {
					alert('머선 일이고');
				}
			}).done(function (result) {
				if (result == 1) {
					$('input[name=lr_title]').val("");
					alert('리뷰가 등록되었습니다');
					CloseModal('Review');
				} else if (result == 0) {

					alert('권한이 없습니다.');
					CloseModal('Review');
				} else if (result == 2) {

					alert('이미 리뷰를 등록했습니다.');
					CloseModal('Review');
				}
			});
		}

		function LectureReviewRemove(u_id) {
				if (confirm("리뷰를 삭제하시겠습니까? 리뷰를 삭제하면 다시 리뷰를 작성할 수 없습니다.")) {
					$.ajax({

						type: "post",
						url: "/web/LectureReviewRemove.do?l_code=" + '${LectureDetail.l_code}',
						data :{
							u_id : u_id
						},
						success: function () {

							window.location.reload();
						},
						error: function () {
							alert('머선 일이고');
						}
					}).done(function (result) {

						if(result == 0){

							alert('삭제 권한이 없습니다.');
						}else{
							
							alert('리뷰가 삭제되었습니다');
						}
					});
				}
			}
		
		function LectureReviewEdit(u_id){

			var lr_title = $('input[name="Elr_title"]').val();
			var lr_content = $('textarea[name="Elr_content"]').summernote('code');
			
			$.ajax({

				type: "post",
				url: "/web/LectureReviewEdit.do?l_code=" + '${LectureDetail.l_code}',
				data: {
					u_id : u_id,
					lr_title: lr_title,
					lr_content: lr_content
				},
				success: function () {

					window.location.reload();
				},
				error: function () {
					alert('머선 일이고');
				}
			}).done(function (result) {
				if (result == 1) {
					alert('리뷰가 수정이 완료되었습니다');
					CloseModal('ReviewEdit');
				} else if (result == 0) {

					alert('권한이 없습니다.');
					CloseModal('ReviewEdit');
				}
			});
		}

		function LectureQnaRemove(lqa_no) {
				if (confirm("질문을 삭제하시겠습니까?")) {
					$.ajax({

						type: "post",
						url: "/web/LectureQnaRemove.do?lqa_no=" + lqa_no,
						error: function () {
							alert('머선 일이고');
						}
					}).done(function (result) {
						if (result == 1) {
							alert('질문이 삭제되었습니다');
						} else if (result == 0) {
							alert('삭제 권한이 없습니다.');
						}
						window.location.reload();
					});
				}
			}
		
		function LectureQnaEdit(lqa_no){

			var lqa_title = $('input[name=' + lqa_no + 'lqa_title]').val();
			var lqa_content = $('textarea[name=' + lqa_no + 'lqa_content]').summernote('code');
			$.ajax({

				type: "post",
				url: "/web/LectureQnaEdit.do?lqa_no=" + lqa_no,
				data: {
					lqa_title: lqa_title,
					lqa_content: lqa_content
				},
				error: function () {
					alert('머선 일이고');
				}
			}).done(function (result) {
				if (result == 1) {
					alert('질문 수정이 완료되었습니다');
					CloseModal('QnaEdit' + lqa_no);
				} else if (result == 0) {

					alert('수정 권한이 없습니다.');
					CloseModal('QnaEdit' + lqa_no);
				}
			});
			window.location.reload();
		}

		function WishAdd(l_code, wish){
			$.ajax({

				type: "post",
				url: "/web/addwish?l_code=" + l_code,
				success: function () {

					window.location.reload();
				},
				error: function () {
					alert('머선 일이고');
				}
			}).done(function (result) {
				if (result == 1 && wish == 0) {
					alert('강의를 찜했습니다');
				} else if(result == 1&& wish == 1){
					alert('찜을 취소했습니다');
				} else if (result == 0) {

					alert('권한이 없습니다.');
					CloseModal('Review');
				}
			});
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
		<jsp:include page="./componentMSG.jsp" />
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
							<c:choose>
								<c:when test="${LectureDetail.l_thumbnail eq null}">
									<img class="img-fluid" src="./resources/img/spring.png" width="100%">
								</c:when>
								<c:otherwise>
									<img class="img-fluid" src="${LectureDetail.l_thumbnail}" width="100%">
								</c:otherwise>
							</c:choose>
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
					<h3 class="mb-4">강의 소개<img src="./resources/img/letter.png" onclick = "mopenmodal('${LectureDetail.t_id}')" style="width: 24px;"></h3>
					<h6><small>${LectureDetail.total_register}명 수강중</small>, <small>${LectureDetail.total_review}명의
							리뷰(${LectureDetail.grade_avg }점)</small></h6>
					<span class='star-rating1'>
						<span style="width : ${LectureDetail.grade_avg * 20}%;"></span>
					</span>
					<p class="mb-4">${LectureDetail.l_info}</p>
					<c:if test="${LectureDetail.payment_whether eq 0}">
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
							<a class="btn btn-primary rounded-pill py-3 px-5 mt-2"
								href="./Pay?l_code=${LectureDetail.l_code}">결제하기</a>
							<img src="./resources/img/empty_heart.png" onclick="location.href = './login'">
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
									<a class="btn btn-primary rounded-pill py-3 px-5 mt-2"
										href="./Pay?l_code=${LectureDetail.l_code}">결제하기</a>
										<c:choose>
											<c:when test="${LectureDetail.wish eq 0}">
												<img src="./resources/img/empty_heart.png" onclick="WishAdd('${LectureDetail.l_code}', '${LectureDetail.wish}')">
											</c:when>
											<c:otherwise>
												<img src="./resources/img/heart.png" onclick="WishAdd('${LectureDetail.l_code}', '${LectureDetail.wish}')">
											</c:otherwise>
										</c:choose>
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
			<!-- 리뷰남기기 -->
			<c:if test="${sessionScope.u_id ne null && LectureDetail.payment_whether eq 1}">
				<a class="btn btn-primary" role="button" onclick="OpenModal('Review')"
					style="width: 120px; margin: 4px auto; right: 0;">리뷰남기기</a>
				<div class="background backgroundReview">
					<div class="window">
						<div class="popup">
							<a class="btn btn-outline-light"  id="closebtn"  style="color: black; margin : 4px;"onclick="CloseModal('Review');">닫기</a>
							<form>
								<div class="row g-3">
									<div class="col-md-6">
										<div class="form-floating">
											<input type="text" class="form-control" id="name" name="lr_title" placeholder="리뷰 제목">
											<label for="name">제목</label>
										</div>
									</div>
									<textarea class="summernote" id="message" name="lr_content"
										style="height: 150px; resize: none; z-index: 1100;"></textarea>
									<div class="star-rating space-x-4 mx-auto">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" />
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" />
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" checked />
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" />
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" type="button"
										onclick="LectureReviewSubmit()">리뷰 제출하기</button>
								</div>
							</form>
						</div>
						<div>
							<div></div>
						</div>
					</div>
				</div>
			</c:if>

			<div class="row gx-4 gx-lg-5" style="margin: 0 auto;" id="reviewtab">
				<c:forEach items="${LectureReviews}" var="i">
					<div class="col-md-4 mb-5" style="height: 330px;">
						<div class="card h-100">
							<div class="card-body">
								<h2 class="card-title">${i.lr_title }
									<c:if test="${i.u_id eq sessionScope.u_id}">
										<img id="ubutton" src="./resources/img/Uremove.png" onclick="LectureReviewRemove('${i.u_id}');">
										<img id="ubutton" src="./resources/img/Uedit.png" onclick="OpenModal('ReviewEdit');">
										<!-- 리뷰는 강의 당 하나이므로 하나의 모달창 생성 -->
										<div class="background backgroundReviewEdit">
											<div class="window">
												<div class="popup">
													<a class="btn btn-outline-light"  id="closebtn" style="color: black; margin : 4px;" onclick="CloseModal('ReviewEdit');">닫기</a>
													<form>
														<div class="row g-3">
															<div class="col-md-6">
																<div class="form-floating">
																	<input type="text" class="form-control" id="name"
																		name="Elr_title" placeholder="리뷰 제목" value="${i.lr_title}">
																</div>
															</div>
															<textarea class="summernote" id="message" name="Elr_content"
																style="height: 150px; resize: none; z-index: 1100;">${i.lr_content}</textarea>
														</div>
														<div class="col-12">
															<button class="btn btn-primary w-100 py-3" type="button"
																onclick="LectureReviewEdit('${i.u_id}')">리뷰 수정하기</button>
														</div>
													</form>
												</div>
												<div>
													<div></div>
												</div>
											</div>
										</div>
									</c:if>
								</h2>
								<h6>${i.u_nickname} / <small style="color: rgb(51, 179, 211);">${i.lr_grade}점</small>
								</h6>
								<c:set var="content" value="${i.lr_content}" />
								<c:choose>
									<c:when test="${fn:length(content) < 100}">
										<p class="card-text">${i.lr_content}</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">
											<c:out value="${fn:substring(content,0,101).replaceAll('\\\<.*?\\\>','')}" />
										</p>
										<a class="btn btn-outline-light" style="color: black; margin : 4px;"onclick="OpenModal('${i.u_id}');">자세히 보기</a>
										<div class="background background${i.u_id}">
											<div class="window">
												<div class="popup">
													<a class="btn btn-outline-light" style="color: black; margin : 4px;" id = "closebtn"onclick="CloseModal('${i.u_id}');">닫기</a>
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
			<!-- 질문하기 모달창 : 결제 안한사람도 질문할 수 있으므로 로그인 여부에 따라 띄워줄지 결정 -->
			<c:if test="${sessionScope.u_id ne null}">
				<a class="btn btn-primary" role="button" onclick="OpenModal('qna')"
					style="width: 120px; margin: 4px auto; right: 0;">질문하기</a>
				<div class="background backgroundqna">
					<div class="window">
						<div class="popup">
							<a class="btn btn-outline-light"  id="closebtn" style="color: black; margin : 4px;" onclick="CloseModal('qna');">닫기</a>
							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-floating">
										<input type="text" class="form-control" id="name" name="lqa_title"
											placeholder="질문 제목">
										<label for="name">제목</label>
									</div>
								</div>
								<textarea class="summernote" id="message"
									style="height: 150px; resize: none; z-index: 1100;" name="lqa_content"></textarea>
							</div>
							<div class="col-12">
								<button class="btn btn-primary w-100 py-3" type="button" onclick="LectureQNASubmit()">질문
									제출하기</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!--/ 질문하기 모달창 -->
			<div class="row gx-4 gx-lg-5" style="margin: 0 auto;" id="qnatab">
				<c:forEach items="${LectureQnas}" var="i">
					<!-- 질문과 답변 모달창 -->
					<div class="background background${i.lqa_no}${i.u_id}">
						<div class="window">
							<div class="popup">
								<a class="btn btn-outline-light" id="closebtn" style="color: black; margin : 4px;"onclick="CloseModal('${i.lqa_no}${i.u_id}');">닫기</a>
								<h2 class="card-title">질문</h2>
								<h6>제목 : ${i.lqa_title}<br></h6>
								<h6>내용 : ${i.lqa_content}</h6>
								<h2 class="card-title">답변</h2>
								<h6>제목 : ${i.lqar_title}<br></h6>
								<h6>내용 : ${i.lqar_content}</h6>

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
									<div id="rDone" class="d-inline-block border rounded-pill text-primary px-4 mb-3">
										답변완료</div>
								</c:if>
								<h2 class="card-title">${i.lqa_title}
									<c:if test="${i.u_id eq sessionScope.u_id}">
										<img id="ubutton" src="./resources/img/Uremove.png" onclick="LectureQnaRemove('${i.lqa_no}')">
									</c:if>
									<c:if test="${i.u_id eq sessionScope.u_id && i.lqa_confirm eq 0}">
										<img id="ubutton" src="./resources/img/Uedit.png" onclick="OpenModal('QnaEdit${i.lqa_no}')">
										<div class="background backgroundQnaEdit${i.lqa_no}">
											<div class="window">
												<div class="popup">
													<a class="btn btn-outline-light"  id="closebtn"  style="color: black; margin : 4px;" onclick="CloseModal('QnaEdit${i.lqa_no}');">닫기</a>
													<form>
														<div class="row g-3">
															<div class="col-md-6">
																<div class="form-floating">
																	<input type="text" class="form-control" id="name"
																		name="${i.lqa_no}lqa_title" placeholder="질문 제목" value="${i.lqa_title}">
																</div>
															</div>
															<textarea class="summernote" id="message" name="${i.lqa_no}lqa_content"
																style="height: 150px; resize: none; z-index: 1100;">${i.lqa_content}</textarea>
														</div>
														<div class="col-12">
															<button class="btn btn-primary w-100 py-3" type="button"
																onclick="LectureQnaEdit('${i.lqa_no}')">질문 수정하기</button>
														</div>
													</form>
												</div>
												<div>
													<div></div>
												</div>
											</div>
										</div>
									</c:if>
								</h2>
								<h6>${i.u_nickname}</h6>
								<c:set var="content" value="${i.lqa_content}" />
								<c:choose>
									<c:when test="${fn:length(content) < 101}">
										<p class="card-text">${i.lqa_content}</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">
											<c:out value="${fn:substring(content,0,51).replaceAll('\\\<.*?\\\>','')}"></c:out>
										</p>
									</c:otherwise>
								</c:choose>
								<c:if test="${i.lqa_confirm eq 1}">
									<a class="btn btn-outline-light" style="color: black; margin : 4px;" onclick="OpenModal('${i.lqa_no}${i.u_id}');">답변 보기</a>
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