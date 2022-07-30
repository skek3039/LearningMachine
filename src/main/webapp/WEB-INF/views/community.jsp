<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
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
        height: 60%;
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
	var lqa_title= document.getElementById("lqa_title").value;
	if(lqa_title != ""){
		location.href = "./community_communityName?lqa_title="+lqa_title;
	}else{
		location.href="./community";
	}
		
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
function OpenModal(lqa_no){
	var OpenModal = document.querySelector(".background" + lqa_no);
	OpenModal.classList.add("show");
}
function CloseModal(lqa_no) {
	var CloseModal = document.querySelector(".background" + lqa_no);
	CloseModal.classList.remove("show");
}
$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	 
	  })
	  
	  
	  var html = "";
	  
	//Q&A부분
	  var lqa_title = new Array();	
	  var lqa_no = new Array();
	  var lqa_date = new Array();
	  var c_name = new Array();
	  var u_id = new Array();
	  var confirm = new Array();
	  <c:forEach items="${list }" var = "l">
	 	lqa_title.push("${l.lqa_title}");
		lqa_no.push("${l.lqa_no}");
		lqa_date.push("${l.lqa_date}");
		c_name.push("${l.c_name}");
		u_id.push("${l.u_id}");
		confirm.push("${l.confirm}");
	 </c:forEach>
	 for(var i=0 in lqa_no){ 
		html = "<tr>";
		html += "<td>" + lqa_no[i] + "</td>";
		html += "<td>" + c_name[i] + "</td>";
		html += "<td>"+"<a href=javascript:OpenModal('"+lqa_no[i]+"')>" + lqa_title[i] + "</a></td>";
		html += "<td>" + u_id[i] + "</td>";
		html += "<td>" + lqa_date[i] + "</td>";
		html += "<td>" + confirm[i] + "</td>";		
		html += "</tr>"; 
		$("#detailTable").append(html); 
	 }
	 
	 
	 //자유게시판 
	 
	 
	 
	 
	 
	  
	});
	
	
function select(category){
	let c_name = category;
	let arr = new Array();
	 
	var html = "";
	$.ajax({
		url : "./community_category",
		type : "get",
		dataType : "json",
		data : {"c_name" : c_name},
		success : function(data){	
			var result = data.json;
				$("#detailTable").empty();  
				$("#detailTable").remove();  
			for(var i=0 in data){                                                        
				html = "<tr>";
				html += "<td>" + data[i].lqa_no + "</td>";
				html += "<td>" + data[i].c_name + "</td>";
				html += "<td>" + data[i].lqa_title + "</td>";
				html += "<td>" + data[i].u_id + "</td>";
				html += "<td>" + data[i].lqa_date + "</td>";
				html += "<td>" + data[i].confirm + "</td>";
				html += "</tr>";
				
				$("#detailTable").append(html);   
			}
		},
		error : function(){
			alert("실패 ㅠ");
			}
		});
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
				<div class ="search" style="width:500px; margin: 0 auto">
					 <input type="search" id="lqa_title" name="lqa_title" class="form-control" style="width: 350px;display: inline-block;" placeholder="궁금한 질문을 검색해보세요!" onkeyup="enterkey()">
					 <button type="button" id="search" class="btn btn-success" style="display: inline-block;" onclick="search()">Search</button>
				</div>	
				<br>
				<c:forEach items="${category }" var = "c">
					<p id="category"><a href="javascript:select('${c.c_name}')">${c.c_name }</a></p>		
				</c:forEach>
				<br>	
				<div id="content">
				<div class="row tab-content current" id="tab-1">
					<table class="table table-hover" style="width: 90%; margin: 0 auto" >
						  <thead class="thead-dark">
						    <tr>
						      <th>ID no.</th>
						      <th>강의카테고리</th>
						      <th>제목</th>
						      <th>닉네임</th>
						      <th>날짜</th>
						      <th>답변여부</th>
						    </tr>
						  </thead>
						<c:forEach items="${list }" var = "list"> 
						  <tbody id = "detailTable">					   
						  </tbody>
							<div class="background background${list.lqa_no }">
								<div class="window">
									<div class="popup">
										<button id="closebtn" class="btn btn-outline-dark" onclick="CloseModal(${list.lqa_no});">닫기</button>
										<h2 class="card-title" style="text-align: left">${list.lqa_title }</h2>
										<h6 style="text-align: left"> ${list.u_id }</h6>
										<p class="card-text">
										<div style="border: 1px solid rgb(201, 236, 219);height:150px; text-align: left"><strong>Q.</strong> ${list.lqa_content }</div><br>
										
										<c:choose>
											<c:when test="${list.lqar_content ne null }">
											<div style="border: 1px solid rgb(201, 236, 219);height:150px; text-align: left"><strong>A.</strong>${list.lqar_content } </div>
											</c:when>
											<c:otherwise>
											<div style="border: 1px solid rgb(201, 236, 219);height:150px; text-align: left"><strong>선생님이 답변작성중이에요</strong> </div>
											</c:otherwise>
										</c:choose>
									</div>
										
								</div>
							</div>
						</c:forEach>
						</table>
						<div id="pagination" style="text-align: center;"><ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage" /></div>
			</div>			
	
					
		<div class="row tab-content" id="tab-2">
		<c:if test="${sessionScope.u_id ne null }">
		<div id = "more_btn_div" align="right">
			<a class="btn btn-primary" role="button" href="./boardWrite" style="width: 120px;float:right; margin: 4px auto; margin-right: 30px;">Write</a>	
		</div>
		</c:if>		
		 <table class="table table-hover" style="width: 90%; margin: 0 auto" >
						  <thead class="thead-dark">
						    <tr>
						      <th>no.</th>
						      <th>제목</th>
						      <th>닉네임</th>
						      <th>날짜</th>
						 	  <th>조회수</th>
						    </tr>
						  </thead>
						<c:forEach items="${board }" var = "b"> 
						  <tbody id = "detailTable">
						   <tr>
						   		<td>${b.b_no }</td>
						   		
						   		<td style="text-align: left"><a href = "./boardDetail?b_no=${b.b_no }"> ${b.b_title } </a> <small>[${b.commentTotal }]</small></td>
						   		<td>${b.u_nickname }</td>
						   		<td>${b.b_date }</td>
						   		<td>${b.b_view }</td>
						   </tr>
						  </tbody>
						</c:forEach>
			</table>	
		</div> 

		
	
		
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