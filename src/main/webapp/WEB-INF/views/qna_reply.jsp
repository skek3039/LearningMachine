<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <style>@font-face {
        font-family: 'LeferiPoint-WhiteObliqueA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
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

    details > summary {
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
		<div style=" width: 100%; height: 705px;">
		 <jsp:include page="./lecture_nav.jsp"/>
		<div style="padding-top: 110px;"></div>
		<div style="padding-top: 10px; padding-left: 400px">
				<table>
					<tr>
						<th><svg width="26px" height="26px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#00C471" fill-rule="evenodd" clip-rule="evenodd" d="M 11.742188 12.886719 C 10.707031 13.679688 9.40625 14.152344 8 14.152344 C 4.601562 14.152344 1.847656 11.398438 1.847656 8 C 1.847656 4.601562 4.601562 1.847656 8 1.847656 C 11.398438 1.847656 14.152344 4.601562 14.152344 8 C 14.152344 9.324219 13.734375 10.550781 13.023438 11.554688 L 11.101562 9.632812 C 10.742188 9.273438 10.15625 9.273438 9.796875 9.632812 C 9.433594 9.992188 9.433594 10.578125 9.796875 10.9375 Z M 13.054688 14.199219 C 11.679688 15.324219 9.917969 16 8 16 C 3.582031 16 0 12.417969 0 8 C 0 3.582031 3.582031 0 8 0 C 12.417969 0 16 3.582031 16 8 C 16 9.835938 15.382812 11.527344 14.34375 12.875 L 15.511719 14.042969 C 15.871094 14.402344 15.871094 14.988281 15.511719 15.347656 C 15.148438 15.707031 14.566406 15.707031 14.203125 15.347656 Z M 13.054688 14.199219"></path></svg>
						<td style="padding-top: 10px; word-break:break-all; width: 750px"><h5>제목</h5></td>
					</tr>
					<tr>
						<td><h6>작성자.</h6></td><td><h6>작성일</h6></td>
					</tr></table><br>
					<table>
					<tr>
						<td style="word-break:break-all; width: 820px">내용</td>
					</tr>
						
					
					</table>
					<hr style="width: 820px; height: 2px;"><br>
				<div id="writeform" style="padding-right: 100px;">
				<form action="./write" method="post" onsubmit="return check();" enctype="multipart/form-data">
					<input style="width: 820px;" type="text" name="title" required="required">
					<textarea name="content" id="summernote" required="required" ></textarea>
					<input type="hidden" name="b_cate" value="">
					<button type="submit" style="float:right;">답변등록</button>
				</form>
			</div>
		</div>

</div>
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
<script>
$(document).ready(function() {$("#summernote").summernote({height : 200});});
</script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</html>