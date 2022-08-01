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
			height: 100%;
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
	
		* {
			margin: 0;
			padding: 0;
		}
	
		.chat_wrap .header {
			width: 100%;
			font-size: 14px;
			padding: 15px 0;
			background: #F18C7E;
			color: white;
			text-align: center;
			position: fixed;
			margin: 0 auto;
		}
	
		.chat_wrap .chat {
			width: 100%;
			padding-top: 40px;
			padding-bottom: 40px;
		}
	
		.chat_wrap .chat ul {
			width: 100%;
			list-style: none;
		}
	
		.chat_wrap .chat ul li {
			width: 100%;
		}
	
		.chat_wrap .chat ul li.left {
			text-align: left;
		}
	
		.chat_wrap .chat ul li.right {
			text-align: right;
		}
	
		.chat_wrap .chat ul li>div {
			font-size: 13px;
		}
	
		.chat_wrap .chat ul li>div.sender {
			margin: 10px 20px 0 20px;
			font-weight: bold;
		}
	
		.chat_wrap .chat ul li>div.message {
			display: inline-block;
			word-break: break-all;
			margin: 5px 20px;
			max-width: 75%;
			border: 1px solid #888;
			padding: 10px;
			border-radius: 5px;
			background-color: #FCFCFC;
			color: #555;
			text-align: left;
		}
	
		.chat_wrap .input-div {
			position: fixed;
			bottom: 0;
			width: 90%;
			background-color: #FFF;
			text-align: center;
			border-top: 1px solid #F18C7E;
			resize: none;
			margin: 5px;
		}
	
		.chat_wrap .input-div>textarea {
			width: 100%;
			height: 80px;
			border: none;
			padding: 10px;
			resize: none;
		}
	
		.format {
			display: none;
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
		
		function SendMessage(to_id){

			var to_id = $('#from_id_forsend').val();
			var le_content = $('#message_text').val();

			$.ajax({
				url : "/web/SendMessage",
				data : {
					to_id : to_id,
					le_content : le_content
				},
				type : "POST",
				success : function(result){

					if(result == 1){
						$('#message_text').val("");
						 mclosemodal();
						 mopenmodal(to_id);
					}else if(result == 0){

						alert('권한이 없어요');
					}else if(result == 2){
						
						alert('메시지를 입력해주세요');
					}
				}
			});

		}

		function  mopenmodal(from_id) {
				var  mopenmodal = document.querySelector(".backgroundChat");
				$.ajax({
					url: "/web/ChattingRoom?from_id=" + from_id,
					type: "get",
					success: function (data) {
						console.log(data);
						var temp = '';
						temp += '<input id = "from_id_forsend" type="hidden" value='+ from_id+'>';
						temp +=('<ul class = "chatting" style = "margin= 70px;">');
						for (var i = 1; i <= Object.keys(data).length; i++) {
							var message = data[i];

							if (message.del == 0) {
								if (message.send == 1 && message.del == 0) {
									temp +=('<li class = "right">');
									temp +=('<div class = "sender">');
									temp +=('<span>'+ '나' +'<small style = "color=red; textalign : center;" onclick="DeleteMessage('+message.le_no+')" >x</small></span>');
									temp +=('</div>');
									if(message.le_confirm == 1){
										temp +=('<small>읽음</small>');
									}
									temp +=('<div class = "message">');
									temp +=('<span>'+ message.le_content +'</span>');
									temp +=('</div>');
									temp +=('</li>');
								} else {
									temp +=('<li class = "left">');
									temp +=('<div class = "sender">');
									temp +=('<span>'+ message.u_nickname +'</span>');
									temp +=('</div>');
									temp +=('<div class = "message">');
									temp +=('<span>'+ message.le_content +'</span>');
									temp +=('</div>');
									temp +=('</li>');
								}
							}
						}
						temp +=('</ul>');
						$('.chat').append(temp);
						$('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
					}
				});

			 mopenmodal.classList.add("show");
		}
		function DeleteMessage(le_no) {
				var to_id = $('#from_id_forsend').val();
				if (confirm('메시지를 삭제하시겠습니까?\n 이미 읽은 메시지는 나에게서만 삭제됩니다.')) {
					$.ajax({
						url: "/web/DeleteMessage?le_no=" + le_no,
						type: "get",
						success: function (result) {
							if (result == 1) {
								$('#message_text').val("");
								 mclosemodal();
								 mopenmodal(to_id);
							} else if (result == 0) {

								alert('권한이 없어요');
							} else if (result == 2) {

								alert('메시지를 입력해주세요');
							}
						}

					})
				}
			}

		function  mclosemodal() {
			var  mclosemodal = document.querySelector(".backgroundChat");
			$('.chat').empty();
			 mclosemodal.classList.remove("show");
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
					<tbody>
						<c:forEach items="${MessageList}" var="i">
							<tr onclick=" mopenmodal('${i.from_id}')">
								<td>${i.from_nickname}</td>
								<td>${i.le_content}</td>
								<td>${i.le_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="background backgroundChat">
		<div class="window">
			<div class="popup">
				<div class="chat_wrap">
					<div class="header">
						CHAT
						<button a class="btn btn-outline-light"  id="closebtn" style="color: black; margin : 4px;" onclick=" mclosemodal()">닫기</button>
					</div>
					<div class="chat" style="overflow-y: auto; height: 500px;">
					</div>
					<div class="input-div">
						<textarea id = "message_text"></textarea><a class="btn btn-primary" onclick="SendMessage()">전송하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>