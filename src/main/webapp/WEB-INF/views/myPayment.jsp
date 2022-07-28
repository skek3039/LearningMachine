<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Learning Machine:   Page</title>
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
<style type="text/css">
<
style
>
@font-face {
	font-family: 'LeferiPoint-WhiteObliqueA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff')
		format('woff');
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

details>summary {
	color: white;
	font-size: 17px;
	padding: 15px 0;
}
ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 25px;
  cursor: pointer;
}

ul.tabs li.current{
  background: #ededed;
  color: #222;
}

.tab-content{
  display: none;
}

.search.current{
  display: none;
}

.tab-content.current{
  display: flex;
}
#teacher{
	font-weight: 300px;
}
#content{
	width: 90%;
	height: 100%;
	border: 1px solid rgb(102, 202, 152);
	border-radius: 10px;
	display: inline-block;
	margin-bottom: 30px;
}
.col-sm-6.col-md-4{
	text-align: center;
	margin-bottom: 10px;
}
#category{
	display: inline-block;
	border: 1px solid rgb(201, 236, 219);
	border-radius: 10px;
	width: 10%;
	background-color: rgb(201, 236, 219);
	text-align: center;
}



    	  .background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 1000;

        /* 숨기기 */
        z-index: -1;
        opacity: 0;
      }

      .show {
        opacity: 1;
        z-index: 1000;
        transition: all 0.5s;
      }

      .window {
        position: relative;
        width: 100%;
        height: 100%;
      }

      .popup {
		padding: 10px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #ffffff;
        box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);

        /* 임시 지정 */
        width: 50%;
        height: 30%;

        /* 초기에 약간 아래에 배치 */
        transform: translate(-50%, -40%);
		overflow-y: auto;
      }

      .show .popup {
        transform: translate(-50%, -50%);
        transition: all 0.5s;
      }

	  #closebtn{
		position: fixed;
		top: 0;
        right: 0;
		padding: 10px;
	  }


</style>
<script type="text/javascript">
function linkPage(pageNo){
	location.href = "./myPayment?pageNo=" + pageNo;
}

function enterkey() {
	if (window.event.keyCode == 13) {
		search();
	}
	
}
</script>
<script type="text/javascript">

function linkPage(pageNo){
	location.href = "./community?pageNo=" + pageNo;
}


function OpenModal(p_no){
	var OpenModal = document.querySelector(".background" + p_no);
	OpenModal.classList.add("show");
}

function CloseModal(p_no) {
	var CloseModal = document.querySelector(".background" + p_no);
	CloseModal.classList.remove("show");
}

function refund(p_refund,p_no){
	if(p_refund == "1"){
		alert("이미 환불완료된 건입니다.");
	}else if(p_refund == "2"){
		alert("환불 신청된 건입니다.");
	}else if(p_refund == "0"){
		OpenModal(p_no);		
	}
	
}

$(document).ready(function(){
	   
 
	  });
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
		<div style="padding-top: 110px;">
			<h3>&nbsp;&nbsp; My Lecture</h3> <small>현재 ${myPay[0].name }님 수강중인 강의 정보입니다. <strong style="text-align: right">환불을 원하시는 강의가 있으시면 <span style="color: red"> 오른쪽 결제완료버튼</span>을 눌러진행해주세요.</strong></small>
			<hr style="border: solid 1px;">
		</div>
		<div style="padding-top: 5px; text-align: center;">
			<br>
			<c:forEach items="${category }" var="c">
				<p id="category">
					<a href="javascript:select('${c.c_name}')">${c.c_name }</a>
				</p>
			</c:forEach>
				<div class="content" style="height: 600px; margin: 0 auto; width: 1000px; ">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr style="background-color: #F0F8FF;">
							<th style="text-align: left; width: 300px;">강의명</th>
							<th style="width: 100px;">카테고리</th>
							<th style="width: 120px; ">금액</th>
							<th>결제일</th>
							<th style="width: 120px;">결제상태</th>
						</tr>
					</thead>
					<c:forEach items="${myPay }" var="p">
						<tbody id="detailTable">
							<tr>
								<th style="text-align: left"><a href="./LectureDetail?l_code=${p.l_code }">${p.l_name }</a></th>
								<th style="width:80px; ">${p.cate }</th>
								<td style="text-align: right;"><fmt:formatNumber value="${p.p_price2 }" pattern="#,###"  />원</td>
								<td>
								 <fmt:parseDate value="${p.p_date}" var="time" pattern="yyyy-MM-dd HH:mm:ss.S" />
                                 <fmt:formatDate value="${time }" var="time" pattern="yyyy-MM-dd HH:mm"/>
								${time }</td>
								<td><button class="btn btn-outline-dark" onclick="refund('${p.p_refund}','${p.p_no }')">
								<c:choose>
									<c:when test="${p.p_refund eq 1 }">
									 	환불완료
									</c:when>
									<c:when test="${p.p_refund eq 2 }">
									 	환불대기
									</c:when>
									<c:otherwise>
										결제완료
									</c:otherwise>
								</c:choose>
								</button> </td>
							
							</tr>
							
						</tbody>

						<div class="background background${p.p_no }">
							<div class="window">
								<div class="popup">
								<form action="./myPayment" method="post">
									<input type="hidden" id="p_no" name="p_no" value="${p.p_no }">
									<button id="closebtn" class="btn btn-outline-dark" onclick="CloseModal(${p.p_no});">닫기</button>
									<h2 class="card-title" style="text-align: left">환불신청</h2>
									<p class="card-text">
									<div style="border: 1px solid rgb(201, 236, 219); height: 150px; text-align: left">
										강의명 : ${p.l_name }<br>
										강사명 : ${p.t_nickname }<br><br><br>
									<h6 style="text-align: right"><fmt:formatNumber value="${p.p_price2 }" pattern="#,###"  />원을 환불신청합니다. </h6>
									</div>
									<button type="submit" class="btn btn-outline-dark" style="padding-top: 10px;">환불신청</button>
									<br>
								</form>
								</div>

							</div>
						</div>
					</c:forEach>
				</table>
				</div>				
					<div id="pagination" style="text-align: center;padding-bottom: 10px;"><ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage" /></div>
			</div>

		<jsp:include page="./footer.jsp" />

	</div>

		

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
</body>

</html>