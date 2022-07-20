<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    
    #category{
	display: inline-block;
	border: 1px solid rgb(201, 236, 219);
	border-radius: 10px;
	
	background-color: rgb(201, 236, 219);
	text-align: center;
}
</style>

<script type="text/javascript">
function add(){
	let c_name = $("#c_name").val();
	if(c_name == ""){
		alert("1자이상 입력해주세요.");
	}else{
		if(confirm("정말 " + c_name + "로 결정하시겠습니까?")){
			$.ajax({
				url : "./addCategory",
				type : "get",
				dataType : "html",
				data : {"c_name" : c_name
						"check" : "1"	
				},
				success : function(data){
					if(data == 0 ){
						 $('#categoryTable').load(location.href+' #categoryTable');
					}
				},
				error : function(){
					alert("실패 ㅠ");
					}
				});
		}
	}
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
		<div style="padding-top: 110px;"><h3>&nbsp;&nbsp;카테고리관리</h3><hr style="border: solid 1px;"></div>
		<div style="padding-top: 10px; margin-left: 310px;">
				<div style="padding-top: 10px;">
					 <input type="search" id="c_name" name="c_name" class="form-control" required="required" placeholder="카테고리이름을 추가해주세요." style="width: 270px; float: left;"> &nbsp; 
					 <button class="btn btn-danger" id="add" style="width: 100px" onclick="add()">추가</button>
				</div><br>
			<div id = "categoryTable">
				<div style="width: 900px; margin: 0 auto;">
					<div id = "title" style="text-align: center"><strong>카테고리</strong> </div>
					<br>
					<c:forEach items="${cate }" var = "cate">
					<div style="width: 150px;  border-radius: 10px; background-color:#F0F8FF ;margin-left:10px;text-align:center; margin-top:10px; display: inline-block;"><p id="category" style="text-align: center">${cate.c_name }</p></div>
					</c:forEach>				
				</div>
			</div>
		</div>

</div>


		<%-- <jsp:include page="./team.jsp"/> --%>
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