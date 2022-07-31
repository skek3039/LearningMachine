<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>러닝머신 :: ${Video.v_videotitle }</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">

	<!-- Favicon -->
	<link href="img/favicon.ico" rel="icon">

	<!-- Google Web Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
		rel="stylesheet">

	<!-- Icon Font Stylesheet -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

	<!-- Libraries Stylesheet -->
	<link href="./resources/lib/animate/animate.min.css" rel="stylesheet">
	<link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

	<!-- Customized Bootstrap Stylesheet -->
	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">

	<!-- Template Stylesheet -->
	<link href="./resources/css/style.css" rel="stylesheet">
	<link href="./resources/css/admin.css" rel="stylesheet">

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/lib/wow/wow.min.js"></script>
	<script src="./resources/lib/easing/easing.min.js"></script>
	<script src="./resources/lib/waypoints/waypoints.min.js"></script>
	<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="./resources/summernote/summernote-lite.js"></script>
	<script src="./resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
	<!-- Template Javascript -->
	<script src="./resources/js/main.js"></script>
	<style>
		.dropdown {
			position: fixed;
			display: inline-block;
			z-index: 100;
			margin: auto;
			display: inline-block;
		}

		.dropbtn_icon {
			font-family: 'Material Icons';
		}

		.dropbtn {
			border: 1px solid rgb(37, 37, 37);
			border-radius: 4px;
			background-color: #f5f5f5;
			text-align: center;
			font-weight: 400;
			color: rgb(37, 37, 37);
			padding: 12px;
			width: 50px;
			cursor: pointer;
			font-size: 12px;
		}

		.dropdown-content {
			display: none;
			position: absolute;
			z-index: 1;
			/*다른 요소들보다 앞에 배치*/
			font-weight: 400;
			background-color: #f9f9f9;
			min-width: 200px;
		}

		.dropdown-content a {
			display: block;
			text-decoration: none;
			color: rgb(37, 37, 37);
			font-size: 12px;
			padding: 12px 20px;
		}

		.dropdown-content a:hover {
			background-color: #ececec
		}

		.dropdown:hover .dropdown-content {
			display: block;
		}

		#video {
			position: relative;
			height: 0;
			padding-bottom: 56.25%
		}

		iframe {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
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

		#closebtn {
			position: fixed;
			top: 0;
			right: 0;
			padding: 10px;
			z-index: 500;
		}

		#ubutton {

			width: 24px;
		}

		#chat_container {
    	height: 50vh;
        overflow: auto;
    }
    #chat_body {
    	position: relative;
        display: flex;
        align-items: flex-start;
        justify-content: flex-start;
        flex-direction: column;
        width: 100%;
        height: 100%;
    }
    #chat_messages {
        position: relative;
        display: flex;
        align-items: flex-start;
        justify-content: flex-start;
        flex-direction: column;
        flex-wrap: wrap;
        width: 100%;
        padding: 16px;
	}
    .message_wrap.send {
        flex-direction: row-reverse;
        margin-left: auto;
    }
    .message_wrap {
        position: relative;
        display: flex;
        align-items: flex-end;
        justify-content: flex-end;
        margin: 12px 0;
    }
    .message_wrap.send > span.message {
        background-color: #94b5e7;
    }
    .message_wrap > span.message {
        padding: 12px 24px;
        border-radius: 8px;
    }
    .message_wrap.receive > span.message {
        background-color: #eee;
    }
    .message_wrap.receive > span.message_time {
        margin-left: 8px;
    }
	</style>
	<script>
		$(document).ready(function () {
			$('.summernote').summernote({
				placeholder: 'content',
				minHeight: 370,
				maxHeight: null,
				focus: true,
				lang: 'ko-KR'
			});
		});
		function OpenModal(lqa_no, from_id) {
			var OpenModal = document.querySelector(".background" + lqa_no);
			OpenModal.classList.add("show");
		}

		function CloseModal(lqa_no) {
			var CloseModal = document.querySelector(".background" + lqa_no);
			CloseModal.classList.remove("show");
		}
	</script>
</head>

<body>
	<jsp:include page="./header.jsp" />
	<div style="padding-top: 150px;">

	</div>
	<div class="container-xxl bg-white p-0">
		<c:choose>
			<c:when test="${MessageList eq null}">
				<p>메시지가 없어요</p>
			</c:when>
			<c:otherwise>
				<table class="table" style="text-align: center;">
					<thead>
						<th style="width: 20%;">닉네임</th>
						<th style="width: 55%;">내용</th>
						<th style="width: 25%;">작성일</th>
					</thead>
					<c:forEach items="${MessageList}" var="i">
						<tbody>
							<tr onclick="OpenModal('Chat', '${i.from_id}')">
								<td>${i.from_nickname}</td>
								<td>${i.le_content}</td>
								<td>${i.le_date}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="background backgroundChat">
		<div class="window">
			<div class="popup">
				<button id="closebtn" type="button" onclick="CloseModal('Chat')">닫기</button>
				<div id="chat_container">
					<div id="chat_body">
						<div id="chat_messages">.<div class="message_wrap send">
							<span class="message">메시지 발송 테스트</span>
							<span class="message_time">2021-01-27 15:18:50</span>
						  </div>
					
						  <div class="message_wrap send">
							<span class="message">ㅎㅎ</span>
							<span class="message_time">2021-01-27 15:22:43</span>
						  </div>
					
						  <div class="message_wrap receive">
							<span class="message">ㅎㅇ</span>
							<span class="message_time">2021-01-27 15:23:07</span>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>