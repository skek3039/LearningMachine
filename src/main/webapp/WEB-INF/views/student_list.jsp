<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
    
       .background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 500px;
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
        width: 70%;
        height: 70%;

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
	location.href = "./student_list?pageNo=" + pageNo;
	}


function OpenModal(la_no){
	var OpenModal = document.querySelector(".background" + la_no);
	OpenModal.classList.add("show");
}

function CloseModal(la_no) {
	var CloseModal = document.querySelector(".background" + la_no);
	CloseModal.classList.remove("show");
}

function report(l_code){
	let ur_reason = $("#ur_reason").val();
	alert(ur_reason);
	location.href = "./lecture_student_report?l_code="+l_code+ "&ur_reason="+ur_reason ;
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
		<div style=" width: 100%; height: 950px;">
				<jsp:include page="./lecture_nav.jsp"/>
			<div style="padding-top: 110px;"><h3>&nbsp;&nbsp;수강생조회</h3><hr style="border: solid 1px;"></div>
		 			<div class="col-sm-offset-9" style=" text-align: center; padding-left: 890px"></div>
		<div style="padding-top: 10px; height: 500px;">
			<table class="table table-bordered table-sm" style="width: 900px; margin: 0 auto; text-align: center;">
					<tr>					
						<th>강의명</th>
						<th>이름</th>
						<th>성별</th>
						<th>포인트</th>
						<th>진도율</th>			
						<th>신고</th>			
					</tr>
					
					<c:forEach items="${studentList}" var="s">
					<tr>
						<td>${s.l_name }</td>
						<td>${s.u_id }</td>					
						<td>${s.u_gender }</td>
						<td>${s.u_paypoint }</td>
						<td>${s.attendance_rate } %</td>
						<td>
						<c:if test="${s.count ==1 }">
						신고완료 
						</c:if>
						<c:if test="${s.count == 0 }">
						<a href = "#" onclick="OpenModal('${s.l_code}')">신고하기</a>
						</c:if>
						
									<div class="background background${s.l_code}">
										<div class="window">
											<div class="popup">
												<button id="closebtn" onclick="CloseModal('${s.l_code}');">닫기</button>
						<form action="./lecture_student_report" method="get">
												<h2 class="card-title">신고사유</h2>
												<h6>수업 : ${s.l_name } | 수강생 : ${s.u_id }</h6>
												<input type="hidden" name="u_id" value="${s.u_id }"> <input
													type="hidden" name="l_code" value="${s.l_code }">
												<p class="card-text">
													<textarea name="ur_reason" id="ur_reason"
														placeholder="신고사유를 적어주세요." required="required"
														style="width: 100%; height: 100px;"></textarea>
												</p>
												<button type="submit" class="btn btn-outline-dark">신고</button>
								</form>
											</div>
											<div>
												<div></div>
											</div>
										</div>
									</div>
								</td>
						
						<!-- <button type="button" onclick="locaion.href='lecture_student_report.jsp'">신고</button> -->
					</tr>
					</c:forEach>
			</table>
		</div>
		<div id="pagination" style="text-align: center;"><ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage" /></div>
	
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

</html>