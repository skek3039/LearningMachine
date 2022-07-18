<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
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
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Libraries Stylesheet -->
<link href="./resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
	<link
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
rel="stylesheet">
	

<!-- Customized Bootstrap Stylesheet -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">



<!-- Template Stylesheet -->
<link href="./resources/css/style.css" rel="stylesheet">
<link href="./resources/css/admin.css" rel="stylesheet">
<link href="./resources/css/payment.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="./resources/lib/wow/wow.min.js"></script>
<script src="./resources/lib/easing/easing.min.js"></script>
<script src="./resources/lib/waypoints/waypoints.min.js"></script>
<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>


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
    
    
    #myChart{
			/* 가로 width 크기에 따라서 차트 크기가 지정됩니다 */
			width: 70%;
			height: auto;
			margin: 0 auto;
			padding: 0;
			border: 1px solid #000000;
			border-radius: 20px;
			background-color: #eeeeee;

			position: relative;
			top: 5%;
			left: 0;

			display: block;
		}
    
</style>

<script type="text/javascript">
window.onload = function() {
	console.log("");
	console.log("[window onload] : [start]");
	console.log("");

	/* [bar 세로 막대 : 그리기 실시] */
	drawBarHeight();
	    		
};


/* [bar 세로 막대 : 그리기 함수] */
function drawBarHeight(){
		
	console.log("");
	console.log("[drawBarHeight] : [start]");
	console.log("");

	// [body 에 선언된 캔버스 id 지정 실시]
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'bar', // [차트 타입 지정]
		data: {
			labels: [ '${list[0].month }월', '${list[1].month }월', '${list[2].month }월', '${list[3].month }월', 
				'${list[4].month }월', '${list[5].month }월', '${list[6].month }월', '${list[7].month }월', 
				'${list[8].month }월', '${list[9].month }월', '${list[10].month }월', '${list[11].month }월', 
				'${list[12].month }월'], // [데이터 라벨 (제목)]
			datasets: [{
				label: '${year }년 월 매출', // [데이터 시트 제목]
				
				data: [${list[0].total}, ${list[1].total}, ${list[2].total},
${list[3].total}, ${list[4].total}, ${list[5].total}, ${list[6].total}, 
${list[7].total}, ${list[8].total}, ${list[9].total}, ${list[10].total}, 
${list[11].total}, ${list[12].total}], // [데이터 : Red ~ Orange]
				backgroundColor: [ // [막대 배경 색상 : Red ~ Orange ]
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [ // [막대 테두리 색상 : Red ~ Orange ]
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1 // [막대 테두리 굵기 설정]
			}]
		},
		options: {
			legend: {
				labels: {
					fontColor: "green",
					fontSize: 18
				}
			},
			scales: {
				y: {
					beginAtZero: true
				}
			}
		}
	});
};


function preNext(year,checkPN){
	var checkPN = checkPN;
	var year = Number(year);
	
	alert(checkPN + "," + year);
	location.href="./payment?checkPN="+checkPN+"&year="+year;
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
		<div id = "payment_body">
		<div style="position: relative;">
		<jsp:include page="./admin_nav.jsp"/>
		 </div>
			<div style="padding-top: 110px;">
				 <h1 class="h3 mb-2 text-gray-800">매출조회</h1>
				<hr style="border: solid 1px;">
			</div>
			<div style="padding-top: 10px; margin-left: 280px;">
				<div id="payment">
					<div id="today">
				 <!-- Begin Page Content -->
						<h6 class="m-0 font-weight-bold text-primary"><a href="javascript:preNext('${year }','1')">◀</a>  ${year }년 <a href="javascript:preNext('${year }','2')">▶</a> </h6>
						<br>
						<canvas id = "myChart"></canvas>
					</div>
					

				</div>
				<hr>
			</div> 

		<%-- <jsp:include page="./team.jsp"/> --%>
		<jsp:include page="./footer.jsp" />
		</div>
</div>

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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
	<!-- JavaScript Libraries -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/lib/wow/wow.min.js"></script>
	<script src="./resources/lib/easing/easing.min.js"></script>
	<script src="./resources/lib/waypoints/waypoints.min.js"></script>
	<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="./resources/js/main.js"></script>
	<script src="./resources/js/admin_student.js"></script>
	<script src="./resources/js/payment.js"></script>
	
	
	
    <!-- Page level plugins -->
    <script src="./resources/js/Chart.js"></script>



</html>