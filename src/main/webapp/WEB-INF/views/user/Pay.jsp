	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
		function pay() {
			IMP.init("imp64373141");
			IMP.request_pay({ // param
				pg: "kakaopay.TC0ONETIME", // PG사 선택
				pay_method: "card", // 지불 수단
				merchant_uid: 'merchant_' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한id
				name: "${LectureInfo.l_name}", // 상품명
				amount: parseInt('${ LectureInfo.l_price}', 10), // 가격
				buyer_email: "${UserInfo.u_email}",
				buyer_name: "${UserInfo.u_name}", // 구매자 이름
				buyer_tel: "${UserInfo.u_tel}", // 구매자 연락처 
				buyer_addr: "부천시",// 구매자 주소지
				buyer_postcode: "부천시", // 구매자 우편번호
				digital: false, // 실제 물품인지 무형의 상품인지(핸드폰 결제에서 필수 파라미터)
				app_scheme: '' // 돌아올 app scheme
			}, function (rsp) {
				$.ajax({
					type: "POST",
					url: "/web/Pay.do/" + rsp.imp_uid,
					data: {
						l_code: '${LectureInfo.l_code}',
						l_price: '${ LectureInfo.l_price }',
						u_id: '${UserInfo.u_id}'
					}
				}).done(function (data) {

					console.log(data);

					// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
					if (rsp.success) {
						location.href = "/web/LectureDetail?l_code=${LectureInfo.l_code}";
						alert("성공");
					} else {
						location.href = "/web/LectureDetail?l_code=${LectureInfo.l_code}";
						alert("결제 실패");
					}
				});
			});
		}
	</script>
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<jsp:include page="./header.jsp" />
		<div class="container-xxl py-6">
			<div class="container">
				<div class="mx-auto text-center wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
					<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">강의 정보</div>
					<h2 class="mb-5">${LectureInfo.l_name}</h2>
				</div>
				<div class="row justify-content-center">
					<div class="col-lg-7 wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4">${LectureInfo.l_info}</p>
						<form>
							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-floating">
										<input type="text" class="form-control" id="name" placeholder="Your Name">
										<label for="name">Your Name</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<input type="email" class="form-control" id="email" placeholder="Your Email">
										<label for="email">Your Email</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="subject" placeholder="Subject">
										<label for="subject">Subject</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<textarea class="form-control" placeholder="Leave a message here" id="message"
											style="height: 150px; resize: none;" readonly></textarea>
										<label for="message">Message</label>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" type="submit">Send Message</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<input name="l_price" value="${LectureInfo.l_price }">
		<button onclick="pay()">결제</button>
	</div>
</body>

</html>