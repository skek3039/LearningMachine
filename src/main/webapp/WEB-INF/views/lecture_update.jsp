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

</head>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-llyw {
	background-color: #c0c0c0;
	border-color: inherit;
	text-align: left;
	vertical-align: top
}

.tg .tg-0pky {
	border-color: inherit;
	text-align: left;
	vertical-align: top;
	
}
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
    .box.on{
    color:#999;
    }
</style>
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
		<div style="width: 100%;">
			<jsp:include page="./lecture_nav.jsp" />
			<br>
			<div style="text-align: center">
				<div id="updateform" style="padding-top: 150px; padding-left: 340px; height: 920px;">
					<form action="./lecture_update.do" method="post">
					<table class="tg" style="table-layout: fixed; width: 900px">
						<colgroup>
							<col style="width: 100px">
							<col style="width: 800px">
						</colgroup>
						<tbody>
							<tr>
								<td class="tg-llyw">강의 이름</td>
								<td class="tg-0pky"><input name="l_name" style="width: 790px;"
									type="text" placeholder="${dto.l_name }"></td>
							</tr>
							<tr>
								<td class="tg-llyw">강의 정보</td>
								<td class="tg-0pky"><input name="l_info" style="width: 790px;"
								type="text" placeholder="${dto.l_info }"></td>
							</tr>
							<tr>
								<td class="tg-llyw">카테고리</td>
								<td class="tg-0pky">
								<select name="l_category" style="width: 790px;">
											<option value="">카테고리 선택</option>
											<c:forEach items="${cate }" var="cate">											
											<option value="${cate.l_category }">${cate.l_category }</option>
											</c:forEach>
									</select>
									</td>
							</tr>
							<tr>
								<td class="tg-llyw">커리큘럼</td>
								<td class="tg-0pky"><textarea name="l_curriculum" id="summernote" required="required"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="box on" style="padding-top: 10px; padding-left: 765px;">
					<input type="hidden" name="la_no" value="${dto.la_no }">
						<button type="submit" class="btn btn-outline-dark">저장</button>
					</div></form>
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
			$(document).ready(function() {
				   //여기 아래 부분
				   $('#summernote').summernote({
				        height: 200,        
				        minHeight: null,        
				        maxHeight: null,       
				        focus: true,             
				        lang: "ko-KR",          
				        placeholder: "${dto.l_curriculum}"
				          
				   });
				});
		</script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</html>