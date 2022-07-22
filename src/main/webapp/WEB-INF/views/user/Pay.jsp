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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	function pay() {
		IMP.init("imp64373141");
		IMP.request_pay({ // param
			pg: "kakaopay.TC0ONETIME", // PG사 선택
			pay_method: "card", // 지불 수단
			merchant_uid: 'merchant_' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한id
			name: "${LectureInfo.l_name}", // 상품명
			amount: parseInt(${ LectureInfo.l_price }, 10), // 가격
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
				success: function () {// 성공 했을 때 처리    
					alert("sucksex");
				},
				error: function (request, status, error) {
					alert("code=" + request.status + "message=" + request.responseText + "error" + error);
				},
				complete: function () { alert("complete!"); }
			}).done(function (data) {

				console.log(data);

				// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
				if (rsp.paid_amount == data.response.amount) {
					location.href = "/web/LectureDetail?l_code=${LectureInfo.l_code}";
				} else {
					alert("결제 실패");
				}
			});
		});
	}
</script>
</head>
<body>
	<input name="l_price" value = "${LectureInfo.l_price }">
	<button onclick="pay()">결제</button>
</body>
</html>