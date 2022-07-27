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
<link rel="preconnect" href="https://fonts.gstatic.com" />
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
<script src="./resources/js/board.js"></script>

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
function OpenModal(br_no){
	var OpenModal = document.querySelector(".background" + br_no);
	OpenModal.classList.add("show");
}

function CloseModal(br_no) {
	var CloseModal = document.querySelector(".background" + br_no);
	CloseModal.classList.remove("show");
}

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

function commentDelete(br_no,b_no){
	if(confirm("댓글을 삭제하시겠습니까?")){
		location.href="./commentDelete?br_no="+br_no + "&b_no="+b_no;
	}
}

function commentUpdate(br_no, b_no){
	if(confirm("댓글을 수정하시겠습니까?")){
		
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
			<h3>&nbsp;&nbsp; Community</h3> <small>비방또는 비난등의 글은 무통보로 삭제됩니다.</small>
			<hr style="border: solid 1px;">
		</div>
		<div style="padding-top: 20px; text-align: center;">
				<br>
				<br>	
		<c:if test="${sessionScope.u_nickname eq boardDetail.u_nickname }">
		<div id = "more_btn_div" align="right">
			<a class="btn btn-primary" role="button" href="./boardModify?b_no=${boardDetail.b_no }" style="width: 100px; margin: 4px auto;float:right;  margin-right: 100px;">수정</a>	
			<a class="btn btn-primary" role="button" href="./boardDelete.do?b_no=${boardDetail.b_no }" style="width: 100px;margin: 4px auto; float:right; margin-right: 100px;">삭제</a>	
		</div>
		</c:if>	
				<div id="content">
				<div class="row tab-content current" id="tab-1">
					<table class="table" style="width: 90%; height:100%; margin: 0 auto" >
						  <thead class="thead-dark">
						    <tr>
						      <th style="width: 100px;">No. ${boardDetail.b_no }</th>
						      <th style="background-color :#F0FFF0; width: 100px;">제목</th>
						      <th style="text-align: left;">${boardDetail.b_title }</th>
						      <th style="border-color: gray">${boardDetail.u_nickname }</th>
						      <th style="background-color :#F0FFF0; width: 100px;">조회수</th>
						      <th style="width: 80px;">${boardDetail.b_view }</th>
						      <th style="background-color :#F0FFF0; width: 100px;">날짜</th>
						      <th style="width: 150px;">${boardDetail.b_date }</th>
						    </tr>
						  </thead>
						  <tbody id = "detailTable">
						  	<tr>
						  		<td colspan="8" style="height: 600px;"> ${boardDetail.b_content } </td>
						  	</tr>
						  	<c:forEach items="${comment }" var="c">
						  	<tr>
						  		<td colspan="8" style="height: 15px; text-align: left;background-color :#F0FFF0;">${c.u_nickname }
						  		<c:if test="${sessionScope.u_nickname eq c.u_nickname }">
						  			<img alt="수정" src="./img/update.png" onclick="OpenModal(${c.br_no})" style="width: 15px;cursor: pointer; height: 15px;">
						  			<img alt="삭제" src="./img/delete.png" onclick="commentDelete('${c.br_no}','${boardDetail.b_no }')" style="width: 15px;cursor: pointer; height: 15px;">
						  		</c:if>
						  		<div class="background background${c.br_no }">
								<div class="window">
									<div class="popup">
										<button id="closebtn" class="btn btn-outline-dark" onclick="CloseModal(${c.br_no});">닫기</button>
										<h2 class="card-title" style="text-align: left">${c.u_nickname }</h2>
										<p class="card-text">
										<input type="text" value="${c.br_content }" style="border: 1px solid rgb(201, 236, 219); width: 750px; height: 300px;"><br>
										<button type="submit" class="btn btn-outline-dark" onclick="commentUpdate('${c.br_no}','${boardDetail.b_no }')" >수정</button>
										</p>
									</div>
								</div>
							</div>
						  		<fmt:parseDate value="${c.br_date}" var="time" pattern="yyyy-MM-dd HH:mm:ss.S" />
            				    <fmt:formatDate value="${time }" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
			
						  		<small style="text-align: right; float: right;">${time }</small> </td>
						  	</tr>
						  	<tr>
						  		<td colspan="8" style="height: 80px;text-align: left;">${c.br_content }</td>
						  	</tr>
						  	</c:forEach>
						  </tbody>	
						  <tfoot>
						  	<tr>
						  	<td colspan="7" style="height: 100%;">
						  	<c:if test="${sessionScope.u_id ne null }">
						  		<textarea id="comment" placeholder="불쾌감을 주는 댓글은 예고없이 삭제처리 될 수 있습니다." required="required" style="width: 100%;" onclick="commentwrite('${sessionScope.u_id }')"></textarea>
						  	</c:if>
						  	<c:if test="${sessionScope.u_id eq null }">
								<textarea id="comment" placeholder="로그인후 사용해주세요." style=" background-color: #F0FFF0;width: 100%; display: inline; "  onclick="commentwrite('${sessionScope.u_id }')"></textarea>
							</c:if>
							</td>
								<td>
						  		<input type="hidden" id="b_no" value="${boardDetail.b_no }">
						  		<button id="textCount" onclick="boardCommentwrite()" class ="btn btn-outline-dark" style="width: 100%;">댓글쓰기<br>(0/280)</button>
						  		
						  		</td>
						  	</tr>
						  	
						  </tfoot>	 			   						   
						</table>
			</div>			
					
					
		<div class="row tab-content" id="tab-2">
		
		
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