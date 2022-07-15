<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="./resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="./resources/css/style.css" rel="stylesheet">
<link href="./resources/css/admin.css" rel="stylesheet">

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="./resources/lib/wow/wow.min.js"></script>
<script src="./resources/lib/easing/easing.min.js"></script>
<script src="./resources/lib/waypoints/waypoints.min.js"></script>
<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="./resources/js/main.js"></script>
<style type="text/css">
<
style
>
@font-face {
	font-family: 'LeferiPoint-WhiteObliqueA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
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
</style>
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

		<jsp:include page="./header.jsp" />
		<div style="padding-top: 110px;">
			<h3>&nbsp;&nbsp;${LectureDetail.l_name}</h3>
			<hr style="border: solid 1px;">
		</div>
		<div style="padding-top: 20px; text-align: center;">
		</div>
		<div class="container">
			<div class="row g-5 align-items-center">
				<div class="col-lg-6 wow zoomIn" data-wow-delay="0.1s">
					<img class="img-fluid" src="img/about.png">
				</div>
				<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
					<!-- <a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="">Read More</a> -->
					<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">${LectureDetail.l_category}</div>
					<h2>${LectureDetail.t_nickname}</h2><h3 class="mb-4">선생님 소개</h3>
					<p class="mb-4">${LectureDetail.t_spec}</p>
					<div class="row g-3 mb-4">
						<div class="col-12 d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-primary">
								<i class="fa fa-chart-line text-white"></i>
							</div>
							<div class="ms-4">
								<h6>Financial Analaysis</h6>
								<span>Tempor erat elitr rebum at clita. Diam dolor ipsum amet eos erat ipsum lorem et sit sed stet lorem sit clita duo</span>
							</div>
						</div>
						<div class="col-12 d-flex">
							<div class="flex-shrink-0 btn-lg-square rounded-circle bg-primary">
								<i class="fa fa-money-bill-wave text-white"></i>
							</div>
							<div class="ms-4">
								<h4><strong style="color: red; vertical-align: middle;">${LectureDetail.l_price}</Strong>원</h6>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${sessionScope.u_id eq null}">
							결재하기 찜하기(로그인)
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${LectureDetail.payment_whether eq 1}">
									<a href="./LetureVideo?v_no=${LectureVideos['1'].v_no}"
							class="btn btn-outline-light rounded-pill border-2 py-3 px-5 animated slideInRight"  style="color: gray;">처음부터 듣기</a>
									<c:if test="${RecentVideo > 0}">
										<a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="./LectureVideo?v_no=${RecentVideo}">이어듣기</a>
									</c:if>
								</c:when>
								<c:otherwise>
									결재하기 찜하기
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- Call to Action-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body"><p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p></div>
		</div>
		<!-- Content Row-->
		<div class="row gx-4 gx-lg-5">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">리뷰</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
					</div>
					<div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Three</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
				</div>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="./team.jsp"/> --%>
	<jsp:include page="./footer.jsp" />


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	<script type="text/javascript">
		$('body > ul > li').click(function() {
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