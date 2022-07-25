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
		.dropdown {
			position: fixed;
			display: inline-block;
			z-index: 100;
			margin: auto;
			display: inline-block;
		}

		.dropbtn_icon {
			font-family: 'Material Icons';
		}

		.dropbtn {
			border: 1px solid rgb(37, 37, 37);
			border-radius: 4px;
			background-color: #f5f5f5;
			text-align: center;
			font-weight: 400;
			color: rgb(37, 37, 37);
			padding: 12px;
			width: 50px;
			cursor: pointer;
			font-size: 12px;
		}

		.dropdown-content {
			display: none;
			position: absolute;
			z-index: 1;
			/*다른 요소들보다 앞에 배치*/
			font-weight: 400;
			background-color: #f9f9f9;
			min-width: 200px;
		}

		.dropdown-content a {
			display: block;
			text-decoration: none;
			color: rgb(37, 37, 37);
			font-size: 12px;
			padding: 12px 20px;
		}

		.dropdown-content a:hover {
			background-color: #ececec
		}

		.dropdown:hover .dropdown-content {
			display: block;
		}

		#video {
			position: relative;
			height: 0;
			padding-bottom: 56.25%
		}

		iframe {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
		}
	</style>
</head>

<body>
	<div class="dropdown">
		<button class="dropbtn">
			<span class="dropbtn_icon">=</span>
		</button>
		<div class="dropdown-content">
			<a onclick="javascript:history.back()">뒤로가기</a>
			<a href="#">write a post</a>
			<a href="#">settings</a>
		</div>
	</div>
	<div id="video">
		<iframe src="https://www.youtube.com/embed/${Video.v_root}" title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	</div>
	${Video}<br><br><br>
	${VideoQnas}
</body>

</html>