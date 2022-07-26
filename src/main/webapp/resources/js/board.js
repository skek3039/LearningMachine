/**
 * 
 */

$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
}); 
 
 //모달 
 function OpenModal(lqa_no){
	var OpenModal = document.querySelector(".background" + lqa_no);
	OpenModal.classList.add("show");
}

function CloseModal(lqa_no) {
	var CloseModal = document.querySelector(".background" + lqa_no);
	CloseModal.classList.remove("show");
}

//댓글작성
function boardCommentwrite(){
	const comment = $('#comment').val();
	const b_no = document.getElementById('b_no').value;
	if(comment == ""){
		alert("1자이상 280자이하로 입력해주세요.");
		return false;
	}
	$.ajax({
			url : "./boardCommentwrite",
			type : "post",
			dataType : "html",
			data : {"b_no" : b_no,
					"br_content" : comment
			}, 
			success : function(data){
				if(data == 1){
					 $('#comment').val("");
					 location.reload();			 
				}else {
					 $('#comment').val("");
					location.reload();			
				}
			},error : function(data){
				alert("통신에러");
			}
	});
}
 
 
 
 //댓글수 제한
$(document).on("keyup","#comment", function(){
		$("#textCount").html("댓글쓰기<br>(" + $(this).val().length + "/280)");
		if($(this).val().length > 280){
			$(this).val($(this).val().substring(0, 280));
			$("#textCount").html("댓글쓰기<br>(280/280)")
		}
});


function commentwrite(u_id){
	if(u_id == ""){
		alert("로그인한 사용자만 댓글을 달 수 있습니다.");
		location.href="./login";
	}
}