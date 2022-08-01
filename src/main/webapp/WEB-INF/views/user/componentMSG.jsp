<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
	<style>
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
		function SendMessage(to_id) {

			var to_id = $('#from_id_forsend').val();
			var le_content = $('#message_text').val();

			$.ajax({
				url: "/web/SendMessage",
				data: {
					to_id: to_id,
					le_content: le_content
				},
				type: "POST",
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
			});

		}

		function mopenmodal(from_id) {
			var mopenmodal = document.querySelector(".backgroundChat");
			$.ajax({
				url: "/web/ChattingRoom?from_id=" + from_id,
				type: "get",
				success: function (data) {
					console.log(data);
					var temp = '';
					temp += '<input id = "from_id_forsend" type="hidden" value=' + from_id + '>';
					temp += ('<ul class = "chatting" style = "margin= 70px;">');
					for (var i = 1; i <= Object.keys(data).length; i++) {
						var message = data[i];

						if (message.del == 0) {
							if (message.send == 1) {
								temp += ('<li class = "right">');
								temp += ('<div class = "sender">');
								temp += ('<span>' + '나' + '<small style = "color=red; textalign : center;" onclick="DeleteMessage(' + message.le_no + ')" >x</small></span>');
								temp += ('</div>');
								temp += ('<div class = "message">');
								temp += ('<span>' + message.le_content + '</span>');
								temp += ('</div>');
								temp += ('</li>');
							} else {
								temp += ('<li class = "left">');
								temp += ('<div class = "sender">');
								temp += ('<span>' + message.u_nickname + '</span>');
								temp += ('</div>');
								temp += ('<div class = "message">');
								temp += ('<span>' + message.le_content + '</span>');
								temp += ('</div>');
								temp += ('</li>');
							}
						}
					}
					temp += ('</ul>');
					$('.chat').append(temp);
					$('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
				}
			});

			mopenmodal.classList.add("show");
		}
		function DeleteMessage(le_no) {
			var to_id = $('#from_id_forsend').val();
			if (confirm('메시지를 삭제하시겠습니까?')) {
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

		function mclosemodal() {
			var mclosemodal = document.querySelector(".backgroundChat");
			$('.chat').empty();
			mclosemodal.classList.remove("show");
		}

	</script>
	<div class="background backgroundChat">
		<div class="window">
			<div class="popup">
				<div class="chat_wrap">
					<div class="header">
						CHAT
						<button a class="btn btn-outline-light" id="closebtn" style="color: black; margin : 4px;"
							onclick=" mclosemodal()">닫기</button>
					</div>
					<div class="chat" style="overflow-y: auto; height: 500px;">
					</div>
					<div class="input-div">
						<textarea id="message_text"></textarea><a class="btn btn-primary" onclick="SendMessage()">전송하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>