<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Learning Machine</title>
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
<script type="text/javascript">
	function linkPage(pageNo) {
		location.href = "./qna?pageNo=" + pageNo;
	}
</script>
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
		<div style="width: 100%; height: 800px;">
			<jsp:include page="./notice_nav.jsp" />
			<div style="padding-top: 110px;">
				<h3>&nbsp;&nbsp;회사소개</h3>
				<hr style="border: solid 1px;">
			</div>
			<div>
				<div style="padding-top: 10px;">
					<table class="table table-bordered table-sm"
						style="width: 900px; margin: 0 auto; text-align: center;">
						<h2>&nbsp;&nbsp;Learning Machine</h2>
							<h6>&nbsp;&nbsp;러닝을 관리하는 팀과 우리가 왜 이 프로젝트를 시작했는지, 그리고 어떻게 참여할 수 있는지에 대해서 알아보세요.</h6><hr><br>
						<h3><img style="width: 50px; height: 50px; "src="./img/ggg.png">회사의 첫인상</h3>
						<h6>&nbsp;&nbsp;인간 관계에서 사람의 첫인상은 참 중요하죠.첫인상에 따라서 친구가 될 수도 있고 이유없는 미움을 받기도 합니다.회사도
						마찬가지라 봅니다. 좋은 회사, 나쁜 회사이기 이전에 어떤 회사인지 보여주는 일, 이것이 바로 비즈니스의 시작이 아닐 까
						싶습니다. 그럼 저희 은 어떤 회사인지 활짝 웃으며 첫인사를 드립니다.</h6><br><hr>
						<h3><img style="width: 50px; height: 50px; "src="./img/fff.png">행복경영의 시작</h3>
						<h6>&nbsp;&nbsp;여러분, 사랑하는 사람의 얼굴을 자세히 들여다보면 어떤 느낌이 드십니까? 마음이 편안하고 행복하고 미소가 지어지지요?
						저희 도 그렇게 여러분의 얼굴에 미소와 함께 행복을 드리고 싶습니다. 함께 웃고 함께 즐거워하고 함께 꿈을 꾸고
						싶습니다. 이것이 저희 행복경영의 시작이기 때문입니다.</h6><br><hr>
						<h3><img style="width: 50px; height: 50px; "src="./img/aaa.png">더 높은 곳을 향해가기 위한 자리</h3>
						<h6>&nbsp;&nbsp;안녕하세요? 저희 회사에서 이렇게 고귀한 분들을 모시고 ir을 개최하게 되어 영광입니다. 그동안 저희가 준비해왔고
						이루고자 하는 일들이 많았지만 이제 더 큰 날개를 달고 더 높은 곳을 향해 가기 위해서 오늘 자리를 마련하였습니다.</h6><br><hr>
					</table>
				</div>
			</div>

		</div>
		<%-- <jsp:include page="./team.jsp"/> --%>
		<jsp:include page="./footer.jsp" />


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
		
	</div>

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
</body>

</html>