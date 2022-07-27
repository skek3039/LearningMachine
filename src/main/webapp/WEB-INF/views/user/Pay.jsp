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
					<div class="d-inline-block border rounded-pill text-primary px-4 mb-3">결제 정보</div>
					<h2 class="mb-5">${LectureInfo.l_name}
					</h2>
				</div>
			
				<div class="row justify-content-center">
					<div class="col-lg-7 wow fadeInUp" data-wow-delay="0.3s">
						<p class="text-center mb-4">${LectureInfo.l_info}</p>
						<form>
							<div class="row g-3">
								<div class="col-12">
									<div class="form-floating">
										<table class="table table-condensed">
										<tr>
											<th> ${LectureInfo.l_name } 강의  </th>
											<td style="text-align: right"> <small> [ ${LectureInfo.l_category } ]</small></td> 
										</tr>
										<tr>
											<th colspan="2" style="text-align: right">${LectureInfo.t_nickname } 선생님 </th> 
										</tr>
										<tr>
											<th colspan="2" style="text-align: left">구매자정보</th> 
										</tr>
										<tr style="text-align: left">
											<th colspan="2" style="width: 120px; background-color: 	#F0FFF0">이름 : ${UserInfo.u_name} | 이메일 : ${UserInfo.u_email} | 아이디 :${UserInfo.u_id}</th> 
										</tr>
										<tr>
											<th colspan="2" style="text-align: right">결제금액 : ${LectureInfo.l_price } 원 </th> 
										</tr>
										
										<tr>
											<td colspan="2" > <textarea readonly="readonly" style="width: 100%; height: 100px;">구매조건 및 개인정보취급방침  
제 19조. 유료서비스의 제공“회원”은 “회사”가 제공하는 절차에 의하여 유료서비스 이용계약(이하 “청약”을 신청합니다. “회사”는 원칙적으로 “회원”의 청약 신청을 승낙합니다. 다만, 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보할 수 있습니다.
실명이 아니거나 타인의 명의를 이용한 경우
허위의 정보를 기재하거나, "회사”가 제시하는 내용을 기재하지 않은 경우
미성년자가 청소년보호법 등 관련법에 의해서 이용이 금지되는 유료 서비스를 이용하고자 하는 경우
"서비스"의 위상이나 명예에 부정적인 영향을 줄 수 있는 경우
“유료서비스"에서 제공하는 서비스의 공급량의 제한의 이유로 "서비스"를 제공할 수 없는 경우
이 약관에 위배되는 내용을 “회사”에 요구한 이력이 있는 “회원”일 경우
질문에 대한 권리는 “유료서비스”에 포함되지 않습니다
청약의 성립시기는 결제가 완료된 시점으로 합니다.
“회사”는 계약 체결 전에 “회원”이 청약의 내용을 확인하고, 정정 또는 취소할 수 있도록 적절한 절차를 갖추어야 합니다.
“회원”는 계약 전에 이 약관 및 개별 안내 페이지에서 “회사”가 안내하는 사항을 숙지하여 착오 없이 거래할 수 있도록 하여야 합니다.
											
											</textarea> </td>
										</tr>
										<tr>
											<td colspan="2" > <small>회원 본인은 주문내용을 확인했으며,
											구매조건 및 개인정보취급방침과 결제에 동의합니다.</small></td>
										</tr>
										</table>
									</div>
								</div>
								<div class="col-12">
									<input type="hidden" name="l_price" value="${LectureInfo.l_price }">
									<button class="btn btn-primary w-100 py-3" onclick="pay()">결제</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	
	</div>
</body>

</html>