<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<c:forEach items="${qna_answer_detail}" var="q">
					<tr>
					<th><img style="width: 50px; height: 50px;" id="up" alt="" src="./img/q.png" title="질문"></th>
						<td style="padding-top: 10px; word-break:break-all; width: 750px"><h5>${q.vq_title }</h5></td>
					</tr>
					<tr>
						<td><h6><img style="width: 20px; height: 20px;" id="up" alt="" src="./img/id.png" title="id">
						${q.u_id }</h6></td><td><h6><img style="width: 20px; height: 20px;" id="up" alt="" src="./img/date.png" title="날짜">
											<fmt:parseDate value="${q.vqr_date }" var="time" pattern="yyyy-MM-dd HH:mm:ss.S" />
                                            <fmt:formatDate value="${time }" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
                    						${time }
					</h6></td>
					</tr></c:forEach></table><br>
					<table>
					<c:forEach items="${qna_answer_detail}" var="q">
					<tr>
						<td style="word-break:break-all; width: 820px">${q.vq_content }</td>
					</tr>
					</c:forEach>
					</table>
					<div style="padding-top: 150px;">
					<hr style="width: 850px; height: 2px;">
					</div>
					<br>
					<table>
					<c:forEach items="${qna_answer_detail}" var="q">
					<tr>
						<th><img style="width: 50px; height: 50px;" id="up" alt="" src="./img/a.png" title="답변"></th>
						<td style="padding-top: 10px; word-break:break-all; width: 750px"><h5>${q.vqr_title }</h5></td>
					</tr>
					<tr>
						<td><h6><img style="width: 20px; height: 20px;" id="up" alt="" src="./img/id.png" title="id">
						${q.t_id }</h6></td><td><h6><img style="width: 20px; height: 20px;" id="up" alt="" src="./img/date.png" title="date">
                                            <fmt:parseDate value="${q.vqr_date }" var="time" pattern="yyyy-MM-dd HH:mm:ss.S" />
                                            <fmt:formatDate value="${time }" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
                    						${time }&nbsp;
                    	<img onclick="location.href='./v_qna_update?vq_no=${q.vq_no}'" style="width: 20px; height: 20px;" id="update" alt="" src="./img/update.png" title="id">
						<img onclick="location.href='./video_qna_reply?vq_no=${q.vq_no}'" style="width: 20px; height: 20px;" id="delete" alt="" src="./img/delete.png" title="id"> 					
					</h6></td>
					
					</tr></c:forEach></table><br>
					<table>
					<c:forEach items="${qna_answer_detail}" var="q">
					<tr>
						<td style="word-break:break-all; width: 820px">${q.vqr_content }</td>
					</tr>
					</c:forEach>
					</table>
					
				
				
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