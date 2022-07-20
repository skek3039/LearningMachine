<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Learning Machine: Community</title>
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

</style>
<script type="text/javascript">
$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	 
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
			<h3>&nbsp;&nbsp; Community</h3> <small>비방또는 비난등의 글은 무통보로 삭제됩니다.</small>
			<hr style="border: solid 1px;">
		</div>
		<div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">강의 QnA</li>
				<li class="tab-link" data-tab="tab-2">자유주제</li>
			</ul>
		</div>
		<div style="padding-top: 20px; text-align: center;">
				<div style="width:500px; margin: 0 auto">
					 <input type="text" class="form-control" style="width: 350px;display: inline-block;" placeholder="궁금한 질문을 검색해보세요!">
					 <button type="button" class="btn btn-success" style="display: inline-block;">Search</button>
				</div>	
				<br>
				<p id="category">프론트엔드</p>
				<p id="category">백엔드</p>
				<p id="category">자바</p>
				<br>	
				<div id="content">
				<div class="row tab-content current" id="tab-1">
					<table class="table table-hover" style="width: 90%; margin: 0 auto" >
						  <thead class="thead-dark">
						    <tr>
						      <th>ID no.</th>
						      <th>강의카테고리</th>
						      <th>제목</th>
						      <th>날짜</th>
						      <th>닉네임</th>
						    </tr>
						  </thead>
						<c:forEach items="${list }" var = "list"> 
						  <tbody> 
						    <tr role="alert">
						      <th>${list.lqa_no }</th>
						      <td>${list.l_category }</td>
						      <td>${list.lqa_title }</td>
						      <td>${list.lqa_date }</td>
						      <td>${list.u_id }</td>
						      <td>
						      	<a href="#" class="close" data-dismiss="alert" aria-label="Close">
				            	<span aria-hidden="true"><i class="fa fa-close"></i></span></a>
				        	</td>
						    </tr>
						  </tbody>
						  </c:forEach>
						</table>
					
					
					
					<%-- <table border="1" style="width: 600px; margin: 0 auto;">
					<c:forEach items="${list }" var = "list"> 
					<tr>
						<th><img style="width: 50px; height: 50px;" id="up" alt="" src="./img/q.png" title="질문"></th>
							<td style="padding-top: 10px; word-break:break-all; width: 750px"><h5>${list.lqa_title }</h5></td>
						</tr>
					<tr>
						<td><h6><img style="width: 20px; height: 20px;" id="up" alt="" src="./img/id.png" title="id">
						${dto.u_id }</h6></td><td><h6><img style="width: 20px; height: 20px;" id="up" alt="" src="./img/date.png" title="date">
						<fmt:parseDate value="${list.lqa_date }" var="time" pattern="yyyy-MM-dd HH:mm:ss.S" />
                        <fmt:formatDate value="${time }" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
                    	${time }</h6></td>
					</tr>
					</c:forEach>
					</table> <br> --%>
					<table>
					<tr>
						<td style="word-break:break-all; width: 820px">${dto.vq_content }</td>
					</tr>
					</table>
					<br>
				</div>
<%-- 				<div class="row tab-content" id="tab-2">
				<c:forEach items="${RecentList }" var="i">
					<div class="col-sm-6 col-md-4">
						<div id="content">
							<div class="thumbnail">
								<img src="./img/leaf.png" alt="" onclick="location.href = './LectureDetail?l_code=${i.l_code}';" width="150px">
								<div class="caption">
									<h3>
										<a href="./LectureDetail?l_code=${i.l_code}">${i.l_name}</a>
									</h3>
									<p id ="teacher">${i.t_nickname}</p>
									<strong style="color: red;">${i.l_price}원</strong><p><small>(${i.total_register}명 수강)</small></p>
									<p id="category">${i.l_category }</p>
									<c:choose>
										<c:when test="${i.payment_whether eq 0 && sessionScope.u_id ne null}">
											<p>
												<a href="#" class="btn btn-default" role="button">이동하기</a>
												<a href="#" class="btn btn-primary" role="button">찜하기</a>
											</p>
										</c:when>
										<c:when test="${i.payment_whether eq 0 && sessionScope.u_id eq null}">
											<p>
												<a href="#" class="btn btn-default" role="button">이동하기</a>
												<a href="#" class="btn btn-primary" role="button">찜하기(로그인)</a>
											</p>
										</c:when>
										<c:otherwise>
											<p>
												<a href="#" class="btn btn-default" role="button">이동하기</a>
												<a href="#" class="btn btn-primary" role="button">리뷰남기기</a>
											</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div> --%>
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
</body>

</html>