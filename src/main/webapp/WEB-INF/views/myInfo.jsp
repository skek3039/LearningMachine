<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Learning Machine:  ${list[0].u_name } Page</title>
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
#category{
	display: inline-block;
	border: 1px solid rgb(201, 236, 219);
	border-radius: 10px;
	width: 49%;
	background-color: rgb(201, 236, 219);
	text-align: left;
}
</style>
<script type="text/javascript">

function enterkey() {
	if (window.event.keyCode == 13) {
		search();
	}
	
}
</script>
<script type="text/javascript">

$(document).ready(function(){
	   
 
	  });
	  
function drop(u_id) {
	if(confirm("정말 탈퇴하시겠습니까..? ㅠㅠ")){
		$.ajax({
			url: "./myDrop",
			type: "get",
			dataType: "html",
			data:{"u_id" : u_id,
			},
			success : function(data){
				if(data == 1){
					alert("탈퇴가 되었습니다. 메인으로 이동 합니다.");					
					location.href = "./";
				}else{
					alert("탈퇴에 실패하셨습니다. 고객센터에 문의 남겨주세요.");
					window.history.back();					
				}
			}
		});
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
		<div style="padding-top: 110px;">
			<h3>&nbsp;&nbsp; My Page</h3> 
			<hr style="border: solid 1px;">
		</div>
		<div style="padding-top: 5px; text-align: center;">
			<br>
				<div class="content" style="height: 800px; margin: 0 auto; width: 900px; ">
					<div style="width: 100%; height: 50px;">
						<div style="width:200px; display: inline; border-radius:10px; padding:10px; box-sizing:border-box;	border: 1px solid rgb(102, 202, 152);" >
							획득수료중
						</div>
						<div style="width:200px;display: inline;border-radius:10px; padding:10px; box-sizing:border-box;	border: 1px solid rgb(102, 202, 152);">
							완료강의수
						</div>
						<div style="width:200px ;display:inline ;border-radius:10px; padding:10px; box-sizing:border-box;	border: 1px solid rgb(102, 202, 152);" >
							위시리스트 강의수 
						</div>
					</div>
				
				
					<div style="border-radius:10px; padding:10px; box-sizing:border-box;	border: 1px solid rgb(102, 202, 152);">
					<div class="col-12">
						<div style="text-align: left;">
							<p id="category">이름 : ${myinfo[0].u_name }</p>
							<p id="category" style="float: right">이메일 : ${myinfo[0].u_email }</p>
						</div>
						<div style="text-align: left;">
						</div>
						<div style="text-align: left;">
							<input type="text" class="form-control" placeholder="닉네임 (${myinfo[0].u_nickname }) 변경을 원하시면 입력해주세요." id="u_nickname" name="u_nickname">  
							<p id="check"></p>
						</div>
						<div style="text-align: left;">
							<p id="category">생년월일 : ${myinfo[0].u_birth }</p>
							<p id="category" style="float: right">전화번호 : ${myinfo[0].u_tel }</p>
						</div>
					
					</div>
					</div>
					<br>
					<h3>비밀번호변경</h3> 
					<div style="border-radius:10px; padding:10px; box-sizing:border-box;	border: 1px solid rgb(102, 202, 152);">
						<input type="password" name="u_pw1" id="u_pw1" class="form-control" placeholder="비밀번호입력">
						<input type="password" name="u_pw2" id="u_pw2" class="form-control" placeholder="비밀번호확인">
						<p id="checkpw"></p>
					</div>
						<a class="btn btn-primary" role="button" href="#" style="width: 80px; margin: 4px auto;">저장</a>	
						<a class="btn btn-dark" role="button" href="javascript:drop('${myinfo[0].u_id }')" style="width: 80px; float:right; margin: 4px auto; margin-right: 30px;">탈퇴</a>	
					
					
				</div>	
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