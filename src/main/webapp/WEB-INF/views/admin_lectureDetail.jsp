<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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
function search(){
	var u_name= document.getElementById("u_name").value;
	location.href = "./admin_studentSearch?u_name="+u_name;
	
}

function OpenModal(la_no){
	var OpenModal = document.querySelector(".background" + la_no);
	OpenModal.classList.add("show");
}

function CloseModal(lqa_no) {
	var CloseModal = document.querySelector(".background" + lqa_no);
	CloseModal.classList.remove("show");
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
		<div style="width: 100%; height: 800px; ">
		<div style="position: relative;">
		<jsp:include page="./admin_nav.jsp"/>
		 </div>
		<div style="padding-top: 110px;"><h3>&nbsp;&nbsp;강의신청</h3><hr style="border: solid 1px;"></div>
		<div style="padding-top: 10px; margin-left: 310px;">
			<div  id="student" >
				<small>신중하게 승인처리해주세요. </small>

					<form action="./admin_lecture_get" method="get">
						<input type="hidden" name="t_id" value="${list[0].t_id}">
						<input type="hidden" name="la_no" value="${list[0].la_no}">
						<input type="hidden" name="check" value="1"> <input
							type="hidden" name="c_code" value="${list[0].c_code }"> <input
							type="hidden" name="c_name" value="${list[0].c_name }"> <input
							type="hidden" name="l_name" value="${list[0].l_name }"> <input
							type="hidden" name="l_curriculum"
							value="${list[0].l_curriculum }"> <input type="hidden"
							name="l_info" value="${list[0].l_info }">
						<table class="table table-bordered table-sm" style="width: 900px;">
							<tr>
								<th>강사아이디 | ${list[0].t_id}</th>
								<th>강의이름 | ${list[0].l_name }</th>
								<th>카테고리 | ${list[0].c_name } / ${list[0].c_code }</th>
							</tr>
							<tr>
								<td colspan="3"><label style="height: 150px;">${list[0].l_curriculum }</label>
								</td>
							</tr>
							<tr>
								<td colspan="3"><label style="height: 150px;">${list[0].l_info }</label>
								</td>
							</tr>
							<tr>
								<td colspan="3"><label>강의가격</label> <input type="text"
									id="l_price" name="l_price" placeholder="강의가격을 입력해주세요."
									required="required"></td>
							</tr>
						</table>
						<c:if test="${list[0].l_recognize == 0 }">
							<button type="submit" style="float: left; margin-right: 10px;" class="btn btn-outline-dark">승인</button>
							<button onclick="OpenModal(${list[0].la_no});" class="btn btn-outline-dark">승인거부</button>
							<div class="background background${list[0].la_no}">
								<div class="window">
									<div class="popup">
										<button id="closebtn" onclick="CloseModal(${list[0].la_no});">닫기</button>
										<h2 class="card-title">정지사유</h2>
										<h6>${list[0].t_id } 선생님</h6>
										<p class="card-text">
										<textarea name="la_reason" placeholder="승인불가사유를 적어주세요." required="required" style="width: 100%; height: 100px;" ></textarea>
										</p>
										<button type="button" onclick="location.href='./admin_lecture_get?check=2&la_no=${list[0].la_no}'" class="btn btn-outline-dark">승인거부</button>
									</div>
									<div>
										<div></div>
									</div>
								</div>
							</div>
						</c:if>
					</form>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/lib/wow/wow.min.js"></script>
	<script src="./resources/lib/easing/easing.min.js"></script>
	<script src="./resources/lib/waypoints/waypoints.min.js"></script>
	<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="./resources/js/main.js"></script>
	<script src="./resources/js/admin_student.js"></script>
</body>

</html>