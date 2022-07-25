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
			<div style="padding-top: 90px;">
				<hr style="border: solid 1px;">
			</div>
			<div style="padding-top: 10px; text-align: center;">
				<h5>■개인정보처리방침</h5>
				<textarea style="width: 900px; height: 200px;" rows="" cols="">< Learning Machine >('www.Learning Machine.com'이하 'Learning Machine')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

○ 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.


제1조(개인정보의 처리 목적)

< Learning Machine >('www.Learning Machine.com'이하 'Learning Machine')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

1. 홈페이지 회원가입 및 관리

만14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인 목적으로 개인정보를 처리합니다.


2. 재화 또는 서비스 제공

콘텐츠 제공, 본인인증을 목적으로 개인정보를 처리합니다.




제2조(개인정보의 처리 및 보유 기간)

① < Learning Machine >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.

② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

1.<홈페이지 회원가입 및 관리>
<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<영구>까지 위 이용목적을 위하여 보유.이용됩니다.
보유근거 : 수업 사용
관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년
예외사유 : 111


제3조(처리하는 개인정보의 항목)

① < Learning Machine >은(는) 다음의 개인정보 항목을 처리하고 있습니다.

1< 홈페이지 회원가입 및 관리 >
필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름
선택항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름


제4조(개인정보의 제3자 제공에 관한 사항)

① < Learning Machine >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

② < Learning Machine >은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.

1. < Learning Machine >
개인정보를 제공받는 자 : Learning Machine
제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 자택전화번호, 비밀번호, 로그인ID, 성별, 생년월일, 이름
제공받는 자의 보유.이용기간: 영구


제5조(개인정보처리의 위탁에 관한 사항)

① < Learning Machine >은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

1. < Learning Machine >
위탁받는 자 (수탁자) : Learning Machine
위탁하는 업무의 내용 :
위탁기간 :
② < Learning Machine >은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</textarea>
			</div>

			<div style="padding-left: 990px;">
				<label>개인정보취급방침에 동의합니다.</label>
				<input id="chk" type="checkbox"/>
			</div>
			<br>
			<div style="text-align: center">
				<h5>&nbsp;&nbsp;■강의계획</h5>
				<div id="requestform" style="padding-top: 10px; padding-left: 340px; height: 495px;">
					<form action="./lecture_request.do" method="post">
					<table class="tg" style="table-layout: fixed; width: 900px">
						<colgroup>
							<col style="width: 100px">
							<col style="width: 800px">
						</colgroup>
						<tbody>
							<tr>
								<td class="tg-llyw">강의 이름</td>
								<td class="tg-0pky"><input name="l_name" style="width: 790px;"
									type="text"></td>
							</tr>
							<tr>
								<td class="tg-llyw">강의 정보</td>
								<td class="tg-0pky"><input name="l_info" style="width: 790px;"type="text"></td>
							</tr>
							<tr>
								<td class="tg-llyw">카테고리</td>
								<td class="tg-0pky">
								<select name="c_code" style="width: 790px;">
											<option value="">카테고리 선택</option>
											<c:forEach items="${cate }" var="cate">											
											<option value="${cate.c_code }">${cate.c_name }</option>
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
	
	<script type="text/javascript">
	$(".box button").attr("disabled", true);
    $("#chk").on('click',function(){
        var chk = $('input:checkbox[id="chk"]').is(":checked");
        if(chk==true){
            $(".box button").removeAttr('disabled');
            $(".box").removeClass("on");
        }else{
            $(".box button").attr("disabled", true);
            $(".box").addClass("on");
        }
    });
	</script>

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
				        placeholder: '내용을 입력해주세요.' 
				          
				   });
				});
		</script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</html>