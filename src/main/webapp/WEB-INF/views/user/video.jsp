<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>러닝머신 :: ${Video.v_videotitle }</title>
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

	<style>
		body {
			margin: 0;
			/*body의 바깥 여백을 없앰으로서 내비게이션 바가 페이지에 바짝 붙게 함*/
		}

		.nav-container {
			display: flex;
			flex-direction: row;
			width: 100%;
			margin: 0;
			/*쓸 데 없는 공백 제거*/
			padding: 0;
			/*쓸 데 없는 공백 제거*/
			background-color: rgb(114, 231, 110);
			list-style-type: none;
			/*목록 기호 제거*/
		}

		.nav-item {
			padding: 15px;
		}

		.nav-item a {
			/*nav-item 클래스 아래의 a 요소를 선택함*/
			text-align: center;
			text-decoration: none;
			/*밑줄 없앰*/
			color: black;
		}

		#v_videotitle{
			vertical-align: middle;
			text-align: center;
			color: white;
		}

		#video{
			position: relative;
   			height: 0;
    		padding-bottom: 56.25%
		}
		
		iframe{
			position: absolute;
  			top: 0;
   			left: 0;
   			width: 100%;
  		  	height: 100%;
		}
	</style>
</head>

<body>
	<nav style="text-align: center;">
		<ul class="nav-container">
			<li class="nav-item"> <a href="javascript:history.back()">뒤로가기</a> </li>
			<li class="nav-item" id="v_videotitle">${Video.v_videotitle}</li>
		</ul>
	</nav>
	<div id="video">
		<iframe src="https://www.youtube.com/embed/${Video.v_root}" title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	</div>
	${Video}
</body>

</html>