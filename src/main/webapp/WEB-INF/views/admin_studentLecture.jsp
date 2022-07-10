<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>

<script type="text/javascript">
function search(){
	var u_name= document.getElementById("u_name").value;
	location.href = "./admin_studentSearch?u_name="+u_name;
	
}

function backup(u_id){
	if(confirm("정지된회원을 복구하시겠습니까?")){
		location.href="./admin_student_back?u_id="+u_id;
	}
	
}

/* function search(){
	 var u_name= document.getElementById("u_name").value;
	 $.ajax({
	 url:"./admin_studentSearch",
	 type:"get",
	 dataType:"json",
	 data:{"u_name" : u_name},
	 success:function(data){
	 var list = data.list;
	 alert(list);
	 /*	var html =  "<table><tr><th>이름</th><th>아이디</th><th>포인트</th><th>신고횟수</th></tr>";
	 $.each(list, function(){
	 html += "<tr><td>" + list[index].u_name" + </td><td>" + list[index].u_id + "</td>";
	 html += "<tr><td>" + list[index].u_paypoint" + </td><td>" + list[index].u_banned + "</td></tr>";
	 });
	 html += "</table>";
	 $("#student").empty();
	 $("#student").append(html); 
	 },error:function(request, status, error){
	 alert("문제발생"+error);
	 }
	 }); 
	 } */
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
		<div style="padding-top: 50px;"><h3>&nbsp;&nbsp;학생강의리스트</h3><hr style="border: solid 1px;"></div>
		<div style="padding-top: 10px; margin-left: 310px;">
		<div  id="student" >
			<c:if test="${list[0].u_del ne 0 }">
				<h4>정지된 회원입니다. <small>${list[0].reason }</small> </h4>
			</c:if>
			이름 : ${list[0].u_name } <br>
			아이디 : ${list[0].u_id } <br>
			포인트 : ${list[0].u_paypoint } <br>
			신고횟수 : ${list[0].count } 
			<c:if test="${list[0].u_del ne 0 }">
				<img src="./img/banned.png" height="20px" width="20px" onclick="location.href='./admin_student_report'" style="cursor:pointer;"> 
				<img src="./img/backup.png" alt="복구" height="20px" width="20px" onclick="backup('${list[0].u_id}')" style="cursor:pointer;"> 
			</c:if>
			<br>
 					<h5>강의내역</h5>
 				<table class="table table-bordered table-sm">
					<tr>					
						<th>강의이름</th>		
						<th>수강일자</th>													
					</tr>
					<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.l_name }</td>
						<td>${list.lr_date }</td>															
					</tr>
					</c:forEach>
				</table>
				<br>
				<div id="main_bottom1">
					<h5>신고내역</h5>
				<table class="table table-bordered table-sm">
					<tr>
						<th>신고사유</th>
						<th>신고강사</th>
						<th>신고일자</th>
					</tr>
					<c:forEach items="${report }" var="r">
					<tr>
						<td>${r.ur_reason }</td>
						<td>${r.t_name }</td>
						<td>${r.u_date }</td>
					</tr>		
					</c:forEach>				
				</table>
				</div>	
				<div id="main_bottom2">
					<h5>결재내역</h5>
				<table class="table table-bordered table-sm">
					<tr>
						<th>결제내역</th>
						<th>결제일자</th>
						<th>결제수단</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>						
				</table>
				</div>
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